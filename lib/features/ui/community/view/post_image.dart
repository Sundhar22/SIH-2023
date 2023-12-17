// Post Of the user
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    if (imageLink == "null") {
      return const SizedBox();
    } else if (imageLink == "test") {
      return Container(
        height: 300,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
      );
    } else {
      return Container(
        height: 300,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black12,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageLink),
          ),
        ),
      );
    }
  }
}
