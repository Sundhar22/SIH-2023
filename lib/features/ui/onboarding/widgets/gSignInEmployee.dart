import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';

employeeGSignin(BuildContext context) async {
  GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  // Fetch Agency DocID
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Retrieve the document snapshot
    DocumentSnapshot documentSnapshot = await firestore
        .collection("employees")
        .doc(userCredential.user?.email)
        .get();


    // Check if the document exists
    if (documentSnapshot.exists) {

      // Access the data from the document
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      String agencyDocId = data["agencyDocID"];



      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference collectionReference = firestore.collection('rooms');
        print("Room Fetched");

        QuerySnapshot querySnapshot = await collectionReference.get();
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {

        print("Room Check");

          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          List agencyId = data['agencies'];

          for (var i in agencyId) {
            if (i == agencyDocId){
              print("hello My friend");
              isEmployee = true;
            }

            
          }

          if (agencyDocId == data[''])
          
          // Use the data as needed

          print("Document Data: $data");
        }
      } catch (e) {
        print("Error retrieving documents: $e");
      }
    } else {
      showToast("Not Registered in Agencies");
      return null;
    }
  } catch (e) {
    print("Error retrieving document: $e");
    return null;
  }

  //
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}
