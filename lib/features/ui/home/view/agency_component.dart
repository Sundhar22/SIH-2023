import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/home/view/agency_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/ui/home/view/custom_title_widget.dart';

class AgencyComponent extends StatelessWidget {
  const AgencyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleWidget(titleContent: "All Agencies"),
          AgencyTile(),
          AgencyTile(),
          AgencyTile(),
          AgencyTile(),
          AgencyTile(),
          AgencyTile(),
          AgencyTile(),
        ],
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> retrieveCollection(
    String collectionName) async {
  List<Map<String, dynamic>> documents = [];

  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      documents.add(documentSnapshot.data() as Map<String, dynamic>);
    }
  } catch (e) {
    print("Error retrieving collection: $e");
  }

  return documents;
}
