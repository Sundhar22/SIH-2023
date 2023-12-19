import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/location/model.dart';

Future<void> fetchLocation(String docId) async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      // return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      // return;
    }
  }

  locationData = await location.getLocation();
  eLocation = LatLng(locationData.latitude!, locationData.longitude!);

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('rooms');

  DocumentSnapshot<Object?> snapshot =
      await collectionReference.doc(docId).get();

  print("Document Snapshot : $snapshot ");

  Map<String, dynamic> eLocations = snapshot.data() as Map<String, dynamic>;

  print("Document eLocations Retrieved ");

  List locations = eLocations['eLocation'];

  print("List Locations retrieved . The retrieved location is $locations ");

  List updateLocation = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  print("Update Location array initiaised");

  if (locations.isEmpty) {
    print("It is empty");

    try {
      await firestore.collection("rooms").doc(docId).update(
        {
          "eLocation": [
            {
              "docId": docId,
              "latitude":
                  locationData.latitude, // Replace with actual latitude value
              "longitude":
                  locationData.longitude, // Replace with actual longitude value
            }
          ]
        },
      );
    } catch (e) {
      print("The error is $e");
    }
  } else {
    for (var i = 0; i < eLocations.length; i++) {
      print("Loop Initialised array initialised");

      if (locations[i].docId == userData) {
        updateLocation.add({
          'latitude': locationData.latitude!,
          'longitude': locationData.longitude!,
          'docId': docId,
        });
      } else {
        updateLocation.add(locations[i]);
      }
    }
  }

  await firestore.collection("rooms").doc(docId).update({
    'eLocation': updateLocation,
  });

  print("Updated Location Success");
}
