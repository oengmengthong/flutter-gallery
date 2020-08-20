import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

//titled_navigation_bar: ^4.1.0
class SampleBottomNavigationBar12 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar12State createState() => _SampleBottomNavigationBar12State();
}

class _SampleBottomNavigationBar12State extends State<SampleBottomNavigationBar12> {
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
    TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
    TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  ];

  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titled Bottom Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Reversed mode:"),
            Switch(
              value: navBarMode,
              onChanged: (v) {
                setState(() => navBarMode = v);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) => print("Selected Index: $index"),
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        activeColor: Colors.red,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}