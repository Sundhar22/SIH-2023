import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';

class PostContent extends StatefulWidget {
  const PostContent({
    super.key,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late TextEditingController textEditingController;

  final NewPostController newPostController = Get.find();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 5,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: TextField(
          controller: textEditingController,
          onChanged: (value) {
            newPostController.postContent.value = textEditingController.text;
            print(
              " The content is ${newPostController.postContent.value},",
            );
          },
          autofocus: true,
          minLines: 10,
          maxLines: 10,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "share your thoughts...",
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ));
  }
}
