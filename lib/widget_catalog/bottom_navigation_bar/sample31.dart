import 'package:flutter/material.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';

//navigation_dot_bar: ^0.1.3
class SampleBottomNavigationBar31 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar31State createState() => _SampleBottomNavigationBar31State();
}

class _SampleBottomNavigationBar31State extends State<SampleBottomNavigationBar31> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text("Sample 31")),
        body: Container(),
        bottomNavigationBar: BottomNavigationDotBar ( // Usar -> "BottomNavigationDotBar"
            items: <BottomNavigationDotBarItem>[
        BottomNavigationDotBarItem(icon: Icons.map, onTap: () { /* Cualquier funcion - [abrir nueva venta] */ }),
        BottomNavigationDotBarItem(icon: Icons.alarm_add, onTap: () { /* Cualquier funcion - [abrir nueva venta] */ }),
        BottomNavigationDotBarItem(icon: Icons.timer, onTap: () { /* Cualquier funcion - [abrir nueva venta] */ }),
        ]
    ),
    );
  }
}
