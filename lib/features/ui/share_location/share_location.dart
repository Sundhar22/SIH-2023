import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late LatLng primaryLocation;

class ShareMyLocation extends StatefulWidget {
  const ShareMyLocation({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  State<ShareMyLocation> createState() => _ShareMyLocationState();
}

class _ShareMyLocationState extends State<ShareMyLocation> {
  late Timer _timer;

  late dynamic locationPlot;

  //
  @override
  void initState() {
    super.initState();
    // setMapStyle();

    _addCustomMarkers();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  //
  late List<MarkerData> _customMarkers;
  late String mapStyle;

//
  void _addCustomMarkers() async {
    _customMarkers = [];

    List<LatLng> markers = await createLocationCordinates();

    print("Marker Length  is ${markers.length}");

    _customMarkers.add(
      MarkerData(
        marker: const Marker(
          markerId: MarkerId("value"),
          position: LatLng(13.218636, 79.100619),
        ),
        child: generateHelpSymbol(true),
      ),
    );

    for (int i = 0; i < markers.length; i++) {
      _customMarkers.add(
        MarkerData(
          marker: Marker(
            markerId: MarkerId(i.toString()),
            position: markers[i],
          ),
          child: generateHelpSymbol(false),
        ),
      );
    }

    setState(() {});

    print("Custom Marker Length is ${_customMarkers.length}");

    // LocationPlot
  }

  void setMapStyle() {
    DefaultAssetBundle.of(context)
        .loadString(
          "assets/map/agency_style.json",
        )
        .then((value) => mapStyle = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            onPressed: () async {
              setState(() {});

              // await fetchLocation(widget.roomId);
            },
            child: const Text("Share My Location")),
      ),
      body: SafeArea(
        child: CustomGoogleMapMarkerBuilder(
          customMarkers: _customMarkers,
          builder: (BuildContext context, Set<Marker>? markers) {
            if (markers == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(13.216487, 79.100448),
                zoom: 10,
              ),
              markers: markers,
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(mapStyle);
              },
            );
          },
        ),
      ),
    );
  }

  generateHelpSymbol(bool isLocation) {
    return isLocation
        ? const Column(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.emergency,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 1),
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.red,
              )
            ],
          )
        : const Column(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.emergency,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 1),
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.amber,
              )
            ],
          );
  }

  // Retrieve Employee Location
}

Future<dynamic> getDocValue(String docId, String employeeId) async {
  try {
    // Reference to the document
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("employees").doc(employeeId);

    // Get the document
    DocumentSnapshot docSnapshot = await docRef.get();

    print("The docSnapshot recieved  : $docSnapshot.data()");

    if (docSnapshot.exists) {
      // Document exists, return its data
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      print(
          "The location of lat & long ${data['location'].longitude} ${data['location'].longitude}");

      return LatLng(data['location'].latitude, data['location'].longitude);
    } else {
      return null;
    }
  } catch (error) {
    // Handle errors
    rethrow;
  }
}

Future<List<LatLng>> createLocationCordinates() async {
  // Example usage
  List<String> employeeIds = [
    "mitunpokkisham@gmail.com",
    "sanjaiofficial02@gmail.com",
    "thenmozhi09@gmail.com",
    "harinishivani2004@gmail.com"
  ];

  List<LatLng> locaCord = [];

  for (var employeeId in employeeIds) {
    try {
      dynamic value = await getDocValue("employees", employeeId);

      print("The value in the createLocation is is $value");

      if (value != null) {
        // Do something with the retrieved value
        locaCord.add(value);
      }
    } catch (error) {
      // Handle errors
      print("The error caught $error");
    }
  }

  print("Loca Cord is $locaCord");
  return locaCord;
}
