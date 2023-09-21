import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/return_time.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';

class ProgressLayout extends StatelessWidget {
  const ProgressLayout(
      {super.key, required this.chatMsg, required this.msgTime});

  final String chatMsg;
  final DateTime msgTime;

  @override
  Widget build(BuildContext context) {
    return MessageTile(
      message: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              spreadRadius: .9,
            )
          ],
          border: Border(
            left: BorderSide(
              color: Colors.blue,
              width: 10,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.6,
                padding: const EdgeInsets.all(5),
                child: Text(
                  chatMsg,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    returnTime(msgTime),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.join_right_sharp,
                    size: 22,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      sender: "",
      sentByMe: false,
    );
  }
}
