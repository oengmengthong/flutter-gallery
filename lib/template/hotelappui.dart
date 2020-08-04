import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class HotelAppUIScreen extends StatefulWidget {
  @override
  _HotelAppUIScreenState createState() => _HotelAppUIScreenState();
}

class _HotelAppUIScreenState extends State<HotelAppUIScreen> {
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
                          ViewScourceCodeScreen(source: 'lib/template/hotelappui.dart'))),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hi, Johnasen',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('Weekendm the best time for traveling',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/profile.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.blueGrey.withOpacity(0.1),
                      filled: true,
                      hintText: "Where do you want to go?",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent)),
                      suffixIcon: Icon(EvaIcons.search, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Hotel near you',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 325,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 325,
                        width: 225,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Tempo Doloe Hotel',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              'Jakarta, Indonesia',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Popular staycation',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: _lists.map((e) => e).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _lists = [
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/236x/23/c9/47/23c947d34cb015b3eb51104cfd3092aa--rendering-architecture-modern-architecture-design.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Tempo Doloe Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          Text(
            'Jakarta, Indonesia',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    ),
  ];
}
