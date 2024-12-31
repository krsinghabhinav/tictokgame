import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late FirebaseMessaging _messaging;
  String? _token;

  @override
  void initState() {
    super.initState();
    _setupFCM();
  }

  Future<void> _setupFCM() async {
    _messaging = FirebaseMessaging.instance;

    // Request permissions for iOS
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    // Get the FCM token
    _token = await _messaging.getToken();
    print("FCM Token: $_token");

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received: ${message.notification?.title}');
      _showDialog(message.notification?.title, message.notification?.body);
    });

    // Handle background messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }

  void _showDialog(String? title, String? body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "Notification"),
          content: Text(body ?? "No content"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Push Notifications')),
      body: Center(
        child: Text(
          'FCM Token:\n$_token',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
