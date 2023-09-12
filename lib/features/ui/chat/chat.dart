import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/chat_messenger.dart';
import 'package:sih_2023/features/ui/chat/message_model.dart';
import 'package:sih_2023/features/ui/chat/message_tile.dart';
import 'package:sih_2023/features/ui/chat/play_video.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.roomId, required this.roomName});
  String roomId;
  String roomName;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> getMessagesStream() {
      return FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp')
          .snapshots();
    }

    String _getLogoText(String text) {
      List<String> words = text.split(' ');
      String logoText = '';

      for (String word in words) {
        if (word.isNotEmpty) {
          logoText += word[0].toUpperCase();
        }
      }
      return logoText.substring(0, 3).toUpperCase();
    }

    return Scaffold(
        appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  CircleAvatar(
                    radius: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(_getLogoText(roomName)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      roomName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  splashRadius: 5,
                  onPressed: () {},
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
        bottomSheet: ChatMessenger(
          roomId: roomId,
        ),
        body: StreamBuilder<List<Message>>(
          stream: getRoomChatStream(roomId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            List<Message> messages = snapshot.data!;

            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                Message message = messages[index];

                switch (message.type) {
                  case 'Photo':
                    return MessageTile(
                      message: Row(
                        children: [
                          Container(
                              width: 200,
                              height: 200,
                              color: Colors.white,
                              child: Image.network(
                                message.content,
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                      sentByMe: true,
                      sender: '',
                    );
                  case 'Document':
                    return MessageTile(
                      message: Text(message.content),
                      sentByMe: true,
                      sender: '',
                    );
                  case 'Video':
                    return MessageTile(
                      message: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VideoMessageWidget(videoUrl: message.content),
                      ),
                      sender: '',
                      sentByMe: true,
                    );

                  case 'Text':
                    MessageTile(
                      message: Text(message.content,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      sender: 'Me',
                      sentByMe: true,
                    );
                  default:
                    return const SizedBox();
                }
              },
            );
          },
        ));
  }

  Stream<List<Message>> getRoomChatStream(String roomId) {
    return FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chatData')
        .orderBy('time')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => Message.fromFirestore(doc))
          .toList();
    });
  }
}
