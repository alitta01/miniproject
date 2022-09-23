// ignore_for_file: unused_local_variable

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/functions/getuserdetails.dart';

class Execution{
  var rng = Random();
 // List of items in our dropdown menu
  var Shiftitems = [   
    'Select Shift',
    'D',
    'A',
    'N',
  ];
  
  
 
  Future<int> available()async{    //check avilability of shifts onf an individual
    int i,availcount=0;
    for(i=1;i<=7;i++){
    final res=await FirebaseFirestore.instance.collection("next_tt").doc(Userdetails.nid).get();
    var avail=res.get(i.toString());
    if(avail==null){
      availcount=availcount+1;
    }
    }
    if(availcount==2)
    {return 1;}
    else if(availcount>2)
    {return 2;}
    else{
      return 0;
    }
  }
  
   void generateshift()async{ 
    checkuser();
    while(available()==0){
    var shift;                             //generate random day and shift
    var dayValue = Random().nextInt(6) + 1;
    var shiftvalue=Random().nextInt(2) + 1;
    if(shiftvalue==1){
      shift="D";
    }
    if(shiftvalue==2){
      shift="A";
    }
    if(shiftvalue==3){
      shift="N";
    }
    var a=await FirebaseFirestore.instance
        .collection('next_tt')
        .doc(Userdetails.nid).get();
    var b=a.get(dayValue.toString);
    if(b==null){             //Enter shift into table if empty slot
      await FirebaseFirestore.instance
        .collection('next_tt')
        .doc(Userdetails.nid).update({dayValue.toString():shift.toString()});
      print('Shift entered');
    }
    }
    if(available()==2){
      print("error:shifts are overflowed");

    }

    }
  
  void checkuser ()async{
  try{
    var a=await FirebaseFirestore.instance.collection('next_tt').doc(Userdetails.nid).get();
    if(a.exists){
      //exists
    }
    else{
      FirebaseFirestore.instance.collection('next_tt').doc(Userdetails.nid).set({'1':null,'2':null,'3':null,'4':null,'5':null,'6':null,'7':null,});
    }
  }
  // ignore: non_constant_identifier_names
  catch(Er){
    print('in exception');
    //zFirebaseFirestore.instance.collection('next_tt').doc(Userdetails.nid).set({'1':null,'2':null,'3':null,'4':null,'5':null,'6':null,'7':null,});
    // ignore: avoid_print
    print('firld created');
  }
  }
  

}
