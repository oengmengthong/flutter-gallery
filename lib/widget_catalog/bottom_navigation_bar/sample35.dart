import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'package:fancy_bottom_bar/fancy_bottom_item.dart';
import 'package:flutter/material.dart';

//fancy_bottom_bar: ^0.0.1
class SampleBottomNavigationBar35 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar35State createState() => _SampleBottomNavigationBar35State();
}

class _SampleBottomNavigationBar35State extends State<SampleBottomNavigationBar35> {
  int selectedPos = 0;

  final tabItems = [
    FancyBottomItem(title: Text("Home"), icon: Icon(Icons.home)),
    FancyBottomItem(title: Text("Connect"), icon: Icon(Icons.usb)),
    FancyBottomItem(title: Text("Profile"), icon: Icon(Icons.person)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample 35'),),
      bottomNavigationBar: FancyBottomBar(
        onItemSelected: (i) => setState(() => selectedPos = i),
        items: tabItems,
        selectedPosition: selectedPos,
        selectedColor: Colors.amber,
        indicatorColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.orange.shade100,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Check out what's happening below!"),
            SizedBox(height: 32),
            tabItems[selectedPos].icon
          ],
        ),
      ),
    );
  }
}