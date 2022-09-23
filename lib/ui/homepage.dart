import 'package:flutter/material.dart';
import 'package:miniproject/functions/getuserdetails.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miniproject/layout/theme.dart';
import 'package:miniproject/widgets/navbar.dart';
import 'package:miniproject/widgets/weekSchedule.dart';
import 'package:miniproject/widgets/todayschedule.dart';
import 'package:miniproject/layout/sizeconfig.dart';

//Widget for input
class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> {
  void initState(){
   Userdetails.getShift();
   debugPrint(Userdetails.shift);
  }
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
    body: Container(
        decoration: BoxDecoration(color: Colors.greenAccent),
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        child: Container(
            padding: EdgeInsets.fromLTRB(20.0,10.0, 20.0, 10.0),
            decoration: BoxDecoration(color: Color.fromARGB(255, 253, 249, 249)),
            child: SingleChildScrollView(
              child:Column(
                children: <Widget>[
                Text(
                  "Hi,Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0, 
                    
                    fontWeight: FontWeight.w700),
                ),
                Today(),
                Image(
              width:getProportionateScreenWidth(120),
              height:getProportionateScreenHeight(310),
              image: new AssetImage('assets/images/Nurse cartoon.png')),
                Text(
                  "This Week:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.0, 
                    fontWeight: FontWeight.w700),
                ),

                 SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WSchedule(),
                ),
              ),

              ],
            ),
        ))),
        //bottomNavigationBar: BottomNavBar(),
    );
  }
}