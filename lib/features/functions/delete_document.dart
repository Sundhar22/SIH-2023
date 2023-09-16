import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/show_messgae.dart';

Future<void> deleteDocumentById(
    context, String collectionName, String documentId) async {
  try {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .delete();
    showToast("Room Deleted Succesfully");
  } catch (e) {
    showToast("Document Deleted");
  }
}
