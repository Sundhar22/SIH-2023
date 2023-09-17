import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/home/view/filter_widget.dart';

void sortBottomSheet(BuildContext context) {
  debugPrint(allAgencyModels.toString());

  final List<String> filterName = [
    "Location",
    "Expertise",
    "Near By",
  ];

  final List<IconData> filterIcons = [
    Icons.location_on_rounded,
    Icons.work,
    Icons.emergency_share,
  ];

  showModalBottomSheet(
    isDismissible: true,
    shape: Border.all(color: Colors.transparent),
    context: context,
    builder: (BuildContext context) {
      sortModel.defaultLocation = "Null";
      sortModel.defaultExpertise = "Null";
      return SizedBox(
        height: 230,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: filterIcons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filterName[index]),
                leading: Icon(filterIcons[index]),
                subtitle:
                    Text("Sort Agencies based on the ${filterName[index]}"),
                trailing: const Icon(Icons.filter_alt_outlined),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FilterWidget(
                        index: index,
                        filterOptions: filterOptionsAvailable[index],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      );
    },
  );
}
