import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewWidget extends StatelessWidget {
  final LatLng mapLocation; // Longitude of the location

  const MapPreviewWidget({
    Key? key,
    required this.mapLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: mapLocation, zoom: 12.0),
        markers: {
          const Marker(
            draggable: true,
            markerId: MarkerId('marker_1'),
            position: LatLng(13.272441, 79.118764),
            infoWindow: InfoWindow(title: 'Marker 1'),
          )
        },
      ),
    );
  }
}
