import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/filetype.dart';

class SelectMedia extends StatelessWidget {
  const SelectMedia({super.key});

  @override
  Widget build(BuildContext context) {
    FileType? selectedFileType;
    return IconButton(
      icon: Icon(Icons.attach_file),
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
            // Set the allowed file extensions based on selectedFileType
            switch (selectedFileType) {
              case FileType.Photo:
                allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
                break;
              case FileType.Document:
                allowedExtensions = ['pdf', 'doc', 'docx', 'txt'];
                break;
              case FileType.Video:
                allowedExtensions = ['mp4', 'avi', 'mkv'];
                break;
              case FileType.Audio:
                allowedExtensions = ['mp3', 'wav'];
                break;
              case null:
                // TODO: Handle this case.
            }
            String? filePath = await pickFileWithTypeFilter(allowedExtensions);
            if (filePath != null) {
              // Use the selected file path for upload
            } else {
              // Handle cancel or error
            }
          }
        });
      },
     
    );
  }
  Future<String?> pickFileWithTypeFilter(List<String> allowedExtensions) async {
  picker.FilePickerResult? result = await picker.FilePicker.platform.pickFiles(
    type: picker.FileType.custom,
    allowedExtensions: allowedExtensions,
  );

  if (result != null) {
    picker.PlatformFile file = result.files.first;
    return file.path;
  } else {
    // User canceled the file picker
    return null;
  }
}

}
