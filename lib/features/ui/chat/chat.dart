import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    // Stream<QuerySnapshot> getMessagesStream() {
    //   return FirebaseFirestore.instance
    //       .collection('messages')
    //       .orderBy('timestamp')
    //       .snapshots();
    // }

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
                  onPressed: () {},
                  icon: const Icon(Icons.add))
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

              return ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Message message = messages[index];

                  switch (message.type) {
                    case 'Photo':
                      return MessageTile(
                        message: Image.network(
                          message.content,
                          fit: BoxFit.fitHeight,
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
                          child: Image.asset(
                            'assets/images/pdf-file.png',
                            height: 150,
                            width: 150,
                          ),
                        ),
                        sender: widget.roomName,
                        sentByMe: true,
                      );
                    case 'Video':
                      return MessageTile(
                        message: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoMessageWidget(videoUrl: message.content),
                        ),
                        sender: widget.roomName,
                        sentByMe: false,
                      );

                    case 'Text':
                      return MessageTile(
                        message: Text(message.content),
                        sender: widget.roomName,
                        sentByMe: false,
                      );
                    default:
                      return const SizedBox();
                  }
                },
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

