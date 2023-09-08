import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/chat.dart';

class ResponseHubChatLayout extends StatelessWidget {
  const ResponseHubChatLayout({
    super.key,
    required this.integratedReliefRoomName,
    required this.integratedReliefRoomCause,
    required this.integratedReliefRoomAgencies,
    required this.integratedReliefLocation,
  });

  final String integratedReliefRoomName;
  final String integratedReliefRoomCause;
  final String integratedReliefLocation;
  final List<String> integratedReliefRoomAgencies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatScreen()));
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
              const Description(),
              LocationInfo(
                  cause: integratedReliefRoomCause,
                  location: integratedReliefLocation),
              TextButton(
                onPressed: () {},
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
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          Icon(Icons.gps_fixed, color: Colors.red),
          SizedBox(width: 5),
          Text("Created on 2nd September 2023"),
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
        CircleAvatar(radius: 15),
        CircleAvatar(radius: 15),
        CircleAvatar(radius: 15),
        CircleAvatar(radius: 15),
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
            const Icon(Icons.flood_sharp, color: Colors.amber),
            Text(
              cause,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const RescueAgencyInvolved(),
      ],
    );
  }
}
