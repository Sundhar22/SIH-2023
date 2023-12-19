import 'package:cloud_firestore/cloud_firestore.dart';

void addDocumentWithCustomId() {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String customDocumentId = "mguruprasanth2004@gmail.com";

  firestore.collection("your_collection").doc(customDocumentId).set({
    
  })
  .then((value) {
    print("Document successfully written with custom ID: $customDocumentId");
  })
  .catchError((error) {
    print("Error writing document: $error");
  });
}
