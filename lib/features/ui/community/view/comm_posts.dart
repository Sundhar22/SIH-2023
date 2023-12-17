import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_2023/features/ui/community/view/post_component.dart';
import 'package:sih_2023/features/ui/community/view/post_skeleton.dart';
import 'package:sih_2023/features/ui/post/view/new_post.dart';

class CommunityPostScreen extends StatefulWidget {
  const CommunityPostScreen({super.key});

  @override
  State<CommunityPostScreen> createState() => _CommunityPostScreenState();
}

class _CommunityPostScreenState extends State<CommunityPostScreen> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> postCollections;

  @override
  void initState() {
    postCollections =
        FirebaseFirestore.instance.collection('posts').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewPostScreen(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: postCollections,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const PostSkeleton();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const PostSkeleton(); // Display a loading indicator
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const PostSkeleton();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var documentSnapshot = snapshot.data!.docs[index];
                    var documentData = documentSnapshot.data() as Map;
                    String postUserName = documentData['post_username'] ?? '';
                    String postImage = documentData['post_image'] ?? '';
                    int postLikes = documentData['post_likes'] ?? '';
                    String postDescription = documentData['post_content'] ?? '';
                    List<dynamic> postComments =
                        documentData['post_comments'] ?? [];
                    return CommPostComponent(
                      imageLink: postImage,
                      postUser: postUserName,
                      postDescription: postDescription,
                      userProfile: postImage,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
