import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng center = const LatLng(9.920556085930551, 78.11152826989836);
  LatLng fire = const LatLng(9.920556085930551, 78.11152826989836);
  LatLng tree = const LatLng(9.925201, 78.119774);
  double radius = 500;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _addCustomMarkers();
    _startRippleAnimation();
  }

  void _startRippleAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(center, 15.0),
      );
    });

    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
    });
  }

  void _addCustomMarkers() async {
    markers.add(Marker(
      markerId: const MarkerId('fire_marker'),
      position: fire,
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
          target: center,
          zoom: 12.0,
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
            center: fire,
            radius: radius,
            fillColor: Colors.red.withOpacity(0.3),
            strokeColor: Colors.red,
            strokeWidth: 2,
          ),
          // Circle(
          //   circleId: CircleId('radius_circle'),
          //   center: tree,
          //   radius: radius,
          //   fillColor: Colors.blue.withOpacity(0.3),
          //   strokeColor: Colors.blue,
          //   strokeWidth: 2,
          // ),
        },
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
