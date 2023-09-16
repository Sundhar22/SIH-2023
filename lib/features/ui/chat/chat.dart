import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/return_time.dart';
import 'package:sih_2023/features/ui/chat/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/message_model.dart';
import 'package:sih_2023/features/ui/chat/message_tile.dart';
import 'package:sih_2023/features/ui/chat/pdf_viwer.dart';
import 'package:sih_2023/features/ui/chat/play_video.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.roomId, required this.roomName});
  final String roomId;
  final String roomName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void showListViewPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Agencies'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400, // Adjust the height as needed
            child: ListView.builder(
              itemCount: 10, // Replace with your data list length
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: ListTile(
                    leading: const CircleAvatar(),
                    title: const Text("TamilNadu Disaster Relay Agency"),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  CircleAvatar(
                    radius: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(getLogoText(widget.roomName)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      widget.roomName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                splashRadius: 5,
                onPressed: () {
                  showListViewPopup(context);
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
        bottomSheet: ChatMessenger(
          roomId: widget.roomId,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
          child: StreamBuilder<List<Message>>(
            stream: getRoomChatStream(widget.roomId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              List<Message> messages = snapshot.data!;
              return Scrollbar(
                thickness: .6,
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];
                    switch (message.type) {
                      case 'Photo':
                        return MessageTile(
                          message: Column(
                            children: [
                              MessageLayout(
                                widget: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    message.content,
                                  ),
                                ),
                                dateTime: message.time.toDate(),
                              )
                            ],
                          ),
                          sender: widget.roomName,
                          sentByMe: false,
                        );

                      case 'Document':
                        return MessageTile(
                          message: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return PdfViewerPage(link: message.content);
                                  },
                                ));
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/pdf-file.png',
                                  height: 50,
                                  width: 50,
                                ),
                                const Text("Document")
                              ],
                            ),
                          ),
                          sender: widget.roomName,
                          sentByMe: true,
                        );
                      case 'Video':
                        return MessageTile(
                          message: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VideoMessageWidget(
                              videoUrl: message.content,
                            ),
                          ),
                          sender: widget.roomName,
                          sentByMe: false,
                        );
                      case 'Text':
                        return MessageTile(
                          message: Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              message.content,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          sender: widget.roomName,
                          sentByMe: false,
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              );
            },
          ),
        ));
  }

  Stream<List<Message>> getRoomChatStream(String roomId) {
    return FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chatData')
        .orderBy('time')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => Message.fromFirestore(doc))
          .toList();
    });
  }
}

String getLogoText(String text) {
  List<String> words = text.split(' ');
  String logoText = '';

  for (String word in words) {
    if (word.isNotEmpty) {
      logoText += word[0].toUpperCase();
    }
  }
  if (logoText.length > 3) {
    return logoText.substring(0, 3).toUpperCase();
  }
  return logoText.toUpperCase();
}

class MessageLayout extends StatelessWidget {
  const MessageLayout(
      {super.key, required this.widget, required this.dateTime});

  final Widget widget;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        widget,
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(returnTime(dateTime)),
        ),
      ],
    );
  }
}
