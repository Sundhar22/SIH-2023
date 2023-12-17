// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class PostController extends GetxController {
//   var posts = [].obs;
//   var fireBasePostInstance = FirebaseFirestore.instance.collection('posts');

//   void updatePosts() {}

//   void loadPosts() {
//     Future<QuerySnapshot<Map<String, dynamic>>> posts =
//         fireBasePostInstance.get();

//     posts.asStream();
//     String postUserName = posts['post_username'] ?? '';
//     String postImage = posts['post_image'] ?? '';
//     int postLikes = posts['post_likes'] ?? '';
//     String postDocument = posts['post_content'] ?? '';
//     String postUserImage = posts['post_userimage'] ?? '';
//     List<dynamic> postComments = posts['post_comments'];
//     print(posts);
//   }
// }
