import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';

class AgencyAssociates extends StatelessWidget {
  const AgencyAssociates({
    super.key,
    required this.agencyList,
    required this.imageLink,
  });

  final String imageLink;
  final List<String> agencyList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitleWidget(titleContent: "Child Agencies"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
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
          ),
        ],
      ),
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
      width: 160,
      decoration: const BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(
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
          Text(
            agencyName,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
