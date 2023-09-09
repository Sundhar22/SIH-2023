import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:sih_2023/features/ui/search/controller/query_controller.dart';

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
          return ListView.builder(
            itemCount: getxController.searchResults.length,
            itemBuilder: (context, index) {
              return AgencyTile(
                agencyName: getxController.searchResults[index].agencyName,
                agencySpecialisation: "",
                agencyImage: getxController.searchResults[index].agencyLogo,
                agencyLocation: "agencyLocation",
                agencyAssociates: const [],
              );
            },
          );
        },
      ),
    );
  }
}
