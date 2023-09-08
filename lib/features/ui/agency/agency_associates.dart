import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';

class AgencyAssociates extends StatelessWidget {
  const AgencyAssociates({
    super.key,
  });

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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const AssociateAgencyLayout();
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
  });

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(),
          SizedBox(height: 10),
          Text(
            "Nation Management of Water Resources",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
