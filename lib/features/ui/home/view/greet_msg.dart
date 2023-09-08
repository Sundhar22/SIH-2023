import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';
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

class QuickActionWidgets extends StatelessWidget {
  const QuickActionWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void _showOptionsDialog(BuildContext context) {
      String selectedOption = 'None'; // Default selected option
      final List<String> options = [
        'Loaction',
        'Area of Expertise',
        'Area of Expertise',
        'Area of Expertise',
        'Area of Expertise',
        'Area of Expertise',
        '',
        '',
      ];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select an Option'),
            children: options.map((String option) {
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context,
                      option); // Close dialog and return selected option
                },
                child: ListTile(
                  title: Text(option),
                ),
              );
            }).toList(),
          );
        },
      ).then(
        (value) {
          if (value != null) {
            selectedOption = value;
          }
        },
      );
    }

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
            _showOptionsDialog(context);
          },
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
