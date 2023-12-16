import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share("Share the post via");
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 20,
      ),
    );
  }
}
