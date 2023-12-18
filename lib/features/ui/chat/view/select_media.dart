import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/view/filetype.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;

class SelectMedia extends StatelessWidget {
   SelectMedia({
    super.key,
    required this.roomId,
  });

  final String roomId;
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    FileType? selectedFileType;

    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return FileTypeSelectionDialog(
              onTypeSelected: (type) {
                selectedFileType = type;
              },
            );
          },
        ).then((_) async {
          if (selectedFileType != null) {
            List<String> allowedExtensions = [];
            switch (selectedFileType) {
              case FileType.photo:
                allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
                break;
              case FileType.document:
                allowedExtensions = ['pdf', 'doc', 'docx', 'txt'];
                break;
              case FileType.video:
                allowedExtensions = ['mp4', 'avi', 'mkv'];
                break;
              case FileType.audio:
                allowedExtensions = ['mp3', 'wav'];
                break;
              case null:
            }
            picker.PlatformFile? file =
                await pickFileWithTypeFilter(allowedExtensions);
            if (file != null) {
              pd.show(
                max: 100,
                msg: 'Sending ${file.name}',
                msgMaxLines: 2,
                progressType: ProgressType.valuable,
              );
              uploadFileToFirebase(file, selectedFileType!, pd);
            } else {}
          }
        });
      },
    );
  }

  Future<void> uploadFileToFirebase(
      picker.PlatformFile file, FileType type, ProgressDialog pd) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('${file.name}');
      // Reference storageReference =
      //     FirebaseStorage.instance.ref().child('${type.name}/${file.name}');
      UploadTask uploadTask = storageReference.putData(file.bytes!);

      await uploadTask.whenComplete(
        () {
          pd.update(
            value: 100,
            msg: 'File uploaded to Firebase Storage',
          );
          pd.close();
          uploadTask.snapshot.ref.getDownloadURL().then(
            (value) {
              fetchData(value).then((value) => print(value));

              Message message = Message(
                type: type.name,
                content: value,
                time: Timestamp.now(),
                sender: 'test',
              );
              sendMessageToRoom(roomId, message);
            },
          );
        },
      );
    } catch (e) {}
  }

  Future<List<dynamic>> fetchData(String imageUrl) async {
    print('https://mitti-server.onrender.com/image?image_url=$imageUrl}');

    final response = await dio.get('https://mitti-server.onrender.com/image?image_url=$imageUrl}');
  print(response);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load album');
    }
   
  
  }

  Future<void> sendMessageToRoom(String roomId, Message message) async {
    try {
      // Reference the room's "chatData" subcollection and add the message
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('chatData')
          .add(message.toMap());
    } catch (error) {}
  }

  Future<picker.PlatformFile?> pickFileWithTypeFilter(
      List<String> allowedExtensions) async {
    picker.FilePickerResult? result =
        await picker.FilePicker.platform.pickFiles(
      withData: true,
      type: picker.FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      picker.PlatformFile file = result.files.first;
      return file;
    } else {
      // User canceled the file picker
      return null;
    }
  }
}
