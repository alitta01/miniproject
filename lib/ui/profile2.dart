

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('nurseinfo').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            
            return ListView(
              
              children: snapshot.data!.docs.map((document) {
                var url = document['url'];

             return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5,),
                          child: Text(document['title'],
                             // style: GoogleFonts.quicksand(
                               //   fontStyle: FontStyle.normal)),
                        )),
                         ],
                    ),
                  ),
                );
              }).toList(),
            );
            
          }),
    );
  }
}