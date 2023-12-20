import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/call/videocall/groupcall.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/play_video.dart';
import 'package:sih_2023/features/ui/chat/view/update_resource_dialog.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/announcement_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/chat_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/document_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/emergency_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/image_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/map_preview.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/message_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/progress_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/request_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/resource_widget.dart';
import 'package:sih_2023/features/ui/chat_summarizer/rescue_summary_screen.dart';
import 'package:sih_2023/features/ui/chatsonic/ui/chatsonic.dart';
import 'package:swipe_plus/swipe_plus.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.roomId, required this.roomName});
  final String roomId;
  final String roomName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> options = [
    "Video Call",
    "Audio Call",
    "",
  ];
  String available_resources = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              radius: 12,
              child: Center(
                child: Text(
                  getLogoText(widget.roomName),
                ),
              ),
            ),
          ],
        ),
        elevation: 2,
        title: const Text(
          "Emergency Room",
          style: TextStyle(fontSize: 18),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 4.9,
        actions: [
          GestureDetector(
              onTap: () {
                sendMessageToRoom(
                    widget.roomId,
                    Message(
                        type: 'videoCall',
                        content: "Tap to join",
                        time: Timestamp.now(),
                        sender: ''));
              },
              child: const Icon(CupertinoIcons.phone)),
          const SizedBox(
            width: 10,
          ),
          // GestureDetector(
          //     onTap: () {

          //     },
          //     child: const Icon(CupertinoIcons.video_camera)),
          IconButton(
              onPressed: () {
                Get.to(() {
                  return ChatSonic();
                });
              },
              icon: const Icon(
                Icons.rocket,
              )),
          IconButton(
              onPressed: () {
                fetchDataAndConcatenate(widget.roomId).then((value) {
                  Get.to(() => RescueSummaryscreen(
                        chat_history: value,
                      ));
                });
              },
              icon: const Icon(
                Icons.summarize,
              )),
        ],
      ),
      bottomSheet: ChatMessenger(roomId: widget.roomId),
      body: StreamBuilder<List<Message>>(
        stream: getRoomChatStream(widget.roomId),
        builder: (context, snapshot) {
          
          if (!snapshot.hasData) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          List<Message> messages = snapshot.data!;
          return Scrollbar(
            thickness: .6,
            child: ListView.builder(
              reverse: false,
              padding: const EdgeInsets.only(bottom: 70, top: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];
                switch (message.type) {
                  case 'photo':
                    return ImageLayout(
                      imageLink: message.content,
                      isSentByMe: true,
                      messageTime: message.time.toDate(),
                    );
                  case 'document':
                    return DocumentLayout(
                      documentLink: message.content,
                      messageTime: message.time.toDate(),
                    );
                  case 'video':
                    return MessageTile(
                      message: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VideoMessageWidget(
                          videoUrl: message.content,
                        ),
                      ),
                      sender: widget.roomName,
                      sentByMe: true,
                    );

                  case 'Text':
                    return ChatMessageLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                      isSentByMe: true,
                    );
                  case 'accepted_request':
                    return Column(
                      children: [
                        const SizedBox(
                          height: 200,
                          width: 340,
                          child: MapPreviewWidget(
                            mapLocation: LatLng(13.272441, 79.118764),
                          ),
                        ),
                        ChatMessageLayout(
                          chatMsg: message.content['response'],
                          msgTime: message.time.toDate(),
                          isSentByMe: true,
                        ),
                      ],
                    );
                  case 'Request':
                    return RequestLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                    );
                  case 'resource_request':
                    return GestureDetector(
                      onTap: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => AlertDialog(
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           backgroundColor: Colors.greenAccent.shade100,
                        //           title: const Text("Resource Request"),
                        //           content: SingleChildScrollView(
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.start,
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: [
                        //                 Text(
                        //                   "Resource Type: ${message.content['resource_type']}",
                        //                   style: const TextStyle(
                        //                     color: Colors.black,
                        //                     fontSize: 17,
                        //                     fontWeight: FontWeight.normal,
                        //                   ),
                        //                 ),
                        //                 const SizedBox(
                        //                   height: 7,
                        //                 ),
                        //                 Text(
                        //                   "Resource: ${message.content['resource']}",
                        //                   style: const TextStyle(
                        //                     color: Colors.black,
                        //                     fontSize: 17,
                        //                     fontWeight: FontWeight.normal,
                        //                   ),
                        //                 ),
                        //                 const SizedBox(
                        //                   height: 7,
                        //                 ),
                        //                 Text(
                        //                   "Description: ${message.content['description']}",
                        //                   style: const TextStyle(
                        //                     color: Colors.black,
                        //                     fontSize: 17,
                        //                     fontWeight: FontWeight.normal,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           actions: [
                        //             ElevatedButton(
                        //               onPressed: () {
                        //                 Get.back();
                        //               },
                        //               child: const Text('OK'),
                        //             ),
                        //           ],
                        //         ));
                      },
                      child: SwipePlus(
                        onDragComplete: () {
                          
                          // showDialog(
                          //     context: context,
                          //     builder: (context) => AlertDialog(
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(10)),
                          //           backgroundColor:
                          //               Colors.greenAccent.shade100,
                          //           title: const Text("SEND RESOURCES"),
                          //           content: SingleChildScrollView(
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.start,
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Text(
                          //                   "Resource Type: ${message.content['resource_type']}",
                          //                   style: const TextStyle(
                          //                     color: Colors.black,
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.normal,
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 7,
                          //                 ),
                          //                 Text(
                          //                   "Needed Resource: ${message.content['resource']}",
                          //                   style: const TextStyle(
                          //                     color: Colors.black,
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.normal,
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 7,
                          //                 ),
                          //                 TextField(
                          //                   onChanged: (value) {
                          //                     setState(() {
                          //                       available_resources = value;
                          //                     });
                          //                   },
                          //                   decoration: const InputDecoration(
                          //                       hintText:
                          //                           "Enter the Available of resources"),
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 10,
                          //                 ),
                          //                 const MapPreview()
                          //               ],
                          //             ),
                          //           ),
                          //           actions: [
                          //             ElevatedButton(
                          //               onPressed: () {
                          //                 Get.back();
                          //               },
                          //               child: const Text('CANCEL'),
                          //             ),
                          //             ElevatedButton(
                          //               onPressed: () {
                          

                          //                 Get.back();
                          //               },
                          //               child: const Text('ACCEPT'),
                          //             ),
                          //           ],
                          //         ));
                          print(
                            message.content['resource_type'],
                            
                          );
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditPeopleRequestDialog(
                                roomId: widget.roomId,
                                resourceType: message.content['resource_type'],
                              );
                            },
                          );
                        },
                        child: MessageLayout(
                          widget: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              width: 300,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Resource Request",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    // Text(
                                    //     "${message.content['People']} People requested",
                                    //     style: const TextStyle(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.w500)),
                                    // for (var i
                                    //     in message.content['People_Types'])
                                    //   Text(
                                    //     '$i',
                                    //     style: const TextStyle(),
                                    //   ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    for (var i in message
                                        .content['resource_type'].keys)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '$i : ${message.content['resource_type'][i]['given']} / ${message.content['resource_type'][i]['quantity']}',
                                            style: const TextStyle(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                minHeight: 15,
                                                value: (message.content[
                                                            'resource_type'][i]
                                                        ['given'])
                                                    .toDouble()),
                                          )
                                        ],
                                      ),
                                  ]),
                            ),
                          ),
                          dateTime: DateTime.now(),
                        ),
                      ),
                    );

                  case 'Resource':
                    return ResouceLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                    );

                  case 'Emergency':
                    return EmergencyLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                    );

                  case 'Progress':
                    return ProgressLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                    );

                  case 'Announcement':
                    return AnnouncementLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
                    );

                  case 'videoCall':
                    return MessageLayout(
                        widget: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GroupCall()));
                          },
                          child: Container(
                            width: 125,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.lightGreenAccent.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(message.content),
                                const Icon(CupertinoIcons.phone)
                              ],
                            ),
                          ),
                        ),
                        dateTime: message.time.toDate());
                  default:
                    return SizedBox(
                      child: Text(
                        "${message.content} ${message.type}",
                      ),
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Stream<List<Message>> getRoomChatStream(String roomId) {
    return FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chatData')
        .orderBy('time')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs
            .map((doc) => Message.fromFirestore(doc))
            .toList();
      },
    );
  }
}

class MapPreview extends StatefulWidget {
  const MapPreview({super.key});

  @override
  State<MapPreview> createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
  LatLng? currentLocation;
  GoogleMapController? mapController;
  String locationMessage = 'Location';
  bool isLocationUpdated = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    try {
      LatLng currentLocation = await location
          .getLocation()
          .then((value) => LatLng(value.latitude!, value.longitude!));
      setState(() {
        currentLocation = currentLocation;
        isLocationUpdated = true;
        locationMessage = "Updated";
      });

      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentLocation,
              zoom: 15.0,
            ),
          ),
        );
        print(currentLocation);
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: GoogleMap(
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12.0,
            ),
            markers: currentLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('selected_location'),
                      position: currentLocation!,
                      draggable: false,
                      onDrag: (newPosition) {
                        setState(() {
                          currentLocation = newPosition;
                        });
                      },
                      onDragEnd: (value) {},
                    ),
                  }
                : {},
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      isLocationUpdated ? locationMessage : 'Location',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.white;
                      },
                    ),
                  ),
                  onPressed: getCurrentLocation,
                  child: const Text(
                    'Get Location',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<String> fetchDataAndConcatenate(String roomId) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    String resultString = '';

    // Fetch chat data using the room ID
    QuerySnapshot chatSnapshot =
        await _firestore.collection('rooms/$roomId/chatData').get();

    // Concatenate sender and content for each chat document
    for (QueryDocumentSnapshot chatDoc in chatSnapshot.docs) {
      String sender = chatDoc['sender'];
      String content = chatDoc['content'].toString();
      resultString += '$sender: $content\n';
    }

    // Return the final concatenated string
    return resultString;
  } catch (e) {
    print('Error fetching data: $e');
    return 'Error fetching data';
  }
}

class EditQuantitiesDialog extends StatefulWidget {
  final Map<String, dynamic> resources;

  const EditQuantitiesDialog({required this.resources});

  @override
  _EditQuantitiesDialogState createState() => _EditQuantitiesDialogState();
}

class _EditQuantitiesDialogState extends State<EditQuantitiesDialog> {
  late Map<String, TextEditingController> quantityControllers;

  @override
  void initState() {
    super.initState();
    quantityControllers = {};
    for (var resourceName in widget.resources.keys) {
      quantityControllers[resourceName] = TextEditingController(
        text: widget.resources[resourceName]['quantity'].toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Quantities'),
      content: Column(
        children: widget.resources.keys.map((resourceName) {
          return TextField(
            controller: quantityControllers[resourceName],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: '$resourceName Quantity'),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            updateQuantitiesInFirebase();

            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Update'),
        ),
      ],
    );
  }

  void updateQuantitiesInFirebase() {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference();

    // Update quantities for all resources
    quantityControllers.forEach((resourceName, controller) {
      int newQuantity = int.tryParse(controller.text) ?? 0;
      databaseReference.child(resourceName).update({
        'quantity': newQuantity,
      });
    });
  }
}
