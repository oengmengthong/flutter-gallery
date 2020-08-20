import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

//motion_tab_bar: ^0.1.5
class SampleBottomNavigationBar26 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar26State createState() => _SampleBottomNavigationBar26State();
}

class _SampleBottomNavigationBar26State extends State<SampleBottomNavigationBar26> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample 26'),
        ),
        bottomNavigationBar: MotionTabBar(
          labels: [
            "Account","Home","Dashboard"
          ],
          initialSelectedTab: "Home",
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value){
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [
            Icons.account_box,Icons.home,Icons.menu
          ],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Center(
                child: Text("Account"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Home"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Dashboard"),
              ),
            ),
          ],
        ));
  }
}