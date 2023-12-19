import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/call/videocall/groupcall.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/play_video.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/announcement_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/chat_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/document_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/emergency_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/image_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/message_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/progress_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/request_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/resource_widget.dart';

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
              radius: 15,
              child: Text(getLogoText(widget.roomName)),
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
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
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

                  case 'Request':
                    return RequestLayout(
                      chatMsg: message.content,
                      msgTime: message.time.toDate(),
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
