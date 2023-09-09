import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/message_model.dart';
import 'package:sih_2023/features/ui/chat/select_media.dart';

class ChatMessenger extends StatelessWidget {
  ChatMessenger({super.key, required this.roomId});
  String roomId;

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepPurpleAccent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: messageController,
                cursorColor: Colors.white,
                maxLines: null,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your chat",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SelectMedia(
            roomId: roomId,
          ),
          IconButton(
            onPressed: () {
              Message textMessage = Message(
                type: 'Text',
                content: messageController.value.text,
                time: Timestamp.now(),
                sender: 'test',
              );
              sendMessageToRoom(roomId, textMessage);
              messageController.clear();
            },
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Future<void> sendMessageToRoom(String roomId, Message message) async {
    try {
      // Reference the room's "chatData" subcollection and add the message
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('chatData')
          .add(message.toMap());
    } catch (error) {
      print('Error sending message: $error');
    }
  }
}
