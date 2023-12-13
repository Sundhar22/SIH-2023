import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> retrieveCollection(
    String collectionName) async {
  List<Map<String, dynamic>> documents = [];

  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      documents.add(documentSnapshot.data() as Map<String, dynamic>);
    }
  } catch (e) {}
  print(documents);
  return documents;
}
