import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';

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
        tilePadding: const EdgeInsets.all(15),
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: AgencyLocation(
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
            Icon(logos[area], color: Colors.amber),
            const SizedBox(width: 5),
            Text(area),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class AgencyLocation extends StatelessWidget {
  const AgencyLocation({
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
