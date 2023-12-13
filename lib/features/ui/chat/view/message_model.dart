import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String type;       // Type of message (text, image, video, audio, etc.)
  final String content;    // Content of the message (text, URL, file path, etc.)
  final Timestamp time;   // Timestamp of when the message was sent
  final String sender;    // ID of the sender

  Message({
    required this.type,
    required this.content,
    required this.time,
    required this.sender,
  });

  // Convert a Message object to a map
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'content': content,
      'time': time,
      'sender': sender,
    };
  }

  // Create a Message object from a Firestore document snapshot
  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Message(
      type: data['type'] ?? '',
      content: data['content'] ?? '',
      time: data['time'] ?? Timestamp.now(),
      sender: data['sender'] ?? '',
    );
  }
}
