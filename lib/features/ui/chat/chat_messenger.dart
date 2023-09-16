import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/message_model.dart';
import 'package:sih_2023/features/ui/chat/select_media.dart';

// ignore: must_be_immutable
class ChatMessenger extends StatefulWidget {
  ChatMessenger({super.key, required this.roomId});
  String roomId;

  @override
  State<ChatMessenger> createState() => _ChatMessengerState();
}

class _ChatMessengerState extends State<ChatMessenger> {
  bool textfieldActivated = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: !textfieldActivated
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        textfieldActivated = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: const Text("Enter your message"),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: messageController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Enter your message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
          ),
          !textfieldActivated
              ? SelectMedia(roomId: widget.roomId)
              : const SizedBox(width: 4),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {
                if (messageController.value.text.length > 5) {
                  Message textMessage = Message(
                    type: 'Text',
                    content: messageController.value.text,
                    time: Timestamp.now(),
                    sender: 'test',
                  );
                  sendMessageToRoom(widget.roomId, textMessage);
                  messageController.clear();
                  setState(() {
                    textfieldActivated = !textfieldActivated;
                  });
                } else {}
              },
              icon: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
              ),
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
