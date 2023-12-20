import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/chat/view/message_model.dart';
import 'package:sih_2023/features/ui/chat/view/widgets/request_form.dart';
import 'package:sih_2023/features/ui/responsehub/view/room_model.dart';
import 'package:sih_2023/main.dart';

enum FileType { photo, document, video, audio, resource }

class FileTypeSelectionDialog extends StatefulWidget {
  final Function(FileType) onTypeSelected;
  String roomID;

  FileTypeSelectionDialog(
      {super.key, required this.onTypeSelected, this.roomID = ''});

  @override
  State<FileTypeSelectionDialog> createState() =>
      _FileTypeSelectionDialogState();
}

class _FileTypeSelectionDialogState extends State<FileTypeSelectionDialog> {
  TextEditingController resourceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
    return Dialog(
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            InkWell(
              onTap: () {
                widget.onTypeSelected(FileType.photo);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.perm_media_outlined,
                name: 'Image',
              ),
            ),
            InkWell(
              onTap: () {
                widget.onTypeSelected(FileType.video);
                Navigator.pop(context);
              },
              child:
                  MediaButton(icon: Icons.video_file_outlined, name: 'Video'),
            ),
            InkWell(
              onTap: () {
                // showDialog(
                //   builder: (context) => AlertDialog(
                //     title: const Text("Resource Sharing"),
                //     content: SingleChildScrollView(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           const Text(
                //             "Select Type",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 17,
                //               fontWeight: FontWeight.normal,
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Container(
                //             height: 60,
                //             width: 220,
                //             decoration: BoxDecoration(
                //                 border:
                //                     Border.all(color: Colors.grey, width: 0.5),
                //                 borderRadius: BorderRadius.circular(5)),
                //             child: DropdownButtonFormField<String>(
                //               decoration: const InputDecoration(
                //                   border: OutlineInputBorder(
                //                       borderSide: BorderSide.none)),
                //               value: selectedResourceType,
                //               hint: const Text('Selected resources'),
                //               onChanged: (newValue) {
                //                 setState(() {
                //                   selectedResourceType = newValue!;
                //                 });
                //               },
                //               items: expertise.map((expertise) {
                //                 return DropdownMenuItem<String>(
                //                   value: expertise,
                //                   child: Text(expertise),
                //                 );
                //               }).toList(),
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 14,
                //           ),
                //           const Text(
                //             "Quantity",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 17,
                //               fontWeight: FontWeight.normal,
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 7,
                //           ),
                //           Container(
                //             height: 60,
                //             width: double.infinity,
                //             decoration: BoxDecoration(
                //                 border:
                //                     Border.all(color: Colors.grey, width: 0.5),
                //                 borderRadius: BorderRadius.circular(5)),
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 15, top: 5),
                //               child: TextField(
                //                 controller: resourceController,
                //                 onChanged: (text) {
                //                   print("User entered input: $text");
                //                 },
                //                 keyboardType: TextInputType.number,
                //                 decoration: const InputDecoration(
                //                   hintText: "No of Resources",
                //                   hintStyle: TextStyle(
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.grey,
                //                   ),
                //                   border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 14,
                //           ),
                //           const Text(
                //             "Description",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 17,
                //               fontWeight: FontWeight.normal,
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 7,
                //           ),
                //           Container(
                //             height: 60,
                //             width: double.infinity,
                //             decoration: BoxDecoration(
                //                 border:
                //                     Border.all(color: Colors.grey, width: 0.5),
                //                 borderRadius: BorderRadius.circular(5)),
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 15, top: 5),
                //               child: TextField(
                //                 controller: descriptionController,
                //                 onChanged: (text) {
                //                   print("User entered input: $text");
                //                 },
                //                 decoration: const InputDecoration(
                //                   hintText: "description",
                //                   hintStyle: TextStyle(
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.grey,
                //                   ),
                //                   border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     actions: [
                //       ElevatedButton(
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         child: const Text('CANCEL'),
                //       ),
                //       ElevatedButton(
                //         onPressed: () {
                        
                //           print("working");
                //           Navigator.pop(context);
                //           Navigator.pop(context);
                //         },
                //         child: const Text('ACCEPT'),
                //       ),
                //     ],
                //   ),
                //   context: context,
                // );

                Get.to(() => RequestForm(roomID: widget.roomID,));
              },
              child: MediaButton(
                icon: Icons.water_drop_outlined,
                name: 'Resources',
              ),
            ),
            InkWell(
              onTap: () {
                widget.onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.file_copy_outlined,
                name: 'Document',
              ),
            ),
            InkWell(
              onTap: () {
                widget.onTypeSelected(FileType.document);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.location_on_outlined,
                name: 'Location',
              ),
            ),
            InkWell(
              onTap: () {
                widget.onTypeSelected(FileType.audio);
                Navigator.pop(context);
              },
              child: MediaButton(
                icon: Icons.audio_file_outlined,
                name: 'Audio',
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pop(context);
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return const AlertDialog(
            //           title: Text("Layouts"),
            //           content: ChooseLayout(),
            //         );
            //       },
            //     );
            //   },
            //   child: MediaButton(
            //     icon: Icons.menu_sharp,
            //     name: 'Layout',
            //   ),
            // ),
          ],
        ),
      ),
    );
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
          backgroundColor: const Color.fromRGBO(0, 39, 136, 1),
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
