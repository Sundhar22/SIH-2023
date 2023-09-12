import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/agency/agency_associates.dart';
import 'package:sih_2023/features/ui/agency/agency_description.dart';
import 'package:sih_2023/features/ui/agency/agency_information.dart';
import 'package:sih_2023/features/ui/agency/agency_image.dart';

class AgencyDetailsScreen extends StatelessWidget {
  const AgencyDetailsScreen(
      {super.key,
      required this.imageLink,
      required this.agencyName,
      required this.agencyLocation,
      required this.agencyExpertise,
      required this.agencyAssociates,
      required this.angencyDescription});

  final String imageLink;
  final String agencyName;
  final String agencyLocation;
  final String agencyExpertise;
  final String angencyDescription;
  final List agencyAssociates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agency Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgencyImageHolder(imageLink: imageLink),
              const SizedBox(height: 10),
              AgencyInformation(
                name: agencyName,
                area: agencyExpertise,
                location: agencyLocation,
              ),
              AgencyDescription(
                agencyDescription: angencyDescription,
              ),
              agencyAssociates[0] != ""
                  ? AgencyAssociates(
                      imageLink: imageLink,
                      agencyList: agencyAssociates,
                    )
                  : const SizedBox(),
              const ExpansionTile(
                title: Text("Employee Details"),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
