import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/return_time.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';

class ChatMessageLayout extends StatelessWidget {
  const ChatMessageLayout(
      {super.key, required this.chatMsg, required this.msgTime});

  final String chatMsg;
  final DateTime msgTime;

  @override
  Widget build(BuildContext context) {
    return MessageTile(
      message: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.4,
            padding: const EdgeInsets.all(5),
            child: Text(
              chatMsg,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Text(
            returnTime(msgTime),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      sender: "",
      sentByMe: false,
    );
  }
}
