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
    void _showSmallPopup(BuildContext context) {
      final List<String> options = [
        "Area of Expertise",
        "State",
        "District",
        "NearBy",
        "Central",
      ];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Filters'),
            content: SizedBox(
              height: 260, // Set the desired height
              child: SingleChildScrollView(
                child: Scrollbar(
                  child: Column(
                    children: [
                      for (int i = 0; i < options.length; i++)
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const CircleAvatar(),
                          title: Text(options[i]),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Apply'),
              ),
            ],
          );
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
            _showSmallPopup(context);
          },
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
