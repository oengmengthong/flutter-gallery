import 'package:flutter/material.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation.dart';
import 'package:neos_bottom_navigation/neos_bottom_navigation_item.dart';

//neos_bottom_navigation: ^0.1.3
class SampleBottomNavigationBar6 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar6State createState() => _SampleBottomNavigationBar6State();
}

class _SampleBottomNavigationBar6State extends State<SampleBottomNavigationBar6> {
  PageController _pageController = PageController();

  //int _setIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample 6'),),
      body: Stack(
        children: <Widget>[
          _buildBody(),
          _buildNavBar(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 700,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.green],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Container(
                width: 100,
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.ac_unit,
                  size: 50.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: NeosBottomNavigation(
        //setIndex: _setIndex,
        items: [
          NeosBottomNavigationItem(
            icon: Icon(Icons.alarm),
            title: "Map",
          ),
          NeosBottomNavigationItem(
            icon: Icon(Icons.backup),
            title: "Direc",
          ),
          NeosBottomNavigationItem(
            icon: Icon(Icons.calendar_today),
            title: "Settings",
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 600));
        },
      ),
    );
  }

/*
  void _changeIndexPlus() {
    setState(() {
      _setIndex++;
    });
  }

  void _changeIndexMinus() {
    setState(() {
      _setIndex--;
    });
  }
  */
}