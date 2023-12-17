import 'package:flutter/material.dart';

class AgencyDescription extends StatelessWidget {
  const AgencyDescription({
    super.key,
    required this.agencyDescription,
  });

  final String agencyDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
        title: const Text("Agency Description"),
        children: [
          Text(
            agencyDescription,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
