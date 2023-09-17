// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadImageWidget extends StatefulWidget {
//   const UploadImageWidget({super.key});

//   @override
//   State<UploadImageWidget> createState() => _UploadImageWidgetState();
// }

// class _UploadImageWidgetState extends State<UploadImageWidget> {
//   File? _image;

//   Future<void> _pickImageFromGallery() async {
//     final imagePicker = ImagePicker();
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 75,
//           backgroundColor: Colors.grey,
//           backgroundImage: _image != null ? FileImage(_image!) : null,
//         ),
//         SizedBox(
//           height: 65,
//           width: 160,
//           child: TextButton(
//             style: ButtonStyle(
//               overlayColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//                   return Colors.white;
//                 },
//               ),
//             ),
//             onPressed: _pickImageFromGallery,
//             child: const Text(
//               "Upload your logo",
//               style: TextStyle(
//                   color: Colors.deepPurple,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }