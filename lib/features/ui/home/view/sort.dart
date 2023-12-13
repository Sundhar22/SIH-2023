import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/home/view/filter_widget.dart';
import 'package:sih_2023/features/ui/sort/sort_page.dart';

void sortBottomSheet(BuildContext context) {
  debugPrint(allAgencyModels.toString());

  final List<String> filterName = [
    "Location",
    "Expertise",
  ];

  final List<IconData> filterIcons = [
    Icons.location_on_outlined,
    Icons.work_outline,
  ];

  showModalBottomSheet(
    isDismissible: true,
    shape: Border.all(color: Colors.transparent),
    context: context,
    builder: (BuildContext context) {
      sortModel.defaultLocation = "Null";
      sortModel.defaultExpertise = "Null";
      return SizedBox(
        height: 300,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: filterIcons.length + 2,
            itemBuilder: (context, index) {
              if (index < 2) {
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
              } else if (index == 2) {
                return ListTile(
                  leading: const Icon(Icons.location_history_outlined),
                  title: const Text("Near By me"),
                  trailing: const Icon(Icons.filter_alt_outlined),
                  subtitle: const Text(
                    "Narrow down agencies near you",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SortPage(),
                      ),
                    );
                  },
                );
              } else {
                return const ViewResults();
              }
            },
          ),
        ),
      );
    },
  );
}

class ViewResults extends StatelessWidget {
  const ViewResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<FilterController>(builder: (controller) {
      return controller.isFilter.value
          ? ListTile(
              leading: const Icon(Icons.filter_list),
              title: const Text("View Results"),
              subtitle: const Text(
                  "Apply the magic filters & narrow down the agencies"),
              trailing: const Icon(Icons.auto_awesome_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SortPage(),
                  ),
                );
              },
            )
          : const SizedBox();
    });
  }
}
