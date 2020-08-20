import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

//scroll_bottom_navigation_bar: ^3.0.0
class SampleBottomNavigationBar4 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar4State createState() => _SampleBottomNavigationBar4State();
}

class _SampleBottomNavigationBar4State extends State<SampleBottomNavigationBar4> {

  final controller = ScrollController();

  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("Settings"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: controller.bottomNavigationBar.tabNotifier,
          builder: (context, value, child) => items[value].title,
        ),
      ),
      body: Snap(
        controller: controller.bottomNavigationBar,
        child: ValueListenableBuilder<int>(
          valueListenable: controller.bottomNavigationBar.tabNotifier,
          builder: (context, value, child) => ListView.builder(
            controller: controller,
            itemBuilder: _listBuildItem,
          ),
        ),
      ),
      bottomNavigationBar: ScrollBottomNavigationBar(
        controller: controller,
        items: items,
      ),
    );
  }

  Widget _listBuildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Color(Random().nextInt(0xffffffff)),
      child: Center(child: Text("$index")),
    );
  }
}
