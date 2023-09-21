import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/ui/chat/view/filetype.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              height: size * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Create \nAccount",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SignInUpload()
                    ],
                  ),
                  const Column(
                    children: [
                      FormWidget(hinttext: "Name of Agency"),
                      SizedBox(
                        height: 15,
                      ),
                      FormWidget(hinttext: "Name of Head"),
                      SizedBox(
                        height: 15,
                      ),
                      FormWidget(hinttext: "Phone Number"),
                      SizedBox(
                        height: 15,
                      ),
                      AreaOfExpertise(),
                      SizedBox(
                        height: 15,
                      ),
                      LocationContainer(),
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
                        child: const Icon(Icons.arrow_forward_rounded),
                        shape: const CircleBorder(),
                      )
                    ],
                  )
                ],
              ),
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
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(27),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        hint: const Padding(
          padding: EdgeInsets.only(left: 5, top: 3),
          child: Text(
            "Area of Expertise",
            style: TextStyle(color: Colors.black),
          ),
        ),
        isExpanded: true,
        iconEnabledColor: Colors.black,
        value: dropdownvalue,
        icon: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_circle_down_sharp,
            size: 30,
          ),
        ),
        onChanged: (String? newValue) {
          setState(
            () {
              dropdownvalue = newValue!;
            },
          );
        },
        items: <String>['Food', 'Health', 'Emergency', 'Fire', 'Police']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
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
  // Future<bool> requestLocationPermission() async {
  //   final permission = await location.requestPermission();
  //   if (permission == PermissionStatus.granted) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // };

  // Future<bool> checkLocationPermission() async {
  //   final permission = await location.hasPermission();
  //   if (permission == PermissionStatus.granted) {
  //     return true;
  //   } else {
  //     return await requestLocationPermission();
  //   }
  // }
  String locationMessage = 'Location';
  bool isLocationUpdated = false;

  void _getLocation() async {
    var location = Location();

    try {
      var currentLocation = await location.getLocation();
      setState(() {
        locationMessage = "Your Location is Updated";
        isLocationUpdated = true;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        locationMessage = "Could not fetch location.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(27),
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
              onPressed: _getLocation,
              child: const Text(
                'Get Location',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
