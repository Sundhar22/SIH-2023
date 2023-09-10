import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClass {
  final FirebaseFirestore firestore;

  FirebaseClass({required this.firestore});

  Future<void> addDocument(
      String collectionName, Map<String, dynamic> documentData) async {
    await firestore.collection(collectionName).doc().set(documentData);
  }

  Future<void> updateDocument(String collectionName, String documentId,
      Map<String, dynamic> documentData) async {
    await firestore
        .collection(collectionName)
        .doc(documentId)
        .update(documentData);
  }

  Future<void> deleteDocument(String collectionName, String documentId) async {
    await firestore.collection(collectionName).doc(documentId).delete();
  }
}
