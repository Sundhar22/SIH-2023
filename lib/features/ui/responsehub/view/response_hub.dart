import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/responsehub/view/chat_layout.dart';
import 'package:sih_2023/features/ui/responsehub/view/create_room.dart';
import 'package:sih_2023/features/ui/responsehub/view/push_room_data.dart';

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
        leading: const SizedBox(),
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
