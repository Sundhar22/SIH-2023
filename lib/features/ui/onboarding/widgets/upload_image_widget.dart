import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key});

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
      children: [
        CircleAvatar(
          radius: 75,
          backgroundColor: Colors.grey,
          backgroundImage: image != null ? FileImage(image!) : null,
        ),
        SizedBox(
          height: 65,
          width: 160,
          child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.white;
                },
              ),
            ),
            onPressed: pickImageFromGallery,
            child: const Text(
              "Upload your logo",
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
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
      children: [
        GestureDetector(
          onTap: pickImageFromGallery,
          child: Stack(
            children: <Widget>[
              CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              backgroundImage: image != null ? FileImage(image!) : null,
            ),
            ] 
          ),
        )
      ],
    );
  }
}