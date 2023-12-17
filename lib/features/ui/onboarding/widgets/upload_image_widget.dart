import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({Key? key}) : super(key: key);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  File? image;

  Future<void> pickImageFromGallery() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        final filePath = result.files.single.path;
        setState(() {
          image = File(filePath!);
        });
      }
    } catch (e) {
      print("Error picking a file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: image != null ? FileImage(image!) : null,
              child: const Icon(Icons.person_outline_rounded, size: 40,),
              // backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  pickImageFromGallery();
                },
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.lightBlue[100]
                  ),
                  child:  Icon(
                    Icons.add_a_photo_rounded,
                    size: 25,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SignInUpload extends StatefulWidget {
  const SignInUpload({super.key});

  @override
  State<SignInUpload> createState() => _SignInUploadState();
}

class _SignInUploadState extends State<SignInUpload> {
  // File? image;
  // Future<void> pickImageFromGallery() async {
  //   try {
  //     final result = await FilePicker.platform.pickFiles(type: FileType.image);
  //     if (result != null) {
  //       final filePath = result.files.single.path;
  //       setState(() {
  //         image = File(filePath!);
  //       });
  //     }
  //   } catch (e) {
  //     print("Error picking a file: $e");w
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // onTap: pickImageFromGallery,
          child: const Stack(children: <Widget>[
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/6/6b/National_Disaster_Management_Authority_Logo.png"),
              // backgroundImage: image != null ? FileImage(image!) : null,
            ),
          ]),
        )
      ],
    );
  }
}
