import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/view/message_tile.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/message_layout.dart';

class ImageLayout extends StatelessWidget {
  const ImageLayout(
      {super.key,
      required this.imageLink,
      required this.isSentByMe,
      required this.messageTime});

  final String imageLink;
  final bool isSentByMe;
  final DateTime messageTime;

  @override
  Widget build(BuildContext context) {
    return MessageTile(
      message: Column(
        children: [
          MessageLayout(
            widget: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width - 100,
              child: Image.network(
                fit: BoxFit.cover,
                imageLink,
              ),
            ),
            dateTime: messageTime,
          )
        ],
      ),
      sender: "",
      sentByMe: isSentByMe,
    );
  }
}
