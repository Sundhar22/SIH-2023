import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/pdf_viwer.dart';
import 'package:sih_2023/features/ui/chat/view/play_video.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/image_layout.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(widget.roomName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      bottomSheet: ChatMessenger(roomId: widget.roomId),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
        child: StreamBuilder<List<Message>>(
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
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Message message = messages[index];
                  switch (message.type) {
                    case 'photo':
                      return ImageLayout(
                        imageLink: message.content,
                        isSentByMe: false,
                        messageTime: message.time.toDate(),
                      );
                    case 'Document':
                      return MessageTile(
                        message: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PdfViewerPage(
                                        link: message.content,
                                      );
                                    },
                                  ),
                                );
                              },
                            );
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
                      print("MEssage Loaded Bro");
                      return MessageTile(
                        message: Container(
                          width: MediaQuery.of(context).size.width / 2.4,
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
                      return const SizedBox(
                        child: Text("Not found"),
                      );
                  }
                },
              ),
            );
          },
        ),
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
