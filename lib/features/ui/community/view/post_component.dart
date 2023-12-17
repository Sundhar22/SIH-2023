import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/community/view/post_actions.dart';
import 'package:sih_2023/features/ui/community/view/post_description.dart';
import 'package:sih_2023/features/ui/community/view/post_image.dart';
import 'package:sih_2023/features/ui/community/view/post_info.dart';

class CommPostComponent extends StatelessWidget {
  const CommPostComponent({
    super.key,
    required this.imageLink,
    required this.postUser,
    required this.postDescription,
    required this.userProfile,
  });

  final String imageLink, postUser, postDescription, userProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostInfo(
          postUserImage: userProfile,
          postUserName: postUser,
        ),
        PostImage(imageLink: imageLink),
        PostDescription(postContent: postDescription),
        const PostCTA(),
        const Divider(),
      ],
    );
  }
}
