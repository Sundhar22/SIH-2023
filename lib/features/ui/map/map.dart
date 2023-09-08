import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;
  LatLng center = const LatLng(10.367312, 77.980293);
  LatLng fire = const LatLng(10.367312, 77.980293);
  LatLng tree = const LatLng(9.925201, 78.119774);
  double radius = 10000;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _addCustomMarkers();
    _startRippleAnimation();
  }

  void _startRippleAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(center, 15.0),
      );
    });

    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
    });
  }

  void _addCustomMarkers() async {
    markers.add(Marker(
      flat: true,
      markerId: const MarkerId('fire_marker'),
      position: fire,
      icon: await _createCustomMarker('assets/images/fire.png'),
    ));
    markers.add(Marker(
      flat: true,
      markerId: const MarkerId('tree_marker'),
      position: tree,
      icon: await _createCustomMarker('assets/images/tree.png',),
    ));

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
      appBar: AppBar(
        title: const Text('Map with Radius Marker and custom marker'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 10.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: Set<Marker>.of(markers),
        circles: {
          Circle(
            circleId: CircleId('radius_circle'),
            center: fire,
            radius: radius,
            fillColor: Colors.red.withOpacity(0.3),
            strokeColor: Colors.red,
            strokeWidth: 2,
          ),
          Circle(
            circleId: CircleId('radius_circle'),
            center: tree,
            radius: radius,
            fillColor: Colors.blue.withOpacity(0.3),
            strokeColor: Colors.blue,
            strokeWidth: 2,
          ),
        },
      ),
    );
  }
}

Future<BitmapDescriptor> _createCustomMarker(String imagePath) async {
  const ImageConfiguration config = ImageConfiguration(size: Size(10, 10));
  final BitmapDescriptor bitmapDescriptor =
      await BitmapDescriptor.fromAssetImage(config, imagePath);
  return bitmapDescriptor;
}
