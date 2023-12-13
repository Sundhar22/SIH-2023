import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:sih_2023/features/ui/search/controller/query_controller.dart';

getValue(String knownValue, desiredKey) {
  dynamic key;
  for (AgencyModel agencyModel in allAgencyModels) {
    if (agencyModel.agencyName == knownValue) {
      desiredKey == 'location'
          ? key = agencyModel.agencyOperatingState
          : desiredKey == 'description'
              ? key = agencyModel.agencyDescription
              : key = agencyModel.agencyAssocaites;
    }
  }
  return key;
}

class QueryResults extends StatelessWidget {
  const QueryResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<QueryController>(
        builder: (getxController) {
          if (getxController.searchResults.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nothing to show up"),
              ],
            );
          }
          return Scrollbar(
            interactive: true,
            thickness: 5,
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: getxController.searchResults.length,
              itemBuilder: (context, index) {
                return AgencyTile(
                  agencyName: getxController.searchResults[index].agencyName,
                  agencySpecialisation:
                      getxController.searchResults[index].agencyExpertise,
                  agencyImage: getxController.searchResults[index].agencyLogo,
                  agencyLocation: getxController
                      .searchResults[index].agencyOperatingLocation,
                  agencyAssociates:
                      getxController.searchResults[index].agencyAssocaites,
                  agecnyDescription:
                      getxController.searchResults[index].agencyDescription,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
