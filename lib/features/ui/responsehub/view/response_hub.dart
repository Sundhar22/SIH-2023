import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/responsehub/controller/hub_controller.dart';
import 'package:sih_2023/features/ui/responsehub/view/chat_layout.dart';
import 'package:sih_2023/features/ui/responsehub/view/create_room.dart';
import 'package:sih_2023/features/ui/universal/widgets/empty.dart';

class ResponseHub extends StatefulWidget {
  const ResponseHub({super.key});

  @override
  State<ResponseHub> createState() => _ResponseHubState();
}

class _ResponseHubState extends State<ResponseHub> {
  @override
  void initState() {
    super.initState();
    Get.put(ResponseHubController());
  }

  @override
  void dispose() {
    super.dispose();
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
        child: GetX<ResponseHubController>(
          builder: (getxController) {
            return RefreshIndicator(
              onRefresh: () => getxController.fetchResponseHubs(),
              child: getxController.roomsData.isNotEmpty
                  ? Scrollbar(
                      child: ListView.builder(
                      itemCount: getxController.roomsData.length,
                      itemBuilder: (context, index) {
                        Map curRoom = getxController.roomsData[index];
                        return TemprorayEmergencyRoomWidget(
                          radius: curRoom['radius'],
                          integratedlatLng: curRoom['location'],
                          integratedroomId: curRoom['roomId'] ?? "",
                          integratedCreatedOn:
                              Timestamp.fromMillisecondsSinceEpoch(
                                      curRoom['createdOn']
                                          .millisecondsSinceEpoch)
                                  .toDate()
                                  .toString(),
                          integratedReliefRoomName:
                              curRoom['roomName'] ?? "Unnamed",
                          integratedReliefRoomCause:
                              curRoom['disasterType'] ?? "Floods",
                          integratedReliefRoomAgencies:
                              curRoom['agencies'] ?? [],
                          integratedReliefLocation:
                              curRoom['district'] ?? "Tan",
                        );
                      },
                    ))
                  : const EmptyScreen(),
            );
          },
        ),
      ),
    );
  }
}
