
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/functions/getuserdetails.dart';

class NewSchedule extends StatefulWidget {

  @override
  _NewSchedule createState() {
    return _NewSchedule();
  }
}

class _NewSchedule extends State<NewSchedule> {

  String dropdownvalue1 = 'Select Shift';  
 
  // List of items in our dropdown menu
  var Shiftitems = [   
    'Select Shift',
    'D',
    'A',
    'N',
  ];
  
  String dropdownvalue2 = 'Select Day';
  var Dayitems = [   
    'Select Day',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  String SelectDay='';
  String SelectShift='';
  int count=0;
  void getTable(String shift,int days)async {
    
    final result=await FirebaseFirestore.instance.collection('count')
        .doc(shift).get();
    count=result.get(days.toString());
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
  void entershift(String shift,int days,int count)async{
    
    await FirebaseFirestore.instance
        .collection('next_tt')
        .doc(Userdetails.nid).update({days.toString():shift});
     await FirebaseFirestore.instance
        .collection('count')
        .doc(shift).update({days.toString():(count+1)});   
  }
 @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Adding Schedule"),
          backgroundColor: Colors.greenAccent, //background color of app bar
        ),
        body: Container(
          child:Column(
            children:[
              Center(
                    child:DropdownButton(
                      // Initial Value    
                      value: dropdownvalue2,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),   
                      // Array list of items
                      items: Dayitems.map((String Dayitems) {
                return DropdownMenuItem(
                    value: Dayitems,
                    child: Text(Dayitems),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue2 = newValue!;
                  SelectDay=newValue;
                });
              },
            ),),
            Center(
              child:DropdownButton(
                      // Initial Value    
                      value:dropdownvalue1,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),   
                      // Array list of items
                      items: Shiftitems.map((String Shiftitems) {
                return DropdownMenuItem(
                    value: Shiftitems,
                    child: Text(Shiftitems),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                  SelectShift=newValue;//
                });
              },
            ),
                  ),
            ElevatedButton( 
                 onPressed: () {
                  
                  int today=DateTime.now().weekday;
                  if(today==6){
                    debugPrint('Cannot submit on $Dayitems[today+1] ');
                  }
                  else{
                    debugPrint(today.toString());
                    checkuser();
                    getTable(SelectShift,Dayitems.indexOf(SelectDay)-1);
                    if(count<3&&SelectShift!='Select Shift'){
                      entershift(SelectShift,Dayitems.indexOf(SelectDay)-1,count);}
                    else{
                      debugPrint('Shift is full');
                    }
                  }},
                  child: Text('SUBMIT'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ), ]

          )
        )
        );
    
  }

}

                  //debugPrint('levatedButton Clicked');