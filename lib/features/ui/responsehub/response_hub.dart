import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/chat/chat.dart';
import 'package:sih_2023/features/ui/responsehub/create_room.dart';
import 'package:sih_2023/features/ui/responsehub/push_room_data.dart';
import 'package:sih_2023/features/ui/responsehub/show_quick_actions.dart';

class ResponseHub extends StatefulWidget {
  const ResponseHub({super.key});

  @override
  State<ResponseHub> createState() => _ResponseHubState();
}

class _ResponseHubState extends State<ResponseHub> {
  FirebaseService firebaseService = FirebaseService();
  List<Map<String, dynamic>> roomsData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> data = await firebaseService.fetchAllRooms();
    setState(() {
      roomsData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 0,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CreateRoom();
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        elevation: 3,
        title: const Text("Response Hub"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _fetchData(),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: roomsData.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> room = roomsData[index];
                return TemprorayEmergencyRoomWidget(
                  radius: room['radius'],
                  integratedlatLng: room['location'],
                  integratedroomId: room['roomId'],
                  integratedCreatedOn: Timestamp.fromMillisecondsSinceEpoch(
                          room['createdOn'].millisecondsSinceEpoch)
                      .toDate()
                      .toString(),
                  integratedReliefRoomName: room['roomName'],
                  integratedReliefRoomCause: room['disasterType'],
                  integratedReliefRoomAgencies: room['agencies'],
                  integratedReliefLocation: room['district'],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TemprorayEmergencyRoomWidget extends StatelessWidget {
  const TemprorayEmergencyRoomWidget(
      {super.key,
      required this.integratedReliefRoomName,
      required this.integratedReliefRoomCause,
      required this.integratedReliefLocation,
      required this.integratedReliefRoomAgencies,
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: GestureDetector(
          onTap: () {
            showQuickActions(
                context, integratedReliefRoomName, integratedroomId);
          },
          child: CircleAvatar(
            radius: 30,
            child: Text(
              getLogoText(integratedReliefRoomName),
            ),
          ),
        ),
        title: Text(
          integratedReliefRoomName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Created on ${integratedCreatedOn.substring(8, 10)}th ${monthMap[integratedCreatedOn.substring(5, 7)]} ${integratedCreatedOn.substring(0, 4)}",
        ),
        trailing: const Icon(Icons.arrow_outward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                roomName: integratedReliefRoomName,
                roomId: integratedroomId,
              ),
            ),
          );
        },
      ),
    );
  }
}
