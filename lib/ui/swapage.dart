
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/functions/generatett.dart';

class Swapf extends StatefulWidget {
  @override
  _Swapf createState() {
    return _Swapf();
  }
}

class _Swapf extends State<Swapf> {
  /*DateTime d=DateTime.now();
  int week=(DateTime.now().weekday);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(week.toString()),
    
    );*/
DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}
DateTime findLastDateOfTheWeek(DateTime dateTime) {
  if(dateTime.weekday!=7){
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));}
  else{
    DateTime s1=dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
        return s1.add(Duration(days:7));
  }
}
int findDay(DateTime dateTime) {
    return dateTime.day;
}
int findMonth(DateTime dateTime) {
    return dateTime.month;
}
int findYear(DateTime dateTime) {
    return dateTime.year;
}

DateTime today=DateTime.now();
late DateTime first;
//late DateTime DatePicker;
late DateTime last;
late String SelectShift;

TextEditingController dateInput = TextEditingController();
 
String dropdownvalue = 'Select Shift';  
 
  // List of items in our dropdown menu
  var Shiftitems = [   
    'Select Shift',
    'Day',
    'Afternoon',
    'Night',
  ];
  String dropdownvalue2 = 'Select Day';
  var Dayitems = [   
    'Select Day',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String SelectDay='';
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    DateTime today=DateTime.now();
    first=findFirstDateOfTheWeek(today);
    last=findLastDateOfTheWeek(today);
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Swap Shifts"),
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
                      value: dropdownvalue,
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
                  dropdownvalue = newValue!;
                  SelectShift=newValue;//
                });
              },
            ),
                  ),
            ElevatedButton( 
                 onPressed: () {
                  debugPrint('levatedButton Clicked');
                  DateTime today=DateTime.now();
                  Execution().generateshift();
                  /*if(week==6){
                    debugPrint('Cannot submit');
                  }
                  else{
                    debugPrint('Submitted');
                  }*/
                  },
                  child: Text('SWAP'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),      ]

          )
        )
        );
  }
}
