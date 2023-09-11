import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/chat_messenger.dart';

import 'package:sih_2023/features/ui/chat/message_model.dart';
import 'package:sih_2023/features/ui/chat/play_video.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.roomId});
  String roomId;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> getMessagesStream() {
      return FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp')
          .snapshots();
    }

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
                  const CircleAvatar(
                    radius: 20,
                    child: Text("MRT"),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Madurai Force",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
          roomId: roomId,
        ),
        body: StreamBuilder<List<Message>>(
          stream: getRoomChatStream(roomId),
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
                    return Row(
                      children: [
                        Container(
                            width: 200,
                            height: 200,
                            color: Colors.white,
                            child: Image.network(
                              message.content,
                              fit: BoxFit.cover,
                            )),
                      ],
                    );

                  case 'Document':
                    return Text(message.content);
                  case 'Video':
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VideoMessageWidget(videoUrl: message.content),
                    );

                  case 'Text':
                    return ListTile(
                      title: Text(message.content),
                    );
                  default:
                    return const SizedBox();
                }
              },
            );
          },
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
