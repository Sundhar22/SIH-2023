import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/sort.dart';
import 'package:sih_2023/features/ui/search/view/search.dart';

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
