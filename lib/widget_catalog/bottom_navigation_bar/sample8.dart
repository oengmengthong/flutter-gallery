import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';

//circle_bottom_navigation: ^1.0.6
class SampleBottomNavigationBar8 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar8State createState() => _SampleBottomNavigationBar8State();
}

class _SampleBottomNavigationBar8State extends State<SampleBottomNavigationBar8> {
  int currentPage = 0;
  final List<Widget> _pages = [
    Home(),
    History(),
    Search(),
    Alarm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Circle Bottom Navigation Example',
          ),
        ),
      ),
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 70,
        circleSize: 65,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        hasElevationShadows: false,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 35,
            title: 'Home',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.history,
            iconSize: 35,
            title: 'History',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.search,
            iconSize: 35,
            title: 'Search',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.alarm,
            iconSize: 35,
            title: 'Alarm',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'History',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Alarm ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
