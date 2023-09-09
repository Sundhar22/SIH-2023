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
      padding: const EdgeInsets.only(top: 50),
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
          const Row(
            children: [
              Text(
                "View Details",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.trending_up,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
