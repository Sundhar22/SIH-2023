import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';

Future<void> deleteDocumentById(
    context, String collectionName, String documentId) async {
  print(
      " The collectio name is $collectionName. The document id is $documentId");
  try {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .delete();
    showToast("Room Deleted Succesfully. Refresh the feed");
  } catch (e) {
    showToast("Something went wrong");
  }
}
