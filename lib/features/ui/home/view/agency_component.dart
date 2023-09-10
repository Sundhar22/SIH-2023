import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/agencies.dart';
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
      child: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        child: ListView.builder(
          itemCount: agencyKeys.length,
          itemBuilder: (context, index) {
            Map? agencyData = agencyList[agencyKeys[index]];
            if (agencyData != null) {
              return AgencyTile(
                agencyName: agencyData["agencyName"] ?? index.toString(),
                agencySpecialisation:
                    expertiseMapping[agencyData["agencyType"]] ??
                        index.toString(),
                agencyImage: agencyData["agencyLogo"] ?? index.toString(),
                agencyLocation:
                    agencyData["OperatingState"] ?? index.toString(),
                agencyAssociates: agencyData["childAgencies"] ?? [""],
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
