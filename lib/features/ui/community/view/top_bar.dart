import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/post/view/new_post.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 3,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              "https://images.pexels.com/photos/3881104/pexels-photo-3881104.jpeg?cs=srgb&dl=pexels-maahid-mohamed-3881104.jpg",
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPostScreen(),
                  ));
            },
            child: const Text(
              "Share your thoughts...",
            ),
          )
        ],
      ),
    );
  }
}
