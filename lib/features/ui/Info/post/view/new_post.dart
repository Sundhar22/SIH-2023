import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';
import 'package:sih_2023/features/ui/post/view/new_content.dart';
import 'package:sih_2023/features/ui/post/view/new_document.dart';
import 'package:sih_2023/features/ui/post/view/newpost_app.dart';
import 'package:sih_2023/features/ui/post/view/post_button.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildNewPostAppBar(context),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SwitchPost(),
              PostContent(),
              PostDocument(),
              NewPostBottomWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchPost extends StatefulWidget {
  const SwitchPost({
    super.key,
  });

  @override
  State<SwitchPost> createState() => _SwitchPostState();
}

class _SwitchPostState extends State<SwitchPost> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      title: const Text(
        "Post",
        style: TextStyle(fontSize: 18),
      ),
      trailing: Switch(
        value: postAsPost,
        onChanged: (val) {
          setState(() {
            postAsPost = !postAsPost;
          });
        },
      ),
    );
  }
}

class NewPostBottomWidgets extends StatelessWidget {
  const NewPostBottomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NewPostController>(builder: (controller) {
      return Column(
        children: [
          controller.imageLink.value == "null"
              ? const PostButton()
              : Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                image: FileImage(
                                  File(
                                    controller.imageLink.value,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                controller.imageLink.substring(89),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const PostButton(),
                  ],
                )
        ],
      );
    });
  }
}
