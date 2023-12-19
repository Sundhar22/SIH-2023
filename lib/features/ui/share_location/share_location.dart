import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/functions/location/location.dart';

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
    setMapStyle();
    // Timer
    _timer = Timer.periodic(
      const Duration(seconds: 20),
      (timer) {
        fetchLocation(widget.roomId);
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
        marker: const Marker(
          markerId: MarkerId("value"),
          position: LatLng(13.217362, 79.095670),
        ),
        child: generateHelpSymbol(true),
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
            child: generateHelpSymbol(false),
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            onPressed: () async {
              await fetchLocation(widget.roomId);
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
                target: LatLng(18.657871, 79.711575),
                zoom: 10,
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

  generateHelpSymbol(bool isLocation) {
    // return const

    isLocation
        ? const Column(
            children: [
              CircleAvatar(
                radius: 10,
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
          )
        : const Column(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.emergency,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 1),
              CircleAvatar(
                radius: 2,
                backgroundColor: Colors.amber,
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

          _customMarkers = [];
          for (var i = 0; i < location.length; i++) {
            _customMarkers.add(
              MarkerData(
                marker: Marker(
                  markerId: MarkerId(location[i].docId),
                  position: LatLng(location[i].latitude, location[i].longitude),
                ),
                child: generateHelpSymbol(false),
              ),
            );
          }

          setState(
            () {
              locationPlot = _customMarkers;
              ();
              _addCustomMarkers();
            },
          );
        }
      } else {}
    } catch (error) {}
  }
}
