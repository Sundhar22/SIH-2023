import 'package:flutter/material.dart';

class AgencyInformation extends StatelessWidget {
  const AgencyInformation({
    super.key,
    required this.name,
    required this.location,
    required this.area,
  });

  final String name, location, area;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.only(left: 15),
        title: const Text("Agency Details"),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Location(
                    location: location == '' ? 'All Regions' : location),
              ),
              AreaOfExpertise(area: area),
            ],
          ),
        ],
      ),
    );
  }
}

class AreaOfExpertise extends StatelessWidget {
  const AreaOfExpertise({
    super.key,
    required this.area,
  });

  final String area;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.food_bank, color: Colors.amber),
            const SizedBox(width: 5),
            Text(area),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const Icon(Icons.location_on, color: Colors.red),
        const SizedBox(width: 5),
        Text(
          location,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
