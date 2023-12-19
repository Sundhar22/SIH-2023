import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';
import 'package:sih_2023/features/ui/post/view/succes_screen.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<NewPostController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          height: controller.buttonHeight.value,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(
                controller.postContent.value.length >= 10
                    ? Colors.red
                    : Colors.blue,
              ),
            ),
            onPressed: () async {
              if (postAsPost) {
                controller.postContent.value.length < 10
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter your post details',
                          ),
                          duration: Duration(
                            seconds: 1,
                          ), // Optional duration for how long the Snackbar should be visible.
                        ),
                      )
                    : await controller.pushPost()
                        // ignore: use_build_context_synchronously
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Shared in Social Sucessfully',
                              ),
                              duration: Duration(
                                seconds: 1,
                              ), // Optional duration for how long the Snackbar should be visible.
                            ),
                          )
                        // ignore: use_build_context_synchronously
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter your post details',
                              ),
                              duration: Duration(
                                seconds: 1,
                              ), // Optional duration for how long the Snackbar should be visible.
                            ),
                          );
              } else {
                print("Not a post");
                controller.postContent.value.length < 10
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter your post details',
                          ),
                          duration: Duration(
                            seconds: 1,
                          ), // Optional duration for how long the Snackbar should be visible.
                        ),
                      )
                    : addAlert(
                        controller.postContent.value,
                      );
              }
            },
            child: const Text(
              "Share",
            ),
          ),
        );
      },
    );
  }

  void addAlert(String alertContent) async {
    print("Alert Added");
    // Reference to the Firebase collection
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('alerts');

    // Data to be added
    Map<String, dynamic> data = {
      'alertContent': alertContent,
      'alertSender': 'National Disaster Relief Force',
      // Add other fields as needed
    };

    // Add data to the collection
    await collectionReference.add(data);
    print("Alert Added");
  }
}
