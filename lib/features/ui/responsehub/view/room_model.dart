import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  String roomName;
  String disasterType;
  double radius;
  String state;
  String district;
  List location;
  List<String> agencies;
 
  Timestamp createdOn;

  Room({
    required this.roomName,
    required this.radius,
    required this.disasterType,
    required this.state,
    required this.district,
    required this.location,
    required this.agencies,
    required this.createdOn,
  });

  Map<String, dynamic> toJson() {
    return {
      'radius': radius,
      'roomName': roomName,
      'disasterType': disasterType,
      'state': state,
      'district': district,
      'location': location,
      'agencies': agencies,
      'createdOn': createdOn,
    };
  }
}
