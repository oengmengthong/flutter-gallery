import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FurnitureAppScreen extends StatefulWidget {
  @override
  _FurnitureAppScreenState createState() => _FurnitureAppScreenState();
}

class _FurnitureAppScreenState extends State<FurnitureAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[

          ],),
        ),
      ),
    );
  }
}
