import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class FurnitureAppScreen extends StatefulWidget {
  @override
  _FurnitureAppScreenState createState() => _FurnitureAppScreenState();
}

class _FurnitureAppScreenState extends State<FurnitureAppScreen> {
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
                          ViewScourceCodeScreen(source: 'lib/template/furnitureapp.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.blueAccent),
                  Text('Code', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13919175-Furniture-app/attachments/5528865?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.blueAccent),
                  Text('Source UI', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.sort, color: Colors.teal), onPressed: () {}),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.teal),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.teal),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Hi Nevil',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.slidersH, color: Colors.teal),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.mocka.com.au/media/catalog/category/resized/321_214.5_Living.jpg'))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Upto 50% off',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text('Living Room'),
                    Spacer(),
                    FlatButton(
                      color: Colors.teal,
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
