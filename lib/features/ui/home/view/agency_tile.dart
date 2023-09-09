import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/agency/agency_details.dart';

class AgencyTile extends StatelessWidget {
  const AgencyTile({
    super.key,
    required this.agencyName,
    required this.agencySpecialisation,
    required this.agencyImage,
    required this.agencyLocation,
    required this.agencyAssociates,
  });

  final String agencyName, agencySpecialisation, agencyImage, agencyLocation;
  final List<String> agencyAssociates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgencyDetailsScreen(
                imageLink: agencyImage,
                agencyName: agencyName,
                agencyLocation: agencyLocation,
                agencyExpeertise: agencySpecialisation,
                agencyAssociates: agencyAssociates,
              ),
            ),
          );
        },
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_right),
          splashRadius: 10,
        ),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: CachedNetworkImageProvider(
            agencyImage,
          ),
        ),
        title: Text(
          agencyName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(agencySpecialisation),
      ),
    );
  }
}
