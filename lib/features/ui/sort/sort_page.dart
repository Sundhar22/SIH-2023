import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/filter/filter_expertise.dart';
import 'package:sih_2023/features/functions/filter/filter_locations.dart';
import 'package:sih_2023/features/functions/filter/filter_nearby.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:location/location.dart';
import 'package:sih_2023/features/ui/sort/sort_maps.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  late List<AgencyModel> agencySortResults;
  late LocationData locationData;
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
        title: Text("Sort Results ($resultFound)"),
        centerTitle: true,
        actions: const [],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: agencySortResults.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SortMapScreen(
                        sortAgencies: agencySortResults,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.location_on_outlined),
                label: const Text("View on Maps"),
              ),
            )
          : null,
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

  findSortFilters() {
    if (sortModel.defaultExpertise == "Null" &&
        sortModel.defaultLocation == "Null") {
      return filterNearBy();
    }
    List resultArr = agencyBasedLocation(
      allAgencyModels,
      sortModel.defaultLocation,
    );

    if (resultArr.isEmpty) {
      return [];
    }
    return agencyBasedExpertise(
      resultArr,
      sortModel.defaultExpertise,
    );
  }

  filterNearBy() {
    final List<AgencyModel> result = [];
    for (AgencyModel agencyEntry in allAgencyModels) {
      double distance = measureDistance(
          10.362110, 77.969332, agencyEntry.agencyLat, agencyEntry.agencyLong);
      if (distance < 60) {
        result.add(agencyEntry);
      }
    }
    return result;
  }
}
