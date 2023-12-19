import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/view/filetype.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/onboarding/widgets/form_widgets.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SelectMedia extends StatelessWidget {
  const SelectMedia({
    super.key,
    required this.roomId,
  });

  final String roomId;
  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
    FileType? selectedFileType;

    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: () async {
        FileType.resource == 'resource' ? showDialog(
                  builder: (context) => AlertDialog(
                    title: const Text("Resource Sharing"),
                    content: const SingleChildScrollView(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ResourceType(),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Resources",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          FormWidget(hinttext: "Amount of Resources"),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          FormWidget(hinttext: "Describe here")
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('ACCEPT'),
                      ),
                    ],
                  ),
                  context: context,
                ) : showDialog(
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
              case FileType.resource:
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
          FirebaseStorage.instance.ref().child('${type.name}/${file.name}');
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

class ResourceType extends StatefulWidget {
  const ResourceType({super.key});

  @override
  State<ResourceType> createState() => _ResourceTypeState();
}

class _ResourceTypeState extends State<ResourceType> {
  String selectedResourceType = 'Select resources';
  List<String> expertise = [
    'Select resources',
    'Food',
    'Medical',
    'Clothing',
    'Fire',
    'Air force'
  ];
  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 220,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        value: selectedResourceType,
        hint: const Text('Selected resources'),
        onChanged: (newValue) {
          setState(() {
            selectedResourceType = newValue!;
          });
        },
        items: expertise.map((expertise) {
          return DropdownMenuItem<String>(
            value: expertise,
            child: Text(expertise),
          );
        }).toList(),
      ),
    );
  }
}
