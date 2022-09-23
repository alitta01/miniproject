// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';

// import 'package:flutter/cupertino.dart';

// class AuthService with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   ///
//   /// return the Future with firebase user object FirebaseUser if one exists
//   ///
//   final Future<FirebaseUser> getUser() {
//     return _auth.currentUser();
//   }

//   // wrapping the firebase calls
//   Future logout() async {
//     var result = FirebaseAuth.instance.signOut();
//     notifyListeners();
//     return result;
//   }

//   // wrapping the firebase calls
//   Future createUser(
//       {
//       String firstName;
//       String lastName;
//       String email;
//       String password;
//       }) async {
//         var email2 = email;
//         var r = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email2, password: password);

//     var u = r.user;
//     UserUpdateInfo info = UserUpdateInfo();
//     info.displayName = '$firstName $lastName';
//     return await u.updateProfile(info);
//   }

//   ///
//   /// wrapping the firebase call to signInWithEmailAndPassword
//   /// `email` String
//   /// `password` String
//   ///
//   Future<FirebaseUser> loginUser({String email, String password}) async {
//     try {
//       var result = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       // since something changed, let's notify the listeners...
//       notifyListeners();
//       return result.user;
//     }  catch (e) {
//       throw new AuthException(e.code, e.message);
//     }
//   }
//   try {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: "barry.allen@example.com",
//     password: "SuperSecretPassword!"
//   );
// }on FirebaseAuthException catch(e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
// }