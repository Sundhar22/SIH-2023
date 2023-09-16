import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/ui/chat/chat.dart';
import 'package:sih_2023/features/ui/map/view/scenario_map.dart';

class TemporaryEmergencyRooms extends StatefulWidget {
  const TemporaryEmergencyRooms(
      {super.key,
      required this.integratedReliefRoomName,
      required this.integratedReliefRoomCause,
      required this.integratedReliefRoomAgencies,
      required this.integratedReliefLocation,
      required this.integratedCreatedOn,
      required this.integratedroomId,
      required this.integratedlatLng,
      required this.radius});

  final String integratedReliefRoomName;
  final String integratedReliefRoomCause;
  final String integratedReliefLocation;
  final List<dynamic> integratedReliefRoomAgencies;
  final String integratedCreatedOn;
  final String integratedroomId;
  final List integratedlatLng;
  final double radius;

  @override
  State<TemporaryEmergencyRooms> createState() =>
      _TemporaryEmergencyRoomsState();
}

class _TemporaryEmergencyRoomsState extends State<TemporaryEmergencyRooms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                roomName: widget.integratedReliefRoomName,
                roomId: widget.integratedroomId,
              ),
            ),
          );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.integratedReliefRoomName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteDocumentById(
                        context,
                        'rooms',
                        widget.integratedroomId,
                      );
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              Description(
                createdOn: widget.integratedCreatedOn,
              ),
              LocationInfo(
                  cause: widget.integratedReliefRoomCause,
                  location: widget.integratedReliefLocation),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScenarioMapScreen(
                              initialLocation: LatLng(
                                  widget.integratedlatLng[0],
                                  widget.integratedlatLng[1]),
                              radius: widget.radius,
                            )),
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

  Future<void> deleteDocumentById(
      context, String collectionName, String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .delete();
      showAdaptiveDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("Success"),
              content: const Text("Room Deleted Successfully"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          });
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}

class Description extends StatelessWidget {
  Description({super.key, required this.createdOn});
  String createdOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          const Icon(Icons.gps_fixed, color: Colors.red),
          const SizedBox(width: 5),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                cause,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        const RescueAgencyInvolved(),
      ],
    );
  }
}
