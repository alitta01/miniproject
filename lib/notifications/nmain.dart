// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';

// class noti extends StatefulWidget
// {
//   const noti({Key? key,}) : super(key: key);

//   @override
//   State<noti> createState() => notiState();
// }

// class notiState extends State<noti> {
//   late AndroidNotificationChannel channel;
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   String? mtoken = " ";
  

// void getToken() async {
//   final fcmToken = await FirebaseMessaging.instance.getToken();
//     await FirebaseMessaging.instance.getToken().then((token) {
//       setState(() {
//         mtoken = token;
//       });
//     });
//   }

//   void requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }

//  void loadFCM() async {
//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         importance: Importance.high,
//         enableVibration: true,
//       );

//       flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//       /// Create an Android Notification Channel.
//       ///
//       /// We use this channel in the `AndroidManifest.xml` file to override the
//       /// default FCM channel to enable heads up notifications.
//       await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);

//       /// Update the iOS foreground notification presentation options to allow
//       /// heads up notifications.
      

//     void listenFCM() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null && !kIsWeb) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               // TODO add a proper drawable resource to android, for now using
//               //      one that already exists in example app.
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       }
//     });
//   }

//   void initState() {
//     super.initState();
//     requestPermission();
//     loadFCM();
//     listenFCM();
//   }

//   void sendPushMessage(String body, String title, String token) async {
//     try {
//       await http.post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization':
//               'key=',
//         },
//         body: jsonEncode(
//           <String, dynamic>{
//             'notification': <String, dynamic>{
//               'body': body,
//               'title': title,
//             },
//             'priority': 'high',
//             'data': <String, dynamic>{
//               'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//               'id': '1',
//               'status': 'done'
//             },
//             "to": token,
//           },
//         ),
//       );
//       print('done');
//     } catch (e) {
//       print("error push notification");
//     }
//   }

//       await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   } 


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }