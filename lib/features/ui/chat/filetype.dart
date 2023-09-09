import 'package:flutter/material.dart';

enum FileType { Photo, Document, Video, Audio }

class FileTypeSelectionDialog extends StatelessWidget {
  final Function(FileType) onTypeSelected;

  FileTypeSelectionDialog({required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: [
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.Photo);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.perm_media_rounded,
                  name: 'Image',
                ),
              ),
              InkWell(
                  onTap: () {
                    onTypeSelected(FileType.Video);
                    Navigator.pop(context);
                  },
                  child: MediaButton(icon: Icons.video_file, name: 'Video')),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.Document);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.file_copy_sharp,
                  name: 'Document',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.Document);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.location_on,
                  name: 'Location',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.Audio);
                  Navigator.pop(context);
                },
                child: MediaButton(
                  icon: Icons.audio_file,
                  name: 'Audio',
                ),
              ),
              InkWell(
                onTap: () {
                  onTypeSelected(FileType.Document);
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
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(name)
      ],
    );
  }
}
