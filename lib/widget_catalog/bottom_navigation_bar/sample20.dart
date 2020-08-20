import 'package:bottom_navigation_dot/bottom_navigation_dot.dart';
import 'package:flutter/material.dart';

//bottom_navigation_dot: ^0.0.1
class SampleBottomNavigationBar20 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar20State createState() => _SampleBottomNavigationBar20State();
}

class _SampleBottomNavigationBar20State extends State<SampleBottomNavigationBar20> {

  String currentPage;
  final Map<String , Widget> pageView =<String,Widget> {
    "green":GreenPage(),
    "red":RedPage(),
    "orange":OrangePage(),

  };
  changePage(String pagename){
    setState(() {
      currentPage = pagename;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample 20'),),
      body: this.pageView[currentPage],
      bottomNavigationBar: new BottomNavigationDot(
        paddingBottomCircle: 21,
        color: Colors.grey,
        backgroundColor: Colors.white,
        activeColor: Colors.amber,
        items: [
          new BottomNavigationDotItem(icon: Icons.edit,onTap: (){changePage("green");}),
          new BottomNavigationDotItem(icon: Icons.cached,onTap: (){changePage("red");}),
          new BottomNavigationDotItem(icon: Icons.cake,onTap: (){changePage("orange");}),
        ],
        milliseconds: 400,
      ),



    );
  }
}

class GreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class OrangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

class RedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}