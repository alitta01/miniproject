import 'package:flutter/material.dart';
import 'package:miniproject/ui/swapage.dart'; 

class BasicWidget extends StatefulWidget{
  @override
  State<BasicWidget> createState() => _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  
  @override
  Widget build(BuildContext context){
    return  Container(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          color: Colors.greenAccent,
          child:Column(children:[
          Container(
            width:400,
            height:100,
            color:Colors.greenAccent,
             child:Center(
              child:Text("DETAILS OF THE DAY:"),
              )),
           Card(
            //width:400,
            //height:300,
            color:Colors.white,
             child:Center(
              child:Text("Date:\n\nDay:\n\nList of Collegues:"),
              
             )),
              ElevatedButton( 
                 onPressed: () {
                  //debugPrint('levatedButton Clicked');
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Swapf()));
                  },
                  child: Text('SWAP'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),
             
          ]),
          );
        
          }
}