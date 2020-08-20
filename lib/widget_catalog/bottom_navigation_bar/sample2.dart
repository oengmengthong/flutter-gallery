import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

//floating_bottom_navigation_bar: ^1.4.1
class SampleBottomNavigationBar2 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar2State createState() => _SampleBottomNavigationBar2State();
}

class _SampleBottomNavigationBar2State extends State<SampleBottomNavigationBar2> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample 2'),
      ),
      body: Center(
        child: Text(
          "index: $_index",
          style: TextStyle(
            fontSize: 52,
          ),
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
        ],
      ),
    );
  }
}
