import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScenarioMapScreen extends StatefulWidget {
  ScenarioMapScreen({super.key, required this.initialLocation});
  LatLng initialLocation;

  @override
  State createState() => _ScenarioMapScreenState();
}

class _ScenarioMapScreenState extends State<ScenarioMapScreen> {
  late GoogleMapController mapController;

  double radius = 500;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _addCustomMarkers();
  }

  void _addCustomMarkers() async {
    markers.add(Marker(
      markerId: const MarkerId('fire_marker'),
      position: widget.initialLocation,
      icon: await _createCustomMarker('assets/images/fire.png'),
    ));
    // markers.add(Marker(
    //   markerId: const MarkerId('tree_marker'),
    //   position: tree,
    //   icon: await _createCustomMarker('assets/images/tree.png'),
    // ));

    //  markers.add(Marker(
    //     markerId: const MarkerId('center_marker'),
    //     position: center,
    //     icon: await _createCustomMarker('assets/images/NDA.png'),
    //   ));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialLocation,
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: Set<Marker>.of(markers),
        circles: {
          Circle(
            circleId: const CircleId('radius_circle'),
            center: widget.initialLocation,
            radius: radius,
            fillColor: Colors.red.withOpacity(0.3),
            strokeColor: Colors.red,
            strokeWidth: 2,
          ),
        },
      ),
    );
  }
}

Future<BitmapDescriptor> _createCustomMarker(String imagePath) async {
  final ImageConfiguration config = const ImageConfiguration();
  final BitmapDescriptor bitmapDescriptor =
      await BitmapDescriptor.fromAssetImage(config, imagePath);
  return bitmapDescriptor;
}
