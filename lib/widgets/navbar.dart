import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:miniproject/ui/addschedulepage.dart';
import 'package:miniproject/ui/detailspage.dart';
import 'package:miniproject/ui/homepage.dart';
import 'package:miniproject/ui/profilepage.dart';
import 'package:miniproject/ui/NotificationsP.dart';
import 'package:miniproject/ui/swapage.dart';
import 'package:miniproject/ui/profile2.dart';
//import 'package:miniproject/swapage.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final pageopt=[
    Swapf(),
    NotificationsP(),
    HomeWidget(),
    NewSchedule(),
    ProfilePage()
    //Profile2(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.notifications_none_outlined, size: 30),
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.greenAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body:pageopt[_page],
        /*Container(
           //color: Colors.blueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        )*/);
  }
}