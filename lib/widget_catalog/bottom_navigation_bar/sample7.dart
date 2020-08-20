import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

//custom_bottom_navigation_bar: ^0.0.1
class SampleBottomNavigationBar7 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar7State createState() => _SampleBottomNavigationBar7State();
}

class _SampleBottomNavigationBar7State extends State<SampleBottomNavigationBar7> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample 7'),),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(
            child: Icon(
              Icons.map,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.near_me,
              color: Color(0XFF003051),
            ),
          ),
          Center(
            child: Icon(
              Icons.shopping_cart,
              color: Color(0XFF003051),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.map,
            title: "Map",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.near_me,
            title: "Directions",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.settings,
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
}