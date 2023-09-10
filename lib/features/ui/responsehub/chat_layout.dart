import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/chat.dart';
import 'package:sih_2023/features/ui/map/view/map.dart';

class TemporaryEmergencyRooms extends StatelessWidget {
  const TemporaryEmergencyRooms({
    super.key,
    required this.integratedReliefRoomName,
    required this.integratedReliefRoomCause,
    required this.integratedReliefRoomAgencies,
    required this.integratedReliefLocation,
    required this.integratedCreatedOn,
    required this.integratedroomId
  });

  final String integratedReliefRoomName;
  final String integratedReliefRoomCause;
  final String integratedReliefLocation;
  final List<dynamic> integratedReliefRoomAgencies;
  final String integratedCreatedOn;
  final String integratedroomId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen(roomId: integratedroomId,)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.all(15),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 1),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                integratedReliefRoomName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              Description(
                createdOn: integratedCreatedOn,
              ),
              LocationInfo(
                  cause: integratedReliefRoomCause,
                  location: integratedReliefLocation),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
                },
                child: const Text("View Scenario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  Description({super.key, required this.createdOn});
  String createdOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          Icon(Icons.gps_fixed, color: Colors.red),
          SizedBox(width: 5),
          Text(createdOn),
        ],
      ),
    );
  }
}

class RescueAgencyInvolved extends StatelessWidget {
  const RescueAgencyInvolved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: Text("FP"),
        ),
        CircleAvatar(
          radius: 15,
          child: Text("RP"),
        ),
      ],
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    super.key,
    required this.location,
    required this.cause,
  });

  final String location, cause;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(Icons.location_pin, color: Colors.red),
            const SizedBox(width: 5),
            Text(location,
                style: const TextStyle(color: Colors.black, fontSize: 15)),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            const Icon(Icons.whatshot, color: Colors.red),
            Text(
              cause,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(width: 15),
        const RescueAgencyInvolved(),
      ],
    );
  }
}
