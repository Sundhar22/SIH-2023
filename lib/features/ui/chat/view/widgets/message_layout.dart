import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/return_time.dart';

class MessageLayout extends StatelessWidget {
  const MessageLayout(
      {super.key, required this.widget, required this.dateTime});

  final Widget widget;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        widget,
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(returnTime(dateTime)),
        ),
      ],
    );
  }
}
