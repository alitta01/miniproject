
import  'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NotificationsP extends StatefulWidget {
  @override
  _NotificationsP createState() => _NotificationsP();
}

class _NotificationsP extends State {

  late int _totalNotifications;
  PushNotification? _notificationInfo;
  late final FirebaseMessaging _messaging;


void registerNotification() async {
  // 1. Initialize the Firebase app
  await Firebase.initializeApp(
  );

  // 2. Instantiate Firebase Messaging
  _messaging = FirebaseMessaging.instance;

  // 3. On iOS, this helps to take the user permissions
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    if (_notificationInfo != null) {
        // For displaying the notification as an overlay
        showSimpleNotification(
          Text(_notificationInfo!.title!),
          leading: NotificationBadge(totalNotifications: _totalNotifications),
          subtitle: Text(_notificationInfo!.body!),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );
      }
    // TODO: handle the received notifications
  } else {
    print('User declined or has not accepted permission');
  }
}

checkForInitialMessage() async {
  await Firebase.initializeApp();
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title,
      body: initialMessage.notification?.body,
    );
    setState(() {
      _notificationInfo = notification;
      _totalNotifications++;
    });
  }
}
@override
void initState() {
  _totalNotifications = 0;
  checkForInitialMessage();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notify'),
        brightness: Brightness.dark,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'App for capturing Firebase Push Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 16.0),
          NotificationBadge(totalNotifications: _totalNotifications),
          SizedBox(height: 16.0),
          // TODO: add the notification text here
          //TODO:Text('hiii this notofication')
  ],));
  }
}
class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}