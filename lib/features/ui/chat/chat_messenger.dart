import 'package:flutter/material.dart';

class ChatMessenger extends StatelessWidget {
  const ChatMessenger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepPurpleAccent,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const TextField(
                cursorColor: Colors.white,
                maxLines: null,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your chat",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.image,
                color: Colors.black,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
