import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

class AgencyMapScreen extends StatefulWidget {
  const AgencyMapScreen({super.key});

  @override
  State createState() => _AgencyMapScreenState();
}

class _AgencyMapScreenState extends State<AgencyMapScreen> {
  late GoogleMapController mapController;
  LatLng center = const LatLng(9.920556085930551, 78.11152826989836);
  List<Marker> markers = [];
  Map<String, BitmapDescriptor> mapMarkers = {};
  late BitmapDescriptor defaultDescriptor;

  @override
  void initState() {
    super.initState();
    _createCustomMarkers().then((value) {});
    setState(() {});
  }

  Future<void> _createCustomMarkers() async {
    List<String> expertise = expertiseMapping.values.toList();
    for (int index = 0; index < expertise.length; index++) {
      mapMarkers[expertise[index]] = await _createImageToBitMapDescriptor(
        "assets/images/markers/$index.jpg",
      );
    }
    _addCustomMarkers();
  }

  void _addCustomMarkers() async {
    defaultDescriptor =
        await _createImageToBitMapDescriptor("assets/images/markers/0.jpg");
    for (AgencyModel agencyEntry in allAgencyModels) {
      if (agencyEntry.agencyLat != 0.0) {
        markers.add(
          Marker(
            markerId: MarkerId(agencyEntry.agencyName),
            position: LatLng(agencyEntry.agencyLat, agencyEntry.agencyLong),
            icon: mapMarkers[agencyEntry.agencyExpertise] ?? defaultDescriptor,
            infoWindow: InfoWindow(
              title: agencyEntry.agencyName,
              snippet: agencyEntry.agencyOperatingState,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                    );
                  },
                );
              },
            ),
          ),
        );
      }
    }

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
          zoom: 5.4,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(
            () {
              mapController = controller;
            },
          );
        },
        markers: Set<Marker>.of(markers),
      ),
    );
  }
}

Future<BitmapDescriptor> _createImageToBitMapDescriptor(
    String imagePath) async {
  const ImageConfiguration config = ImageConfiguration();
  final BitmapDescriptor bitmapDescriptor =
      await BitmapDescriptor.fromAssetImage(config, imagePath);
  return bitmapDescriptor;
}
