import 'package:flutter/material.dart';
import 'package:rondy_bottom_navigation_bar/model/rondy_bar_item.dart';
import 'package:rondy_bottom_navigation_bar/rondy_bottom_navigation_bar.dart';

//rondy_bottom_navigation_bar: ^0.0.4
class SampleBottomNavigationBar19 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar19State createState() => _SampleBottomNavigationBar19State();
}

class _SampleBottomNavigationBar19State extends State<SampleBottomNavigationBar19> {
  int _counter = 0;

  void _itemSelect(int index) {
    setState(() {
      _counter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Sample 19'),
      ),
      bottomNavigationBar: RondyBottomNavigationBar(
        iconColor: Colors.grey,
        activeIconColor: Colors.black,
        textStyle: TextStyle(
          color: Colors.grey,
        ),
        onItemClick: _itemSelect,
        activeTextStyle: TextStyle(
          color: Colors.black,
        ),
        initialSelected: 1,
        items: [
          RondyBarItem(label: "Saved", icon: Icons.save_alt),
          RondyBarItem(label: "Recipes", icon: Icons.restaurant),
          RondyBarItem(label: "Products", icon: Icons.restaurant_menu),
          RondyBarItem(label: "Menu", icon: Icons.menu),
        ],
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _itemSelect(_counter++),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}