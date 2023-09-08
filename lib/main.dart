import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sih_2023/features/ui/chat/chat.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
import 'package:sih_2023/features/ui/responsehub/response_hub.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}
