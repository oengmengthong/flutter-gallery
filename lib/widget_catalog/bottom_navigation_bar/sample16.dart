import 'package:flutter/material.dart';
import 'package:lamp_bottom_navigation/lamp_bottom_navigation.dart';

//lamp_bottom_navigation: ^0.1.1
class SampleBottomNavigationBar16 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar16State createState() => _SampleBottomNavigationBar16State();
}

class _SampleBottomNavigationBar16State extends State<SampleBottomNavigationBar16> {
  PageController _pageController;
  int _page = 0;

  void _navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: Text('Sample 16'),),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          Center(
            child: Text(
              "Page 1",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "Page 2",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "Page 3",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "Page 4",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "Page 5",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ],
      ),
      bottomNavigationBar: LampBottomNavigationBar(
        items: <IconData>[
          Icons.access_alarm,
          Icons.favorite_border,
          Icons.search,
          Icons.help_outline,
          Icons.more_horiz,
        ],
        width: double.infinity,
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}