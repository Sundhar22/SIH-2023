import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/chat/chat_messenger.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  radius: 20,
                  child: Text("MRT"),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Madurai Force",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            IconButton(
                splashRadius: 5, onPressed: () {}, icon: const Icon(Icons.add))
          ],
        ),
      ),
      bottomSheet: const ChatMessenger(),
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
