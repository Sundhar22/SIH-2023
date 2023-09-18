import 'package:flutter/material.dart';

void showDialogMap(
  BuildContext context,
  String agencyName,
  agencyLocation,
  agencyExpertise,
) {
  showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(
                agencyName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.work_outline_outlined),
              title: Text(
                agencyExpertise,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(
                agencyLocation,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    },
  );
}
