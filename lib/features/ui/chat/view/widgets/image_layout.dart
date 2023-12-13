import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/view/image_view.dart';
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
            widget: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(imageLink: imageLink),
                  ),
                );
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width - 100,
                    child: CachedNetworkImage(
                      imageUrl: imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Colors.black.withOpacity(.1),
                    ),
                  ),
                ],
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
