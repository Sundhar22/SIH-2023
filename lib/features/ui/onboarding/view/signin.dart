import 'package:agora_uikit/models/agora_rtm_mute_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
import 'package:sih_2023/features/ui/onboarding/view/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Welcome \nBack to Sonic !!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            const Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/signinlogo.png"),
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  onTap: () async {
                    String? userEmail = await signInWithGoogle();
                    if (userEmail != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  leading: const Icon(Icons.login, size: 25),
                  title: const Text("LogIn With Google"),
                  trailing: IconButton.filledTonal(
                    onPressed: () async {},
                    icon: const Icon(Icons.g_mobiledata),
                  ),
                  subtitle: const Column(
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "Existing user Quickly Login to acess the application",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  leading:
                      const Icon(Icons.app_registration_outlined, size: 25),
                  title: const Text("SignUp With Google"),
                  trailing: IconButton.filledTonal(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    // onPressed: () async {
                    //   if (await signInWithGoogle() != null) {
                    //     // ignore: use_build_context_synchronously
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const SignUpPage(),
                    //       ),
                    //     );
                    //   }
                    // },
                    icon: const Icon(Icons.arrow_right),
                  ),
                  subtitle: const Column(
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "SignIn your agency to register into the centralised database",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

Future<String?> signInWithGoogle() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  String? userEmail = userCredential.user?.email;
  print(userEmail);

  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Retrieve the document snapshot
    DocumentSnapshot documentSnapshot = await firestore
        .collection("agencies")
        .doc(userEmail)
        .get();

    print(documentSnapshot.id);

    // Check if the document exists
    if (documentSnapshot.exists) {
      // Access the data from the document
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      // Print or use the data as needed
      print("Document data: $data");

      // Set the user email in the UserData class
      userData = userEmail!;
      return userEmail;
    } else {
      showToast("Not Registered");
      return null;
    }
  } catch (e) {
    print("Error retrieving document: $e");
    return null;
  }
}
}
