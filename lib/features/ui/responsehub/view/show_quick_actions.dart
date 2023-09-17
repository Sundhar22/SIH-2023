import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/delete_document.dart';
import 'package:sih_2023/features/ui/chat/view/chat.dart';

Future<dynamic> showQuickActions(
  BuildContext context,
  String roomName,
  String roomID,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              color: accentColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        roomName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(roomId: roomID, roomName: roomName),
                        ),
                      );
                    },
                    icon: const Icon(Icons.messenger_outline_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.info_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add_alt),
                  ),
                  IconButton(
                    onPressed: () async {
                      await deleteDocumentById(context, 'rooms', roomID);
                    },
                    icon: const Icon(
                      Icons.delete_outline_sharp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
