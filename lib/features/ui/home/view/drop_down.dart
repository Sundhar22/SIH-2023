import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return GetX<FilterController>(builder: (getxController) {
      return DropdownButton<String>(
        padding: const EdgeInsets.all(10),
        elevation: 10,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
        value: getxController.returnDefault(widget.index),
        onChanged: (String? newValue) {},
        items: getxController.filterSubOptions[widget.index].map(
          (String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
              onTap: () {
                getxController.updateOptions(widget.index, option);
              },
            );
          },
        ).toList(),
      );
    });
  }
}
