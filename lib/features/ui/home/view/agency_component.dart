import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';

class AgencyComponent extends StatelessWidget {
  const AgencyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AgencyList(),
      ],
    );
  }
}

class AgencyList extends StatelessWidget {
  const AgencyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        child: GetX<AgencyController>(
          builder: (getxController) {
            return ListView.builder(
              reverse: false,
              itemCount: getxController.agecnyListLength.value,
              itemBuilder: (context, index) {
                if (getxController.agencyList.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey.withOpacity(.1),
                      ),
                      title: Container(
                        margin: const EdgeInsets.only(right: 60),
                        height: 10,
                        width: 70,
                        color: Colors.grey.withOpacity(.1),
                      ),
                      subtitle: Container(
                        margin: const EdgeInsets.only(right: 100),
                        height: 10,
                        width: 70,
                        color: Colors.grey.withOpacity(.1),
                      ),
                    ),
                  );
                } else {
                  return AgencyTile(
                    agencyName: getxController.agencyList[index].agencyName,
                    agencySpecialisation:
                        getxController.agencyList[index].agencyExpertise,
                    agencyImage: getxController.agencyList[index].agencyLogo,
                    agencyLocation:
                        getxController.agencyList[index].agencyOperatingState,
                    agencyAssociates:
                        getxController.agencyList[index].agencyAssocaites,
                    agecnyDescription:
                        getxController.agencyList[index].agencyDescription,
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
