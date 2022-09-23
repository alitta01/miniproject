library globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Userdetails{
static String name='',sex='d',phone='e',docid='a',nid='e',email='w',shift='nil';

  //late final result;
static String d1='1',d2='1',d3='2',d4='3',d5='4',d6='5',d7='6';
  //Userdetails(this.mail);
static void getUserid(String mail)async{
  print(mail);
  final result=await FirebaseFirestore.instance
        .collection('nurseinfo')
        .doc(mail).get();
  
  name=result.get('name');
  print(name);
  nid=result.get('nid');
  sex=result.get('gender');
  //print(id);
  email=result.id;
  sex=result.get('gender');
  phone=result.get('phone');
  print(sex);
  getShift();
  getweek();
  }
  //@override

  static String getmail(){
    return email;
  }

  static Future<String> getUsertt(int i)async{
    print(nid);
    final result1=await FirebaseFirestore.instance
        .collection('current_tt')
        .doc(nid).get();
    d1= result1.get(i.toString());
    print(d1);
    //d2= result1.get('2');
    //d3= result1.get('3');
    //d4= result1.get('4');
    //d5= result1.get('5');
    //d6= result1.get('6');
    //d7= result1.get('7');
    return d1;
  }
  static void getweek() async {
    d1= getUsertt(1) as String;
    print("week:");
    print(d1);
    d2= getUsertt(2) as String;
    d3= getUsertt(3) as String;
    d4= getUsertt(4) as String;
    d5= getUsertt(5) as String;
    d6= getUsertt(6) as String;
    d7= getUsertt(7) as String;

  }

  static void getShift()async{
    final result1=await FirebaseFirestore.instance.collection('current_tt').doc(nid).get();
    shift=result1.get(DateTime.now().weekday.toString());
    print(DateTime.now().weekday.toString());
    print(shift);
    if(shift=='D'){
      shift='DAY SHIFT';
    }
    else if(shift=='A'){
      shift='AFTERNOON SHIFT';
    }
    else if(shift=='N'){
      shift='NIGHT SHIFT';
    }
  }
}
  