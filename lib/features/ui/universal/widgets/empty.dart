import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("Nothing to show here"),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
