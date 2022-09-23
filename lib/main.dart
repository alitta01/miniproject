import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/ui/layoutpage.dart';
import 'package:miniproject/ui/layoutpage.dart';
import 'package:miniproject/ui/loginpage.dart';
//import 'package:flutter_login_signup/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miniproject/ui/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
    (
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyCsrif6Fx3y0Upv0eF4UjlnOAdivzeIBhs",
      appId: "1:698494638709:android:7fd7f682f5bcf2ee5d363c",
      messagingSenderId: "381774348035",
      projectId: "nutrix-c187e",
    ),
  );



  //FirebaseMessaging.instance.getToken().then((fcm) => print("Your token $fcm"))
;  runApp(MyApp());
}
//OnResume()
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:'Nurtrix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Auth()
     // home: Layouts(),

    );
  }
}