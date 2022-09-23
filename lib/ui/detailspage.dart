import 'package:flutter/material.dart';
import 'package:miniproject/widgets/basicwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsD extends StatefulWidget {
  @override
  State<DetailsD> createState() => _DetailsDState();
}

class _DetailsDState extends State<DetailsD> {
  void getshift()async{
  final result=await FirebaseFirestore.instance.collection("current_tt").doc('123').get();
  print(result);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DETAILS'),
        ),
        body: Center( 
          child: BasicWidget(),
        ),
      );
  }
}