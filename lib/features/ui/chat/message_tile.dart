import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTile extends StatefulWidget {
  final Widget message;
  final String sender;
  final bool sentByMe;

  const MessageTile({
    super.key,
    required this.message,
    required this.sender,
    required this.sentByMe,
  });

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),

      // ALignment of User Chat
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            !widget.sentByMe
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.withOpacity(.2),
                  )
                : const SizedBox(),
            const SizedBox(width: 5),
            Container(
              // Content Padding
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: widget.sentByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                color: widget.sentByMe
                    ? Colors.blueAccent.withOpacity(.2)
                    : Colors.grey.withOpacity(
                        .1,
                      ),
              ),
              child: widget.message.paddingSymmetric(vertical: 5),
            ),
            widget.sentByMe ? const SizedBox(width: 5) : const SizedBox(),
            widget.sentByMe
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blueAccent.withOpacity(.2),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
