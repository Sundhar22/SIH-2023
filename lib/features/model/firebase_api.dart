import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sih_2023/main.dart';

class FirebaseApi {
//   creating instance of the firebase messaging
  final _messageInstance = FirebaseMessaging.instance;

// this for initialize the notification
  Future<void> initNotification() async {
    // req the permission from the user
    await _messageInstance.requestPermission();
    //fetch the FCM for the user device
    final fcmToken = await _messageInstance.getToken();

    //   printing the FCM token

    print("fcToken - ${fcmToken.toString()}");

    initPushNotifications();
  }

//the function handles the received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    navigationKey.currentState
        ?.pushNamed('/notificationScreen', arguments: message);
  }

// the function initialize the foreground and background setting
  Future initPushNotifications() async {
//handle notification if the app was terminated and now open
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //   attach event listener for when a notification opens the app

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
