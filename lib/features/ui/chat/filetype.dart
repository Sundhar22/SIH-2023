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
                  icon: Icons.perm_media_rounded,
                  name: 'Image',
                ),
              ),
              InkWell(
                  onTap: () {
                    onTypeSelected(FileType.video);
                    Navigator.pop(context);
                  },
                  child: MediaButton(icon: Icons.video_file, name: 'Video')),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.document);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.file_copy_sharp,
                  name: 'Document',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.document);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.location_on,
                  name: 'Location',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.audio);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.audio_file,
                  name: 'Audio',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.document);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.poll,
                  name: 'Poll',
                ),
              ),
            ],
          ),
        ));
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
          backgroundColor: Colors.blue.withOpacity(.2),
          child: Icon(
            icon,
            color: Colors.blueAccent,
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
