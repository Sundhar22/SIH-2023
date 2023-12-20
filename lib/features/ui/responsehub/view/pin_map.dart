import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/responsehub/view/push_room_data.dart';
import 'package:sih_2023/features/ui/responsehub/view/room_model.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class PinMapScreen extends StatefulWidget {
  final LatLng initialLocation;
  final String roomName;
  final String disasterType;
  final String selectedState;
  final String selectedDistrict;

  const PinMapScreen(
      {super.key,
      required this.initialLocation,
      required this.roomName,
      required this.disasterType,
      required this.selectedState,
      required this.selectedDistrict});

  @override
  State createState() => _PinMapScreenState();
}

class _PinMapScreenState extends State<PinMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  Placemark? _selectedAddress;
  double radius = 1500;
  bool isFinished = false;
  FirebaseService firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;
    _fetchAddress(widget.initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body: _selectedAddress == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: GoogleMap(
                          mapToolbarEnabled: false,
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          onMapCreated: (controller) {
                            setState(() {
                              _mapController = controller;
                            });
                          },
                          initialCameraPosition: CameraPosition(
                            target: widget.initialLocation,
                            zoom: 13.0,
                          ),
                          circles: {
                            Circle(
                              circleId: const CircleId('radius_circle'),
                              center: _selectedLocation!,
                              radius: radius,
                              fillColor: Colors.red.withOpacity(0.3),
                              strokeColor: Colors.red,
                              strokeWidth: 2,
                            ),
                          },
                          markers: _selectedLocation != null
                              ? {
                                  Marker(
                                    markerId:
                                        const MarkerId('selected_location'),
                                    position: _selectedLocation!,
                                    draggable: true,
                                    onDrag: (newPosition) {
                                      setState(() {
                                        _selectedLocation = newPosition;
                                      });
                                    },
                                    onDragEnd: (value) {
                                      _fetchAddress(value);
                                    },
                                  ),
                                }
                              : {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${radius.ceil()} M',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Slider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.red[100],
                        value: radius,
                        onChanged: (value) {
                          setState(() {
                            radius = value;
                          });
                        },
                        min: 1000,
                        max: 10000),
                    const SizedBox(height: 30.0),
                    Text(
                        '${_selectedAddress!.street},  ${_selectedAddress!.locality},${_selectedAddress!.administrativeArea}, ${_selectedAddress!.country}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Center(
                      child: SwipeableButtonView(
                        
                        buttonText: 'SLIDE TO CREATE ROOM',
                        buttonWidget: Container(
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        activeColor: Colors.red,
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              isFinished = true;
                            });
                          });
                        },
                        // onFinish: () {},
                        onFinish: () async {
                          firebaseService.pushRoomData(Room(
                            radius: radius,
                            createdOn: Timestamp.now(),
                            status: 0,
                            roomName: widget.roomName,
                            disasterType: widget.disasterType,
                            state: widget.selectedState,
                            district: widget.selectedDistrict,
                            location: [
                              _selectedLocation!.latitude,
                              _selectedLocation!.longitude
                            ],
                            agencies: <String>[
                              userData,
                            ],
                          ));
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Room Created'),
                                  content: const Text(
                                      'Room has been created successfully'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
    );
  }

  Future<void> _fetchAddress(LatLng coordinates) async {
    print('fetching....');
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude, coordinates.longitude,
        localeIdentifier: "en");
    if (placemarks.isNotEmpty) {
      final selectedAddress = placemarks[0];
      setState(() {
        _selectedAddress = selectedAddress;
      });
    }
  }
}
