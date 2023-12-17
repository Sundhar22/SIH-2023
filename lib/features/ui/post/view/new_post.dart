import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';
import 'package:sih_2023/features/ui/post/view/new_content.dart';
import 'package:sih_2023/features/ui/post/view/new_document.dart';
import 'package:sih_2023/features/ui/post/view/newpost_app.dart';
import 'package:sih_2023/features/ui/post/view/post_button.dart';

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
