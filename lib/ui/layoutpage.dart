
import 'package:flutter/material.dart';
import 'package:miniproject/widgets/navbar.dart';

class Layouts extends StatefulWidget {
  @override
  State<Layouts> createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:BottomNavBar()
    );
  }
}
