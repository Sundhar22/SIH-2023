import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/functions/firebase/fetch_collection.dart';

enum FileType { photo, document, video, audio }

class FileTypeSelectionDialog extends StatelessWidget {
  final Function(FileType) onTypeSelected;

  const FileTypeSelectionDialog({super.key, required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            InkWell(
              onTap: () {
                onTypeSelected(FileType.photo);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.perm_media_outlined,
                name: 'Image',
              ),
            ),
            InkWell(
                onTap: () {
                  onTypeSelected(FileType.video);
                  Navigator.pop(context);
                },
                child: MediaButton(
                    icon: Icons.video_file_outlined, name: 'Video')),
            InkWell(
              onTap: () {
                onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.file_copy_outlined,
                name: 'Document',
              ),
            ),
            InkWell(
              onTap: () {
                onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.location_on_outlined,
                name: 'Location',
              ),
            ),
            InkWell(
              onTap: () {
                onTypeSelected(FileType.audio);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.audio_file_outlined,
                name: 'Audio',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text("Choose Layouts"),
                      content: ChooseLayout(),
                    );
                  },
                );
              },
              child: MediaButton(
                icon: Icons.menu_sharp,
                name: 'Chat Layouts',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MediaButton extends StatelessWidget {
  MediaButton({super.key, required this.icon, required this.name});
  IconData icon;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueAccent,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            color: Colors.black.withOpacity(.6),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

List<String> layoutNames = [
  "Announcement", // deone
  "Progress", // done
  "Request", // done
  "Resource",
  "Emergency",
];

List<IconData> layoutIcons = [
  Icons.info_outline_rounded,
  Icons.trending_up,
  Icons.people_outline_outlined,
  Icons.auto_awesome_outlined,
  Icons.emergency_outlined,
];

class ChooseLayout extends StatelessWidget {
  const ChooseLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < layoutNames.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(layoutIcons[i]),
                  ),
                  title: Text("${layoutNames[i]} Layout"),
                  onTap: () {
                    currentChatLayout = layoutNames[i];
                    showToast("Layout set to ${layoutNames[i]} ");
                    Navigator.pop(context);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
