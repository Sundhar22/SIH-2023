import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/theme/build_theme.dart';
import 'package:sih_2023/features/ui/SignUp/register.dart';
import 'package:sih_2023/features/ui/SignUp/signin.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  Get.put(FilterController());
  Get.put(AgencyController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIH-23',
      theme: buildTheme(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.data==null){
              return SignInPage();
            }
            else {
              return RegistrationPage();
            }
          }
          return Center(child: CircularProgressIndicator());},
      ),
      
    );
  }
}
