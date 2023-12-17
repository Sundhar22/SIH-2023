import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/responsehub/controller/hub_controller.dart';
import 'package:sih_2023/features/ui/responsehub/view/chat_layout.dart';
import 'package:sih_2023/features/ui/responsehub/view/create_room.dart';
import 'package:sih_2023/features/ui/responsehub/view/verification.dart';
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.warning_amber_rounded,
              size: 27,
            ),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
          const SizedBox(
            width: 11,
          )
        ],
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: BeveledRectangleBorder(),
      builder: (BuildContext builderContext) {
        return SizedBox(
          height: 350,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Approvals",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ApprovalWidget(
                name: "Madurai Fire Accident",
                loc: "2nd Blue Cross Road",
                type: "· Natural Disaster",
              )
            ],
          ),
        );
      },
    );
  }
}

class ApprovalWidget extends StatelessWidget {
  ApprovalWidget({super.key, required this.name, required this.loc, required this.type});
  String name;
  String loc;
  String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(getLogoText(name)),
        ),
        title: Text(name),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(type),
            Text(loc)
          ]
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VerificationPage()),
          );
        },
        trailing: const Icon(
          Icons.error_outline_rounded,
          color: Colors.red,
          size: 27,
        ),
      ),
    );
  }
}
