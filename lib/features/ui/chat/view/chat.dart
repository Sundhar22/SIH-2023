import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/chat/view/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/play_video.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/announcement_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/chat_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/document_layout.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/emergency_widget.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/image_layout.dart';
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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ))
          ],
        ),
        bottomSheet: ChatMessenger(roomId: widget.roomId),
        body: Column(
          children: [
            ChatMessageLayout(
              chatMsg: "Descent Message",
              msgTime: DateTime(
                2022,
                3,
                3,
                5,
                10,
                10,
                3,
                3,
              ),
              isSentByMe: false,
            ),
          ],
        )

        //  StreamBuilder<List<Message>>(
        //   stream: getRoomChatStream(widget.roomId),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //         ],
        //       );
        //     }
        //     List<Message> messages = snapshot.data!;
        //     return Scrollbar(
        //       thickness: .6,
        //       child: ListView.builder(
        //         padding: const EdgeInsets.only(bottom: 70, top: 10),
        //         itemCount: messages.length,
        //         itemBuilder: (context, index) {
        //           Message message = messages[index];
        //           switch (message.type) {
        //             case 'photo':
        //               return ImageLayout(
        //                 imageLink: message.content,
        //                 isSentByMe: false,
        //                 messageTime: message.time.toDate(),
        //               );
        //             case 'document':
        //               return DocumentLayout(
        //                 documentLink: message.content,
        //                 messageTime: message.time.toDate(),
        //               );
        //             case 'video':
        //               return MessageTile(
        //                 message: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: VideoMessageWidget(
        //                     videoUrl: message.content,
        //                   ),
        //                 ),
        //                 sender: widget.roomName,
        //                 sentByMe: false,
        //               );

        //             case 'Text':
        //               return ChatMessageLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             case 'Request':
        //               return RequestLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             case 'Resource':
        //               return ResouceLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             case 'Emergency':
        //               return EmergencyLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             case 'Progress':
        //               return ProgressLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             case 'Announcement':
        //               return AnnouncementLayout(
        //                 chatMsg: message.content,
        //                 msgTime: message.time.toDate(),
        //               );

        //             default:
        //               return SizedBox(
        //                 child: Text(
        //                   "${message.content} ${message.type}",
        //                 ),
        //               );
        //           }
        //         },
        //       ),
        //     );
        //   },
        // ),
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
