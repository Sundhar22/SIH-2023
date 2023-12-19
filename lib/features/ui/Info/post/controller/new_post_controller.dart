import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class NewPostController extends GetxController {
  RxString postContent = "".obs;
  RxString imageLink = "null".obs;
  RxInt maxLines = 500.obs;
  RxDouble buttonHeight = 50.0.obs;
  RxDouble buttonSplasRadius = 20.0.obs;

  // Post Function
  Future<bool> pushPost() async {
    String downloadUrl = "null";
    if (imageLink.value != "null") {
      final File imageFile = File(imageLink.value);
      final Reference storageReference = FirebaseStorage.instance.ref().child(
            'images/${DateTime.now().millisecondsSinceEpoch}.png',
          );

      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
      downloadUrl = await storageSnapshot.ref.getDownloadURL();
    }

    try {
      // Reference to the Firestore collection
      CollectionReference collection =
          FirebaseFirestore.instance.collection('posts');

      // Data you want to add to the document
      Map<String, dynamic> data = {
        'post_comments': [],
        'post_content': postContent.value,
        'post_image': downloadUrl,
        'post_likes': 0,
      };

      // Add a new document with a generated ID
      await collection.add(data);
      postContent.value = "";
      imageLink.value = "null";
      return true;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    }
  }
}
