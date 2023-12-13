import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key, required this.hinttext});
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(27),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
