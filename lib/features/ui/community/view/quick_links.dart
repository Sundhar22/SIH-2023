import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/community/view/get_chips.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 25,
      ),
      child: SizedBox(
        height: 30,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: getChips(),
        ),
      ),
    );
  }
}
