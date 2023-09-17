import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

class TestMapScreen extends StatefulWidget {
  const TestMapScreen({Key? key}) : super(key: key);

  @override
  State<TestMapScreen> createState() => _TestMapScreenState();
}

class _TestMapScreenState extends State<TestMapScreen> {
  late List<MarkerData> _customMarkers;
  Map<String, dynamic> mapMarkers = {};

  // Functions

  void _addCustomMarkers() async {
    _customMarkers = [];
    for (AgencyModel agencyEntry in allAgencyModels) {
      if (agencyEntry.agencyLat != 0.0) {
        _customMarkers.add(MarkerData(
          marker: Marker(
            markerId: MarkerId(agencyEntry.agencyName),
            position: LatLng(agencyEntry.agencyLat, agencyEntry.agencyLong),
          ),
          child: mapMarkers[agencyEntry.agencyExpertise],
        ));
      }
    }
  }

  // Function 2
  Future<void> _createCustomMarkers() async {
    List<String> expertise = expertiseMapping.values.toList();
    List<IconData> icons = agencyLogo.values.toList();
    for (int index = 0; index < expertise.length; index++) {
      mapMarkers[expertise[index]] =
          generateMarker(icons[index], agencyColors[index]);
    }
    _addCustomMarkers();
  }

  @override
  void initState() {
    super.initState();
    _createCustomMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agency Maps"),
      ),
      body: CustomGoogleMapMarkerBuilder(
        screenshotDelay: const Duration(seconds: 3),
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(18.931402, 78.930984),
              zoom: 4,
            ),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {},
          );
        },
      ),
    );
  }

  generateMarker(IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
            radius: 15,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            )),
        const SizedBox(height: 1),
        CircleAvatar(
          radius: 2,
          backgroundColor: color,
        )
      ],
    );
  }
}
