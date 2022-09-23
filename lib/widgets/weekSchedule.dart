import 'package:flutter/material.dart';
import 'package:miniproject/ui/detailspage.dart';
import 'package:miniproject/functions/getuserdetails.dart';
import 'package:intl/intl.dart';
import 'package:miniproject/ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WSchedule extends StatelessWidget {
  // String day="";
  void initState(){
    Userdetails.getweek();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child:ListView(
        scrollDirection:Axis.horizontal,
        children:<Widget>[
          Daycard(day:'Sunday'),
          Daycard(day:'Monday'),
          Daycard(day:'Tuesday'),
          Daycard(day:'Wednesday'),
          Daycard(day:'Thursday'),
          Daycard(day:'Friday'),
          Daycard(day:'Saturday'),
          ]
                )
                );
                  }
}

//class to create weather card
class Daycard extends StatefulWidget{
  final String? day;
  const Daycard({ Key? key, this.day}): super(key: key);
  @override
  State<Daycard> createState() => _DaycardState();
}

class _DaycardState extends State<Daycard> {
  late DateTime first,last,daydate;
  String dshift='';

   DateTime findFirstDate(DateTime dateTime) {
  return dateTime.subtract(Duration(days:dateTime.weekday - 1));}

  DateTime findLastDate(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));}

  DateTime present(DateTime dateTime,int day) {
  return dateTime.add(Duration(days:(day-2)));}

  int getdayno(){
    int no=0;
    if(widget.day.toString()=='Sunday'){
      no=1;
      dshift=Userdetails.d1;
    }
    if(widget.day.toString()=='Monday'){
      no=2;
      dshift=Userdetails.d2;
    }
    if(widget.day.toString()=='Tuesday'){
      no=3;
      dshift=Userdetails.d3;
    }
    if(widget.day.toString()=='Wednesday'){
      no=4;
      dshift=Userdetails.d4;
    }
    if(widget.day.toString()=='Thursday'){
      no=5;
      dshift=Userdetails.d5;
    }
    if(widget.day.toString()=='Friday'){
      no=6;
      dshift=Userdetails.d6;
    }
    if(widget.day.toString()=='Saturday'){
      no=7;
      dshift=Userdetails.d7;
    }
    return no;
  }
   @override
 void initState(){
super.initState();
/*FirebaseFirestore.instance
        .collection('nurseinfo')
        .doc('id').get() .then((value){
 for(var d in value.doc) 
 {   print(d.id);

print(d.data());
}*/
  int no=getdayno();
  first=findFirstDate(DateTime.now());
  //first.add(Duration(days:1));
  daydate=present(first, no);
  //daydate.add(Duration(days:(no-1)));
  last=findLastDate(DateTime.now());

 }
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.day.toString(), style: const TextStyle(color: Colors.black, fontSize: 24.0)),
                  Text('',  style: const TextStyle(color: Colors.black)),
                  //Text(DateFormat.yMMMd().format(daydate).toString(), style: const TextStyle(color: Colors.black)),
                  Text(dshift,  style: const TextStyle(color: Colors.black)),
                  Image.network('https://openweathermap.org/img/w/01d.png'),
                  //Text(DateTime.now(), style: const TextStyle(color: Colors.black),                                                                                                                                                                                                                                                                                                                                                                                                                                                                    .toString(), style: const TextStyle(color: Colors.black)),
                  //Text('18:30', style: const TextStyle(color: Colors.black)),
                  Text(DateFormat.yMMMd().format(daydate).toString(), style: const TextStyle(color: Colors.black)),
                  ],
                  ),
                  ),);
  }
  //first=first.add(Duration(days:1));
}











