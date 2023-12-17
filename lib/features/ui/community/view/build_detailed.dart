import 'package:flutter/material.dart';

AppBar buildDetailedAppBar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      splashRadius: 10,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        color: Colors.black,
        Icons.arrow_back,
      ),
    ),
    actions: [
      IconButton(
        splashRadius: 10,
        onPressed: () {},
        icon: const Icon(
          color: Colors.black,
          Icons.share_outlined,
        ),
      ),
    ],
  );
}
