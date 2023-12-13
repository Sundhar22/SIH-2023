import 'dart:math';

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
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Agency Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MyDelegate(imageLink: imageLink),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 20),
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
            )
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  final String imageLink;
  MyDelegate({required this.imageLink});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: AgencyImageHolder(imageLink: imageLink),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

//  AgencyImageHolder(imageLink: imageLink),
//               const SizedBox(height: 10),
//               AgencyInformation(
//                 name: agencyName,
//                 area: agencyExpertise,
//                 location: agencyLocation,
//               ),
//               AgencyDescription(
//                 agencyDescription: angencyDescription,
//               ),
//               agencyAssociates[0] != ""
//                   ? AgencyAssociates(
//                       imageLink: imageLink,
//                       agencyList: agencyAssociates,
//                     )
//                   : const SizedBox(),
//               const ExpansionTile(
//                 title: Text("Employee Details"),
//               ),
//               const SizedBox(height: 50),
