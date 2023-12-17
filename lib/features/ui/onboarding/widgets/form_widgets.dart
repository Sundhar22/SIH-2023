import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key, required this.hinttext,});
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
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
      ),
    );
  }
}
