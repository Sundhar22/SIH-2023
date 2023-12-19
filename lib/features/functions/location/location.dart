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

  List locations = eLocations['eLocation'];

  List updateLocation = [];

  for (var i = 0; i < eLocations.length; i++) {
    if (locations[i].docId == userData) {
      updateLocation.add(
        LocationModel(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          docId: docId,
        ),
      );
    } else {
      updateLocation.add(locations[i]);
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  await firestore.collection("rooms").doc(docId).update({
    'eLocation': updateLocation,
  });
}
