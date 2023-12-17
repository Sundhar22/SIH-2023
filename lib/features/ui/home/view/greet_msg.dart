import 'package:flutter/material.dart';
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
