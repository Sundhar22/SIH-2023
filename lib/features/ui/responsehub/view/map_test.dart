import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_dialog.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

class FinalAgencyMapScreen extends StatefulWidget {
  const FinalAgencyMapScreen({Key? key}) : super(key: key);

  @override
  State<FinalAgencyMapScreen> createState() => _FinalAgencyMapScreenState();
}

class _FinalAgencyMapScreenState extends State<FinalAgencyMapScreen> {
  late List<MarkerData> _customMarkers;
  late String mapStyle;
  Map<String, dynamic> mapMarkers = {};

  void _addCustomMarkers() async {
    _customMarkers = [];
    for (AgencyModel agencyEntry in allAgencyModels) {
      if (agencyEntry.agencyLat != 0.0) {
        _customMarkers.add(
          MarkerData(
            marker: Marker(
              markerId: MarkerId(agencyEntry.agencyName),
              position: LatLng(agencyEntry.agencyLat, agencyEntry.agencyLong),
              infoWindow: InfoWindow(
                title: agencyEntry.agencyName,
                snippet: agencyEntry.agencyExpertise,
                onTap: () {
                  showDialogMap(
                    context,
                    agencyEntry.agencyName,
                    agencyEntry.agencyOperatingState,
                    agencyEntry.agencyExpertise,
                  );
                },
              ),
            ),
            child: mapMarkers[agencyEntry.agencyExpertise],
          ),
        );
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

  void setMapStyle() {
    DefaultAssetBundle.of(context)
        .loadString(
          "assets/map/agency_style.json",
        )
        .then((value) => mapStyle = value);
  }

  @override
  void initState() {
    super.initState();
    setMapStyle();
    _createCustomMarkers();
  }

  @override
  void dispose() {
    super.dispose();
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
              initialCameraPosition: const CameraPosition(
                target: LatLng(10.390824, 77.596976),
                zoom: 8,
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
