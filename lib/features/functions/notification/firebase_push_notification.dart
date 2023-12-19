import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Initialize Firebase Messaging
    await _firebaseMessaging.setAutoInitEnabled(true);

    NotificationSettings settings =
        await _firebaseMessaging.requestPermission(provisional: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification permission granted.');
    } else {
      print('User declined permission.');
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Handle incoming messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title}');
      // Handle the incoming message here
    });
  }

  void _handleMessage(RemoteMessage message) {
    print(message.data);
  }

  Future<void> sendChatRoomNotification(
      String chatRoomName, List<String> memberTokens) async {
    final messaging = FirebaseMessaging.instance;

    final message = await messaging.sendMessage(
      data: {"chatRoomName": chatRoomName},
      messageType: "data", // or "notification" depending on your needs
      to: 'cAPi7AXVSSerBjzwZK6Uow:APA91bFntXXDfUSxlHYm0dltwe4P7XTDPAcpC3_oKtm7lI5nwWIzkLfkrTe3HRcoWJ5BfBKIS0tHmHkahppiHV-BukWYlfY9ctixh7nOV2VZ3cWxPkQCGt9nUcDbEJTt1_E0jkANRENR',
      collapseKey: "chat_room_creation",
    );
  }
}
