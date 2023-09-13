import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  late List<AgencyModel> agencySortResults;
  late int resultFound;
  @override
  void initState() {
    super.initState();
    agencySortResults = findSortFilters();
    resultFound = agencySortResults.length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sort Results $resultFound"),
      ),
      body: agencySortResults.isNotEmpty
          ? Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: agencySortResults.length,
                itemBuilder: (context, index) {
                  return AgencyTile(
                    agencyName: agencySortResults[index].agencyName,
                    agencySpecialisation:
                        agencySortResults[index].agencyExpertise,
                    agencyImage: agencySortResults[index].agencyLogo,
                    agencyLocation:
                        agencySortResults[index].agencyOperatingState,
                    agencyAssociates: agencySortResults[index].agencyAssocaites,
                    agecnyDescription:
                        agencySortResults[index].agencyDescription,
                  );
                },
              ),
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "No Agencies are registed in the desired settings",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

findSortFilters() {
  if (sortModel.defaultLocation == "Null") {
    return allAgencyModels;
  }
  Set<AgencyModel> results = {};
  for (AgencyModel agencyInfo in allAgencyModels) {
    if (agencyInfo.agencyOperatingState.toLowerCase() ==
        sortModel.defaultLocation.toLowerCase()) {
      results.add(agencyInfo);
    }
  }
  return results.toList();
}
