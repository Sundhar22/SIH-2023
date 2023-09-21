import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sih_2023/features/ui/onboarding/view/signin.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Text(
                  "Welcome to Soinc, LogIn/ Sign Up using your E-mail Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Image(
              height: 350,
              image: AssetImage(
                "assets/images/login.png",
              ),
            ),
            ListTile(
              onTap: () {
                signInWithGoogle();
              },
              contentPadding: const EdgeInsets.all(10),
              leading: const CircleAvatar(
                child: Icon(Icons.person_outline),
              ),
              title: const Text("Employee Login"),
              trailing: const Icon(Icons.arrow_right_alt),
              subtitle: const Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                      "SignIn as a employee of an agency & have access to the database"),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              contentPadding: const EdgeInsets.all(10),
              leading: const CircleAvatar(
                child: Icon(Icons.assignment_outlined),
              ),
              title: const Text("Agency Login"),
              trailing: const Icon(Icons.arrow_right_alt),
              subtitle: const Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                      "SignIn as an agency & have the access to update your details and progress."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // print(userCredential.user?.displayName);
  }
}

class Forms extends StatelessWidget {
  const Forms({
    super.key,
    required this.name,
    required this.icons,
  });

  final String name;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          Icon(
            icons,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
