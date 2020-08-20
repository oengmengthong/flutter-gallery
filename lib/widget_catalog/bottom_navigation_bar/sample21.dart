import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';

//jumping_bottom_nav_bar: ^0.0.4
class SampleBottomNavigationBar21 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar21State createState() => _SampleBottomNavigationBar21State();
}

class _SampleBottomNavigationBar21State extends State<SampleBottomNavigationBar21> {
  int selectedIndex = 2;

  final iconList = [
    TabItemIcon(
        iconData: Icons.home,
        startColor: Colors.red,
//        endColor: Colors.green,
        curveColor: Colors.yellow),
    TabItemIcon(iconData: Icons.healing, curveColor: Colors.orange),
    TabItemIcon(iconData: Icons.location_on, curveColor: Colors.lightGreen),
    TabItemIcon(iconData: Icons.notifications, curveColor: Colors.red),
    TabItemIcon(iconData: Icons.supervised_user_circle, curveColor: Colors.blueAccent),
  ];
  void onChangeTab(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: iconList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sample 21"),
        ),
        body: TabBarView(
          children: [
            new Container(
              color: Colors.yellow,
            ),
            new Container(
              color: Colors.orange,
            ),
            new Container(
              color: Colors.lightGreen,
            ),
            new Container(
              color: Colors.red,
            ),
            new Container(
              color: Colors.blueAccent,
            ),
          ],
        ),
        bottomNavigationBar: JumpingTabBar(
          onChangeTab: onChangeTab,
          circleGradient: LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.deepPurple,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          items: iconList,
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
