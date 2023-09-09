import 'package:flutter/material.dart';
import 'package:sih_2023/features/functions/d.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';

class AgencyComponent extends StatelessWidget {
  const AgencyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleWidget(titleContent: "All Agencies"),
          SizedBox(height: 10),
          AgencyList(),
        ],
      ),
    );
  }
}

class AgencyList extends StatelessWidget {
  const AgencyList({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: agencies.length,
        itemBuilder: (context, index) {
          return AgencyTile(
            agencyName: agencies[index]["agencyName"],
            agencySpecialisation: agencies[index]["agencyExpertise"],
            agencyImage: agencies[index]["agencyLogo"],
            agencyLocation: agencies[index]["OperatingState"],
            agencyAssociates: agencies[index]["childAgencies"],
          );
        },
      ),
    );
  }
}
