import 'package:flutter/material.dart';
import 'package:miniproject/layout/sizeconfig.dart';
import 'package:miniproject/functions/getuserdetails.dart';
String shift='a';
class Today extends StatelessWidget {
  const Today({Key? key,}) : super(key: key);
  void initState(){
    //Userdetails.getShift();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Today's Schedule\n"),
            TextSpan(
              text: Userdetails.shift,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}