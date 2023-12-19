import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class FirebaseApi {
  final _messageInstance = FirebaseMessaging.instance;

  Future<void> getToken() async {
    await _messageInstance.getToken().then((value) async {
      await FirebaseFirestore.instance
          .collection("userTokens")
          .doc('users')
          .set({'token': value});
    });
  }

  void requestPermission() async {
    NotificationSettings settings = await _messageInstance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void sendPushNotification(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAzuJpnCQ:APA91bH07BIVdZFCeX-MzWirssQwqOGG20ahQWkpm8pIyx4imKLdeITXJ9ABwl2YJ5v5ZtRfxEfz1_qypjn1AYubgCJaMi526E6D7_pGCbpjBDp97rOdIMwzNpNZn-FHC27eXPNJC6ro',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title
            },
            'notification': {
              'body': body,
              'title': title,
              'android_channel_id': 'sih'
            },
            'to': token,
          },
        ),
      );
      print("\x1B[31m Success\x1B[0m");
    } catch (e) {
      print("\x1B[31m ERROR - ${e.toString()}\x1B[0m");
    }
  }
}

void initialize() {
  FirebaseApi().requestPermission();
  FirebaseApi().getToken();
}
