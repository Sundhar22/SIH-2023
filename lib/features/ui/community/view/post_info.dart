// Post UserImg with Time of the Post
import 'package:flutter/material.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
    required this.postUserName,
    required this.postUserImage,
  });

  final String postUserName;
  final String postUserImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 18, backgroundColor: Colors.black12),
              const SizedBox(width: 10),
              postUserName != ""
                  ? Text(
                      postUserName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          height: 8,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                          ),
                          height: 8,
                          width: 110,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
