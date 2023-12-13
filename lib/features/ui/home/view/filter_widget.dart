import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget(
      {super.key, required this.index, required this.filterOptions});

  final int index;
  final List<String> filterOptions;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late String selectedOption = ""; // Default selected state;
  late bool isSelected = false;

  @override
  void initState() {
    super.initState();
    selectedOption = "";
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (isSelected == false) {
        selectedOption = widget.filterOptions[0];
      }
    });
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
          ),
        ),
        GetX<FilterController>(builder: (controller) {
          return TextButton(
            onPressed: () {
              if (widget.index == 0) {
                sortModel.defaultLocation = selectedOption;
                controller.isFilter.value = true;
              } else {
                sortModel.defaultExpertise = selectedOption;
              }

              Navigator.pop(context);
            },
            child: Text(
              controller.value.value,
            ),
          );
        }),
      ],
      title: const Text("Choose Agency Based on Location"),
      content: DropdownButton<String>(
        value: selectedOption,
        items: widget.filterOptions.map((String state) {
          return DropdownMenuItem<String>(
            value: state,
            child: Text(state),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(
            () {
              isSelected = true;
              selectedOption = newValue!;
            },
          );
        },
      ),
    );
  }
}
