import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:sih_2023/features/ui/onboarding/view/signin.dart';
import 'package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart';
import '../widgets/upload_image_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Account"),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UploadImageWidget(),
                const SizedBox(
                  height: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    FormWidget(hinttext: "Name of Agency"),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Head",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    FormWidget(hinttext: "Name of Head"),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    FormWidget(hinttext: "Phone Number"),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Area Of Expertise",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    AreaOfExpertise(),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LocationContainer(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Register",
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      shape: const CircleBorder(),
                      child: const Icon(Icons.arrow_forward_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AreaOfExpertise extends StatefulWidget {
  const AreaOfExpertise({super.key});

  @override
  State<AreaOfExpertise> createState() => _AreaOfExpertiseState();
}

class _AreaOfExpertiseState extends State<AreaOfExpertise> {
  String selectedExpertise = 'Select Expertise';
  List<String> expertise = [
    'Select Expertise',
    'Food',
    'Medical',
    'Clothing',
    'Fire',
    'Air force'
  ];
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        value: selectedExpertise,
        hint: const Text('Selected Position'),
        onChanged: (newValue) {
          setState(() {
            selectedExpertise = newValue!;
          });
        },
        items: expertise.map((expertise) {
          return DropdownMenuItem<String>(
            value: expertise,
            child: Text(expertise),
          );
        }).toList(),
      ),
    );
  }
}

class LocationContainer extends StatefulWidget {
  const LocationContainer({super.key});

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  LatLng? currentLocation;
  GoogleMapController? mapController;
  String locationMessage = 'Location';
  bool isLocationUpdated = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    try {
      LatLng _currentLocation = await location
          .getLocation()
          .then((value) => LatLng(value.latitude!, value.longitude!));
      setState(() {
        currentLocation = _currentLocation;
        isLocationUpdated = true;
        locationMessage = "Your Location is Updated";
      });

      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentLocation!,
              zoom: 15.0,
            ),
          ),
        );
        print(currentLocation);
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 177,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: GoogleMap(
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12.0,
            ),
            markers: currentLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('selected_location'),
                      position: currentLocation!,
                      draggable: false,
                      onDrag: (newPosition) {
                        setState(() {
                          currentLocation = newPosition;
                        });
                      },
                      onDragEnd: (value) {},
                    ),
                  }
                : {},
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      isLocationUpdated ? locationMessage : 'Location',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.white;
                      },
                    ),
                  ),
                  onPressed: getCurrentLocation,
                  child: const Text(
                    'Get Location',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
