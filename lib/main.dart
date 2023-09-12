import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/model/firebase_api.dart';
import 'package:sih_2023/features/theme/build_theme.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';import 'package:sih_2023/features/ui/notification/notification.dart';

import 'firebase_options.dart';

final navigationKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

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
      key: navigationKey,
      routes: {
        '/notificationScreen': (context) => const NotificationScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
