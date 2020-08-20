import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class DoctorAppointmentAppScreen extends StatefulWidget {
  @override
  _DoctorAppointmentAppScreenState createState() => _DoctorAppointmentAppScreenState();
}

class _DoctorAppointmentAppScreenState extends State<DoctorAppointmentAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          ViewScourceCodeScreen(source: 'lib/template/doctorappointmentapp.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.white),
                  Text('Code', style: TextStyle(color: Colors.white))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13911328-Hotel-App-UI/attachments/5520311?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.white),
                  Text('Source UI', style: TextStyle(color: Colors.white))
                ],
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[

          ],),
        ),
      ),
    );
  }
}
