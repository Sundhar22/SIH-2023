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
          onPressed: () {},
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
