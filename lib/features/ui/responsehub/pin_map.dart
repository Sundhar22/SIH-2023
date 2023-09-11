import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/responsehub/push_room_data.dart';
import 'package:sih_2023/features/ui/responsehub/room_model.dart';

class PinMapScreen extends StatefulWidget {
  final LatLng initialLocation;
  final String roomName;
  final String disasterType;
  final String selectedState;
  final String selectedDistrict;

  PinMapScreen(
      {required this.initialLocation,
      required this.roomName,
      required this.disasterType,
      required this.selectedState,
      required this.selectedDistrict});

  @override
  _PinMapScreenState createState() => _PinMapScreenState();
}

class _PinMapScreenState extends State<PinMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  late Placemark _selectedAddress;
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
        title: Text('Location Map'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  _mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: widget.initialLocation,
                zoom: 15.0,
              ),
              markers: _selectedLocation != null
                  ? {
                      Marker(
                        markerId: MarkerId('selected_location'),
                        position: _selectedLocation!,
                        infoWindow: InfoWindow(
                          title: 'Selected Location',
                        ),
                        draggable: true, // Make the marker draggable
                        onDragEnd: (newPosition) {
                          setState(() {
                            _selectedLocation = newPosition;
                            _fetchAddress(newPosition);
                          });
                        },
                      ),
                    }
                  : {},
            ),
          ),
          Text(
            'Tap and hold to pin your location',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Selected Location: ${_selectedAddress.street},  ${_selectedAddress.locality},${_selectedAddress.administrativeArea}, ${_selectedAddress.country}',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  firebaseService.pushRoomData(Room(
                    createdOn: Timestamp.now(),
                    roomName: widget.roomName,
                    disasterType: widget.disasterType,
                    state: widget.selectedState,
                    district: widget.selectedDistrict,
                    location: [
                      _selectedLocation!.latitude,
                      _selectedLocation!.longitude
                    ],
                    agencies: [],
                  ));
                  showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Room Created'),
                          content:
                              const Text('Room has been created successfully'),
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
                child: const Text(
                  'Create Room',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  Future<void> _fetchAddress(LatLng coordinates) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude, coordinates.longitude);
    if (placemarks.isNotEmpty) {
      final selectedAddress = placemarks[0];
      setState(() {
        _selectedAddress = selectedAddress;
      });
    }
  }
}
