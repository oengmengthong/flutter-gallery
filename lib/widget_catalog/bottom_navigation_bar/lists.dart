import 'package:flutter/material.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample1.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample10.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample11.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample12.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample13.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample14.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample15.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample16.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample17.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample18.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample19.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample2.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample20.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample21.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample22.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample23.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample24.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample25.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample26.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample27.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample28.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample29.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample3.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample30.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample31.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample32.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample33.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample34.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample35.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample36.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample37.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample38.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample39.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample4.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample5.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample6.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample7.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample8.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample9.dart';

class ListsBottomNavigationStyle extends StatefulWidget {
  @override
  _ListsBottomNavigationStyleState createState() =>
      _ListsBottomNavigationStyleState();
}

class _ListsBottomNavigationStyleState
    extends State<ListsBottomNavigationStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Style Bottom Navigation Bar'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar1())),
            leading: Text('1'),
            title: Text('animated_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar2())),
            leading: Text('2'),
            title: Text('floating_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar3())),
            leading: Text('3'),
            title: Text('fancy_bottom_navigation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar4())),
            leading: Text('4'),
            title: Text('scroll_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar5())),
            leading: Text('5'),
            title: Text('circular_bottom_navigation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar6())),
            leading: Text('6'),
            title: Text('neos_bottom_navigation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar7())),
            leading: Text('7'),
            title: Text('custom_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar8())),
            leading: Text('8'),
            title: Text('circle_bottom_navigation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar9())),
            leading: Text('9'),
            title: Text('bottom_navy_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar10())),
            leading: Text('10'),
            title: Text('ff_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar11())),
            leading: Text('11'),
            title: Text('expanding_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar12())),
            leading: Text('12'),
            title: Text('titled_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar13())),
            leading: Text('13'),
            title: Text('salomon_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar14())),
            leading: Text('14'),
            title: Text('cuberto_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar15())),
            leading: Text('15'),
            title: Text('spincircle_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar16())),
            leading: Text('16'),
            title: Text('lamp_bottom_navigation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar17())),
            leading: Text('17'),
            title: Text('fluid_bottom_nav_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar18())),
            leading: Text('18'),
            title: Text('bottom_personalized_dot_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar19())),
            leading: Text('19'),
            title: Text('rondy_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar20())),
            leading: Text('20'),
            title: Text('bottom_navigation_dot'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar21())),
            leading: Text('21'),
            title: Text('jumping_bottom_nav_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar22())),
            leading: Text('22'),
            title: Text('sphere_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar23())),
            leading: Text('23'),
            title: Text('flutter_snake_navigationbar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar24())),
            leading: Text('24'),
            title: Text('google_nav_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar25())),
            leading: Text('25'),
            title: Text('bottom_animation'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar26())),
            leading: Text('26'),
            title: Text('motion_tab_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar27())),
            leading: Text('27'),
            title: Text('bottom_nav'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar28())),
            leading: Text('28'),
            title: Text('ace_bottom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar29())),
            leading: Text('29'),
            title: Text('pandabar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar30())),
            leading: Text('30'),
            title: Text('flip_box_bar_plus'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar31())),
            leading: Text('31'),
            title: Text('navigation_dot_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar32())),
            leading: Text('32'),
            title: Text('rolling_nav_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar33())),
            leading: Text('33'),
            title: Text('convex_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar34())),
            leading: Text('34'),
            title: Text('custom_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar35())),
            leading: Text('35'),
            title: Text('fancy_bottom_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar36())),
            leading: Text('36'),
            title: Text('circle_bottombar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar37())),
            leading: Text('37'),
            title: Text('ss_bottom_navbar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar38())),
            leading: Text('38'),
            title: Text('curved_navigation_bar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SampleBottomNavigationBar39())),
            leading: Text('39'),
            title: Text('fancy_bar'),
          ),
        ],
      ),
    );
  }
}
