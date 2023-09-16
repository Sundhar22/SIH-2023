import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/play_video.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/chat_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/document_layout.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(left: 2, bottom: 10),
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
                padding: const EdgeInsets.only(bottom: 70, top: 10),
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
                        sentByMe: false,
                      );
                    case 'Text':
                      return ChatMessageLayout(
                        chatMsg: message.content,
                        msgTime: message.time.toDate(),
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
