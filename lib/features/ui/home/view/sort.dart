import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/home/model/sort_model.dart';
import 'package:sih_2023/features/ui/home/view/filter_widget.dart';
import 'package:sih_2023/features/ui/sort/sort_page.dart';

void sortBottomSheet(BuildContext context) {
  debugPrint(allAgencyModels.toString());

  final List<String> filterName = [
    "Location",
    "Expertise",
    "Agency Type",
  ];

  final List<IconData> filterIcons = [
    Icons.maps_home_work_outlined,
    Icons.model_training_sharp,
    Icons.merge_type,
  ];

  showModalBottomSheet(
    isDismissible: true,
    shape: Border.all(color: Colors.transparent),
    context: context,
    builder: (BuildContext context) {
      sortModel.defaultLocation = "Null";
      return SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterName.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
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
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Icon(filterIcons[index]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(filterName[index]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(1)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SortPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.auto_awesome_outlined),
                    label: const Text(
                      "Apply Filters",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      );
    },
  );
}
