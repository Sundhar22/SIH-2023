import 'package:flutter/material.dart';

class UpVoteButton extends StatefulWidget {
  const UpVoteButton({super.key});

  @override
  State<UpVoteButton> createState() => _UpVoteButtonState();
}

class _UpVoteButtonState extends State<UpVoteButton> {
  int likes = 0;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (isLiked) {
                  likes--;
                } else {
                  likes++;
                }
                isLiked = !isLiked;
              });
            },
            icon: isLiked
                ? const Icon(Icons.favorite_outlined, color: Colors.red)
                : const Icon(
                    Icons.favorite_outline,
                  )),
        Text(
          likes.toString(),
        ),
      ],
    );
  }
}
