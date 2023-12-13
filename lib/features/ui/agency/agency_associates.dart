import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/agency/expanded_agency_screen.dart';
import 'package:sih_2023/features/ui/home/model/agency_model.dart';

getModel(String dictKey) {
  for (AgencyModel element in allAgencyModels) {
    if (element.agencyKey == dictKey) {
      return element;
    }
  }
}

class AgencyAssociates extends StatelessWidget {
  const AgencyAssociates({
    super.key,
    required this.agencyList,
    required this.imageLink,
  });

  final String imageLink;
  final List<dynamic> agencyList;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      title: const Text("Child Agencies"),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: agencyList.length,
                itemBuilder: (context, index) {
                  return AssociateAgencyLayout(
                    agencyLogo: imageLink,
                    agencyName: agencyList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AssociateAgencyLayout extends StatelessWidget {
  const AssociateAgencyLayout({
    super.key,
    required this.agencyName,
    required this.agencyLogo,
  });

  final String agencyName, agencyLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(agencyLogo),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 100,
            child: Text(agencyName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black)),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              dynamic model = getModel(agencyName) ?? '';
              if (model != '') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgencyDetailsScreen(
                      imageLink: model.agencyLogo,
                      agencyName: model.agencyName,
                      agencyLocation: model.agencyOperatingState,
                      agencyExpertise: model.agencyExpertise,
                      agencyAssociates: model.agencyAssocaites,
                      angencyDescription: model.agencyDescription,
                    ),
                  ),
                );
              } else {
                Fluttertoast.showToast(
                  msg: "The agency is not registered",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              }
            },
            child: const Row(
              children: [
                Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
