import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/return_time.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';

class ChatMessageLayout extends StatelessWidget {
  const ChatMessageLayout(
      {super.key,
      required this.chatMsg,
      required this.msgTime,
      required this.isSentByMe});

  final String chatMsg;
  final DateTime msgTime;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return MessageTile(
      message: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: !isSentByMe
              ? const Color.fromRGBO(248, 248, 248, 1)
              : const Color.fromRGBO(0, 39, 136, 1),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(
                5,
              )),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatMsg,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isSentByMe ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              returnTime(msgTime),
              style: TextStyle(
                color: isSentByMe ? Colors.black : Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      sender: "",
      sentByMe: isSentByMe,
    );
  }
}
