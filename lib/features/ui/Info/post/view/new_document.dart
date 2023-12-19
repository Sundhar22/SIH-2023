import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';

class PostDocument extends StatelessWidget {
  const PostDocument({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Container(
        alignment: Alignment.topRight,
        child: GetX<NewPostController>(builder: (controller) {
          return IconButton(
            splashRadius: controller.buttonSplasRadius.value,
            onPressed: () async {
              String? postLink = await pickImageFromGallery();
              print(postLink);
              controller.imageLink.value = postLink!;
            },
            icon: const Icon(
              Icons.link,
              size: 28,
            ),
          );
        }),
      ),
    );
  }
}

Future<String?> pickImageFromGallery() async {
  try {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      final filePath = result.files.single.path;

      return filePath;
    }
  } catch (e) {}
  return null;
}
