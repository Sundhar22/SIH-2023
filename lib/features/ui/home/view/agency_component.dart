import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
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

class AgencyList extends StatefulWidget {
  const AgencyList({super.key});

  @override
  State<AgencyList> createState() => _AgencyListState();
}

class _AgencyListState extends State<AgencyList> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        child: GetX<AgencyController>(
          builder: (getxController) {
            return ListView.builder(
              reverse: true,
              itemCount: getxController.agecnyListLength.value,
              itemBuilder: (context, index) {
                if (getxController.agencyList.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      // color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(1),
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey.withOpacity(.1),
                        ),
                        title: Container(
                          height: 10,
                          width: double.maxFinite,
                          color: Colors.grey.withOpacity(.1),
                        ),
                        subtitle: Container(
                          height: 10,
                          width: 50,
                          color: Colors.grey.withOpacity(.1),
                        ),
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
