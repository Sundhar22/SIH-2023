import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/firebase/delete_document.dart';
import 'package:sih_2023/features/ui/chat/view/chat.dart';
import 'package:sih_2023/features/ui/responsehub/view/hub_info.dart';
import 'package:sih_2023/features/ui/share_location/share_location.dart';
import 'package:sih_2023/features/ui/user/user.dart';

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
        contentPadding: const EdgeInsets.all(10),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      roomName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
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
                    onPressed: () async {
                      Navigator.pop(context);
                      await deleteDocumentById(context, 'rooms', roomID);
                    },
                    icon: const Icon(
                      Icons.delete_outline_sharp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      targetUserRoomId = roomID;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRequestScreen(
                            roomId: roomID,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.emoji_people_sharp,
                    ),
                  ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HubInfo(
                                  roomName: roomName,
                                )),
                      );
                    },
                    icon: const Icon(Icons.info_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareMyLocation(
                            roomId: roomID,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.location_history_rounded,
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
