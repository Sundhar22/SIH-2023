import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  File? _image;

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Registration Form",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.black87,
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey,
              backgroundImage: _image != null ? FileImage(_image!) : null,
            ),
            SizedBox(
              height: 65,
              width: 150,
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.white;
                      },
                    ),
                  ),
                  onPressed: _pickImageFromGallery,
                  child: const Text(
                    "Upload your logo",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const FormWidget(hinttext: "Name of the agency"),
            const SizedBox(
              height: 20,
            ),
            const FormWidget(hinttext: "Name of the Director"),
            const SizedBox(
              height: 20,
            ),
            const AreaOfExpertise(),
            const SizedBox(
              height: 20,
            ),
            const LocationContainer(),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Text(
                  "Register",
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({super.key, required this.hinttext});
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: TextField(
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
            border: InputBorder.none,
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        hint: const Text("Area of Expertise"),
        isExpanded: true,
        iconEnabledColor: Colors.deepPurpleAccent,
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
  String locationMessage = '';

  void _getLocation() async {
    var location = Location();
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
    try {
      var currentLocation = await location.getLocation();
      setState(() {
        locationMessage =
            "Lat: ${currentLocation.latitude}  Long: ${currentLocation.longitude}";
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
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.deepPurpleAccent,
            ),
            Text(
              locationMessage,
              style: const TextStyle(fontSize: 13),
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
                    color: Colors.deepPurpleAccent,
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
