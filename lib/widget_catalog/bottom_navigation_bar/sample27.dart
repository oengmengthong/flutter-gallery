import 'package:bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

//bottom_nav: ^0.1.1
class SampleBottomNavigationBar27 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar27State createState() => _SampleBottomNavigationBar27State();
}

class _SampleBottomNavigationBar27State extends State<SampleBottomNavigationBar27> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample 27"),
      ),
      body: Container(),
      bottomNavigationBar: BottomNav(
        index: currentTab,
        backgroundColor: Colors.white,
        showElevation: true,
        navBarHeight: 75.0,
        radius: 30.0,
        onTap: (i) {
          setState(() {
            currentTab = i;
          });
        },
        items: [
          BottomNavItem(
              icon: Icons.home, label: "Home", selectedColor: Colors.amber),
          BottomNavItem(
              icon: Icons.favorite,
              label: "Likes",
              selectedColor: Colors.pink),
          BottomNavItem(
              icon: Icons.search,
              label: "Search",
              selectedColor: Colors.blue),
          BottomNavItem(
              icon: Icons.person,
              label: "Profile",
              selectedColor: Colors.black),
        ],
      ),
    );
  }
}