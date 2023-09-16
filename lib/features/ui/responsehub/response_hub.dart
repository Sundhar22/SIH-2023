import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/responsehub/chat_layout.dart';
import 'package:sih_2023/features/ui/responsehub/create_room.dart';
import 'package:sih_2023/features/ui/responsehub/push_room_data.dart';

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
    // _fetchData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const CircleBorder(),
          elevation: 10,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CreateRoom();
            }));
          }),
      appBar: AppBar(
          elevation: 3, title: const Text("Response Hub"), centerTitle: true),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _fetchData(),
          child: ListView.builder(
            itemCount: roomsData.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> room = roomsData[index];
              return TemporaryEmergencyRooms(
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
                  integratedReliefLocation: room['district']);
            },
          ),
        ),
      ),
    );
  }
}
