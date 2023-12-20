import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart';

class RelayAction extends StatefulWidget {
  const RelayAction({super.key});

  @override
  State<RelayAction> createState() => _RelayActionState();
}

class _RelayActionState extends State<RelayAction> {
  String selectedSizeType = '';
  List solo = ['Enter your name'];
  TextEditingController nameController = TextEditingController();
  TextEditingController teamSizeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  LocationData? currentLocation;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    try {
      currentLocation = await location.getLocation();
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
              zoom: 15.0,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Relay Action"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitleWidget(titleContent: "Name"),
              const SizedBox(
                height: 10,
              ),
               FormWidget(hinttext: "Enter your name", controller: nameController,),
              const SizedBox(
                height: 14,
              ),
              const CustomTitleWidget(titleContent: "Select Your Size"),
              const SizedBox(height: 10),
              RadioListTile<String>(
                title: const Text('Solo'),
                value: 'Solo',
                groupValue: selectedSizeType,
                onChanged: (value) {
                  setState(() {
                    selectedSizeType = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Team'),
                value: 'Team',
                groupValue: selectedSizeType,
                onChanged: (value) {
                  setState(() {
                    selectedSizeType = value!;
                  });
                },
              ),
              if (selectedSizeType == 'Team')
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    CustomTitleWidget(titleContent: "Team Size"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(
                      hinttext: "Enter team size",
                      controller: teamSizeController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTitleWidget(titleContent: "Phone Number"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(
                      controller: phoneNumberController,
                      hinttext: "Enter Your Phone Number",
                    ),
                  ],
                ),
              if (selectedSizeType == 'Solo')
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleWidget(titleContent: "Number"),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(
                      controller: phoneNumberController,
                      hinttext: "Enter Your Phone number",
                    ),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              const CustomTitleWidget(titleContent: "Location"),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: SizedBox(
                  height: 177,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.7749, -122.4194),
                      zoom: 12.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('marker_1'),
                        position: currentLocation != null
                            ? LatLng(currentLocation!.latitude!,
                                currentLocation!.longitude!)
                            : LatLng(37.7749, -122.4194),
                        infoWindow: InfoWindow(title: 'Marker 1'),
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: getCurrentLocation,
                    child: Text(
                      "Get Location",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}