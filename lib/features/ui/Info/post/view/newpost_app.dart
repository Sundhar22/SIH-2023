import 'package:flutter/material.dart';

AppBar buildNewPostAppBar(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
        splashRadius: 15,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ],
    centerTitle: true,
    title: const Text(
      "New Post",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 1,
  );
}
