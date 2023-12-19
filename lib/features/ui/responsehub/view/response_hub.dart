import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
                        return curRoom['status'] == 1
                            ? TemprorayEmergencyRoomWidget(
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
                              )
                            : SizedBox();
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
      backgroundColor: Colors.white,
      context: context,
      shape: BeveledRectangleBorder(),
      builder: (BuildContext builderContext) {
        return GetX<ResponseHubController>(
          builder: (getxController) {
            return RefreshIndicator(
              onRefresh: () => getxController.fetchResponseHubs(),
              child: getxController.roomsData.isNotEmpty
                  ? Scrollbar(
                      child: ListView.builder(
                      itemCount: getxController.roomsData.length,
                      itemBuilder: (context, index) {
                        Map curRoom = getxController.roomsData[index];
                        return curRoom['status'] == 0
                            ? ApprovalWidget(
                                roomId: curRoom['roomId'],
                                RoomName: curRoom['roomName'] ?? "Unnamed",
                                disasterType: curRoom['disasterType'],
                                district: curRoom['district'],
                                state: curRoom['state'],
                                mapLocation: LatLng(curRoom['location'][0],
                                    curRoom['location'][1]),
                                reportedBy: '',
                              )
                            : SizedBox();
                      },
                    ))
                  : const EmptyScreen(),
            );
          },
        );
      },
    );
  }
}

class ApprovalWidget extends StatefulWidget {
  ApprovalWidget(
      {super.key,
      required this.RoomName,
      required this.disasterType,
      required this.state,
      required this.district,
      required this.reportedBy,
      required this.mapLocation,
      required this.roomId});
  String RoomName;
  String disasterType;
  String state;
  String district;
  String reportedBy;
  String roomId;
  LatLng mapLocation;

  @override
  State<ApprovalWidget> createState() => _ApprovalWidgetState();
}

class _ApprovalWidgetState extends State<ApprovalWidget> {
  Placemark? _selectedAddress;
  @override
  void initState() {
    _fetchAddress(widget.mapLocation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _selectedAddress == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(getLogoText(widget.RoomName)),
              ),
              title: Text(widget.RoomName),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.disasterType),
                    Text(
                        '${_selectedAddress!.locality},${_selectedAddress!.administrativeArea}, ${_selectedAddress!.country}')
                  ]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerificationPage(
                            roomId: widget.roomId,
                            roomName: widget.RoomName,
                            disasterType: widget.disasterType,
                            district: widget.district,
                            state: widget.state,
                            mapLocation: widget.mapLocation,
                            reportedBy: '',
                          )),
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

  Future<void> _fetchAddress(LatLng coordinates) async {
    print('fetching....');
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude, coordinates.longitude,
        localeIdentifier: "en");
    if (placemarks.isNotEmpty) {
      final selectedAddress = placemarks[0];
      setState(() {
        _selectedAddress = selectedAddress;
      });
    }
  }
}
