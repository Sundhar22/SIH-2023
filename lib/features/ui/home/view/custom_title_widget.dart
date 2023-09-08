import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    super.key,
    required this.titleContent,
  });

  final String titleContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        titleContent,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
