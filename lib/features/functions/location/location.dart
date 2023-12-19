import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/constants/constants.dart';


Future<void> fetchLocation(String docId) async{

Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    // return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    // return;
  }
}

_locationData = await location.getLocation();
print( "The location data is  :  $_locationData");
eLocation =  LatLng(_locationData.latitude! , _locationData.longitude!)
;

print(eLocation);





   final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('your_collection_name');

     DocumentSnapshot<Object?> snapshot =    await collectionReference.doc(docId).get();

     print(snapshot);
        
  

  // Method to retrieve document by ID


}