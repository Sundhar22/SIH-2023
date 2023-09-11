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
        initiallyExpanded: false,
        childrenPadding: const EdgeInsets.all(10),
        title: const Text("Agency Description"),
        children: [
          Text(
            agencyDescription,
            // overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
