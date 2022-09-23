import 'package:flutter/material.dart';
import 'package:miniproject/ui/layoutpage.dart';
import '../net/flutterfire.dart';
import 'package:miniproject/functions/getuserdetails.dart';
import 'package:flutter/cupertino.dart';

class Auth  extends StatefulWidget {
 Auth ({Key? key}) : super(key: key);

  @override
  State<Auth > createState() =>  AuthState();
}

class  AuthState extends State<Auth> {
  TextEditingController _idField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 500.0,
              height:500.0,
              fit: BoxFit.none,
              image: new AssetImage('assets/images/N logo.png'))
              ,
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Color.fromARGB(255, 22, 156, 91)),
                controller: _idField,
                decoration: InputDecoration(
                  hintText: "something@email.com",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 22, 156, 91),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 22, 156, 91),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color:Color.fromARGB(255, 22, 156, 91)),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 22, 156, 91),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 22, 156, 91),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.greenAccent,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =await login(_idField.text, _passwordField.text);
                  if (shouldNavigate) {
                   Userdetails.getUserid(_idField.text);
                   //Userdetails.getShift();
                    //debugPrint(Userdetails().name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Layouts(),
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
              
            ),
            
              
            
          ],
        ),
      ),
    );
  }
}