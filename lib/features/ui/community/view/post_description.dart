import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  const PostDescription({
    super.key,
    required this.postContent,
  });

  final String postContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 10,
      ),
      child: postContent != ""
          ? Text(
              postContent,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            )
          : Column(
              children: [
                Container(
                  height: 20,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
