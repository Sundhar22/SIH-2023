import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/sort/sort_page.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget(
      {super.key, required this.index, required this.filterOptions});

  final int index;
  final List<String> filterOptions;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // List of available states

  String selectedState = ""; // Default selected state;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (isSelected == false) {
        selectedState = widget.filterOptions[0];
      }
    });
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SortPage(),
              ),
            );
          },
          child: const Text(
            "View Results",
          ),
        ),
        TextButton(
          onPressed: () {
            if (widget.index == 0) {
              sortModel.defaultLocation = selectedState;
            } else if (widget.index == 1) {
              sortModel.defaultExpertise = selectedState;
            }
            Navigator.pop(context);
          },
          child: const Text(
            "Apply More",
          ),
        ),
      ],
      title: const Text("Choose Agency Based on Location"),
      content: DropdownButton<String>(
        value: selectedState,
        items: widget.filterOptions.map((String state) {
          return DropdownMenuItem<String>(
            value: state,
            child: Text(state),
          );
        }).toList(),
        onChanged: (newValue) {
          sortModel.defaultLocation = newValue ?? 'TamilNadu';
          setState(
            () {
              isSelected = true;
              selectedState = newValue ?? "";
            },
          );
        },
      ),
    );
  }
}
