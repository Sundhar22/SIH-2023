import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            !widget.sentByMe
                ? CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/450px-TamilNadu_Logo.svg.png",
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 3),
            Container(
              // Content Padding
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: widget.sentByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                color: widget.sentByMe
                    ? Colors.greenAccent.shade100
                    : Colors.white,
              ),
              child: widget.message,
            ),
            widget.sentByMe ? const SizedBox(width: 5) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
