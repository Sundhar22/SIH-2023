import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/chat/view/chat.dart';
import 'package:sih_2023/features/ui/responsehub/view/push_room_data.dart';

class ResponseHubMapScreen extends StatefulWidget {
  const ResponseHubMapScreen({super.key});

  @override
  State createState() => _ResponseHubMapScreenState();
}

class _ResponseHubMapScreenState extends State<ResponseHubMapScreen> {
  late GoogleMapController mapController;

  double radius = 500;
  List<Marker> markers = [];
  List<Circle> circles = [];
  FirebaseService firebaseService = FirebaseService();
  List<Map<String, dynamic>> roomsData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> data = await firebaseService.fetchAllRooms();
    setState(() {
      roomsData = data;
      print(roomsData);
    });
    _addCustomMarkers();
    _addCircles();
  }

  Future<void> _addCustomMarkers() async {
    for (int i = 0; i < roomsData.length; i++) {
      markers.add(Marker(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return LocationInfoBottomSheet(
                roomData: roomsData[i],
              );
            },
          );
        },
        markerId: MarkerId(roomsData[i]['roomId']),
        position:
            LatLng(roomsData[i]['location'][0], roomsData[i]['location'][1]),
        icon: await _createCustomMarker('assets/images/fire.png'),
      ));
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _addCircles() async {
    for (int i = 0; i < roomsData.length; i++) {
      circles.add(Circle(
        circleId: CircleId(roomsData[i]['roomId']),
        center:
            LatLng(roomsData[i]['location'][0], roomsData[i]['location'][1]),
        radius: roomsData[i]['radius'],
        fillColor: Colors.red.withOpacity(0.3),
        strokeColor: Colors.red,
        strokeWidth: 2,
      ));
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: roomsData.isEmpty && markers.isEmpty && circles.isEmpty
          ? const CircularProgressIndicator()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    roomsData[0]['location'][0], roomsData[0]['location'][1]),
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              },
              markers: Set<Marker>.of(markers),
              circles: Set<Circle>.of(circles),
            ),
    );
  }
}

class LocationInfoBottomSheet extends StatelessWidget {
  LocationInfoBottomSheet({super.key, required this.roomData});
  var roomData;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              roomData['disasterType'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text('Room Name: ${roomData['roomName']}'),
          const SizedBox(height: 8),
          Text('Location: ${roomData['district']}, ${roomData['state']}'),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                                roomName: roomData['roomName'],
                                roomId: roomData['roomId'],
                              )));
                },
                child: const Text(
                  'Go To Room',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<BitmapDescriptor> _createCustomMarker(String imagePath) async {
  const ImageConfiguration config = ImageConfiguration();
  final BitmapDescriptor bitmapDescriptor =
      await BitmapDescriptor.fromAssetImage(config, imagePath);
  return bitmapDescriptor;
}
