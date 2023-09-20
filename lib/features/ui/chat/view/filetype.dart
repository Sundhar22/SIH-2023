import 'package:flutter/material.dart';

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
                onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.menu_sharp,
                name: 'Pin Loc',
              ),
            ),
            InkWell(
              onTap: () {
                onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.videocam_outlined,
                name: 'Meet',
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
