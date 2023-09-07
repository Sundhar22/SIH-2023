import 'package:flutter/material.dart';

class AgencyTile extends StatelessWidget {
  const AgencyTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(1),
        onTap: () {},
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_right),
          splashRadius: 10,
        ),
        leading: const CircleAvatar(
          radius: 35,
        ),
        title: const Text(
          "National Disaster Relief",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Food Relief Authority"),
      ),
    );
  }
}
