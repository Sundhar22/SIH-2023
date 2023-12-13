import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDocumentToCollection(
  String collectionName,
  Map<String, dynamic> data,
) async {
  try {
    // Get a reference to the Firestore collection
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);

    // Add the document to the collection
    await collectionReference.add(data);
  } catch (e) {}
}
