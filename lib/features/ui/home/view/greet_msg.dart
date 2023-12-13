import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
import 'package:sih_2023/features/ui/home/view/sort.dart';
import 'package:sih_2023/features/ui/search/view/search.dart';

class GreetMessage extends StatelessWidget {
  const GreetMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define your filter options here

    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTitleWidget(titleContent: "Welcome NDRF"),
          QuickActionWidgets()
        ],
      ),
    );
  }
}

class QuickActionWidgets extends StatefulWidget {
  const QuickActionWidgets({
    super.key,
  });

  @override
  State<QuickActionWidgets> createState() => _QuickActionWidgetsState();
}

class _QuickActionWidgetsState extends State<QuickActionWidgets> {
  void _showDropdownPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> dropdownOptions = [
          'Option 1',
          'Option 2',
          'Option 3',
          'Option 4'
        ];
        String? selectedOption = 'Option 1';
        return AlertDialog(
          title: const Text('Select an Option'),
          content: DropdownButton<String>(
            value: selectedOption,
            items: dropdownOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Use String? here
              setState(() {
                selectedOption = newValue;
              });
              // Navigator.of(context).pop(); // Close the dialog
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            sortBottomSheet(context);
          },
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
