import 'package:bottom_animation/source/bottomnav_item.dart';
import 'package:bottom_animation/source/navigation_bar.dart';
import 'package:flutter/material.dart';

//bottom_animation: ^1.1.0
class SampleBottomNavigationBar25 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar25State createState() => _SampleBottomNavigationBar25State();
}

class _SampleBottomNavigationBar25State extends State<SampleBottomNavigationBar25> {
  var items = <BottomNavItem>[
    BottomNavItem(title: 'Home', iconData: Icons.home),
    BottomNavItem(title: 'Profile', iconData: Icons.account_circle),
    BottomNavItem(title: 'Search', iconData: Icons.search),
  ];

  var cIndex;
  @override
  void initState() {
    cIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Sample 25'),),
      bottomNavigationBar: BottomAnimation(
        selectedIndex: cIndex,
        items: items,
        backgroundColor: Colors.cyan,
        onItemSelect: (value) {
          setState(() {
            cIndex = value;
          });
        },
        itemHoverColor: Colors.white,
        itemHoverColorOpacity: .2,
        activeIconColor: Colors.black,
        deactiveIconColor: Colors.black38,
        barRadius: 20,
        textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        itemHoverWidth: 135,
        itemHoverBorderRadius: 20,
      ),
    );
  }
}