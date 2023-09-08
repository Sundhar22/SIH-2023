import 'package:flutter/material.dart';

class AgencyCard extends StatelessWidget {
  AgencyCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.location});
  String image;
  String title;
  String subtitle;
  String location;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        title,
        textAlign: TextAlign.start,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            textAlign: TextAlign.start,
          ),
          Text(
            location,
            textAlign: TextAlign.start,
          )
        ],
      ),
      trailing: IconButton(
          onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_rounded)),
    );
  }
}
