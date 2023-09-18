import 'package:flutter/material.dart';

void showDialogMap(
  BuildContext context,
  String agencyName,
  agencyImage,
  agencyDescription,
) {
  showBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(agencyName),
            Text(agencyDescription),
          ],
        ),
      );
    },
  );
}
