import 'package:flutter/material.dart';

class AgencyDescription extends StatelessWidget {
  const AgencyDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            "National Disastaer Relief Commitie",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Location(),
            AreaOfExpertise(),
          ],
        )
      ],
    );
  }
}

class AreaOfExpertise extends StatelessWidget {
  const AreaOfExpertise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.food_bank),
            SizedBox(width: 5),
            Text("Food"),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 10),
        Icon(Icons.location_on, color: Colors.red),
        Text(
          "Tamil Nadu, India",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
