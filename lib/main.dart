// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/functions/dialogs/show_messgae.dart';
import 'package:sih_2023/features/functions/notification/notifiction.dart';
import 'package:sih_2023/features/model/firebase_api.dart';
import 'package:sih_2023/features/theme/build_theme.dart';
import 'package:sih_2023/features/ui/chatsonic/ui/chatsonic.dart';
import 'package:sih_2023/features/ui/community/auth_controller.dart';
import 'package:sih_2023/features/ui/home/controller/agency_controller.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
import 'package:sih_2023/features/ui/post/controller/new_post_controller.dart';
import 'package:workmanager/workmanager.dart';

import 'features/ui/chat/view/message_model.dart';
import 'features/ui/home/controller/filter_controller.dart';
import 'firebase_options.dart';

final navigationKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  Workmanager().registerOneOffTask(
    "1",
    "simplePeriodicTask",
    // frequency: Duration(minutes: 15),
  );
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
      )
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
  );

  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(AgencyController());
    Get.put(FilterController());
    Get.put(NewPostController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIH-23',
        theme: buildTheme(),
        home:  HomeScreen());
  }
}

callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    notify();

    sendMessageToRoom(
        'wPspbEzkXUNJYrZL7MG7',
        Message(
            content: DateTime.now().hour.toString() +
                DateTime.now().minute.toString() +
                DateTime.now().second.toString(),
            type: 'Text',
            sender: 'test',
            time: Timestamp.now()));
    print('\x1B[31mNative called background task: $taskName\x1B[0m');
    // Firebase.initializeApp();

    return Future.value(true);
  });
}

notify() {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 11,
    channelKey: 'basic_channel',
    actionType: ActionType.Default,
    title: 'Hello World!',
    body: 'This is my first notification!',
  ));
  print('\x1B[31mNative called background task: \x1B[0m');
}

Future<void> sendMessageToRoom(String roomId, Message message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    // Reference the room's "chatData" subcollection and add the message
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .collection('chatData')
        .add(message.toMap());
  } catch (error) {
    print(error.toString());
    showToast(error.toString());
  }
}
