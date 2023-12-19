import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScenarioMapScreen extends StatefulWidget {
  const ScenarioMapScreen({
    super.key,
    required this.roomId,
    required this.initialLocation,
    required this.radius,
  });

  final LatLng initialLocation;
  final double radius;
  final String roomId;

  @override
  State<ScenarioMapScreen> createState() => _ScenarioMapScreenState();
}

class _ScenarioMapScreenState extends State<ScenarioMapScreen> {
  late Timer _timer;

  late dynamic locationPlot;

  //
  @override
  void initState() {
    super.initState();

    setMapStyle();

    // Setting Stream
    locationPlot = [
      GeoPoint(
        widget.initialLocation.latitude,
        widget.initialLocation.longitude,
      )
    ];

    // Timer
    _timer = Timer.periodic(
      const Duration(seconds: 20),
      (timer) {
        retrieveEmployeeLocation();
      },
    );

    //
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
    print("Custom Marker Function  Called");
    _customMarkers = [];

    // Duplicate Marker for testing
    _customMarkers.add(
      MarkerData(
        marker: Marker(
          markerId: const MarkerId("value"),
          position: widget.initialLocation,
        ),
        child: generateHelpSymbol(),
      ),
    );

    // LocationPlot
    if (locationPlot.isNotEmpty) {
      for (var i = 0; i < locationPlot.length; i++) {
        _customMarkers.add(
          MarkerData(
            marker: Marker(
              markerId: MarkerId("Marker $i"),
              position:
                  LatLng(locationPlot[i].latitude, locationPlot[i].longitude),
              infoWindow: const InfoWindow(
                title: "Rescue Squad",
              ),
            ),
            child: generateHelpSymbol(),
          ),
        );
      }
    }

    if (mounted) {
      setState(() {});
    }
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
      body: SafeArea(
        child: CustomGoogleMapMarkerBuilder(
          customMarkers: _customMarkers,
          builder: (BuildContext context, Set<Marker>? markers) {
            if (markers == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.initialLocation,
                zoom: 8,
                bearing: 20,
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

  generateHelpSymbol() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.emergency,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 1),
        CircleAvatar(
          radius: 2,
          backgroundColor: Colors.red,
        )
      ],
    );
  }

  // Retrieve Employee Location
  Future<void> retrieveEmployeeLocation() async {
    try {
      final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(widget.roomId)
          .get();

      if (docSnapshot.exists) {
        final Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          print("Dynamic Location Marker Function  Called");

          final dynamic location = data['employeeLocation'];

          print(location.toString());

          setState(
            () {
              locationPlot = location;

              locationPlot.add(
                GeoPoint(
                  widget.initialLocation.latitude,
                  widget.initialLocation.longitude,
                ),
              );
              ();
              _addCustomMarkers();
            },
          );
        }
      } else {}
    } catch (error) {}
  }
}
