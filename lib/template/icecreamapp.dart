import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class IceCreamUIApp extends StatefulWidget {
  @override
  _IceCreamUIAppState createState() => _IceCreamUIAppState();
}

class _IceCreamUIAppState extends State<IceCreamUIApp> {
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
                          ViewScourceCodeScreen(source: 'lib/template/icecreamapp.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.white),
                  Text('Code', style: TextStyle(color: Colors.white))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/7523165-Ice-cream-App/attachments/333548?mode=media'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          EvaIcons.menu2,
                          color: Colors.pink,
                        ),
                        onPressed: () {}),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.pink)),
                      child: Icon(
                        EvaIcons.search,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 16, right: 8),
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pinkAccent.withOpacity(0.2)),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'CART',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: Colors.pink),
                            child: Center(
                                child: Text(
                              '2',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Most Popular Cones',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: icecreams.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 100.0, left: 50),
                        child: _boxStack1(
                            icecreams[index].image, icecreams[index].name, icecreams[index].price),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Top Flavours',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                height: 160,
                child: ListView.builder(
                    itemCount: flavours.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: _boxStack2(
                            flavours[index].image, flavours[index].name, flavours[index].price),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxStack1(String image, String name, String price) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          height: 280,
          width: 200,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xff97DBFA)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 20)),
              SizedBox(height: 16),
              Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Positioned(
            top: -100,
            left: -10,
            child: RotationTransition(
                turns: new AlwaysStoppedAnimation(35 / 360),
                child: Image.asset(image, height: 300)))
      ],
    );
  }

  Widget _boxStack2(String image, String name, String price) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          height: 110,
          width: 130,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xff97DBFA)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(name, style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text(price, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Positioned(
            top: -30,
            right: -30,
            child: RotationTransition(
                turns: new AlwaysStoppedAnimation(35 / 360),
                child: Image.asset(image, height: 70))),
        Positioned(
            bottom: -10,
            right: -10,
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.pinkAccent.withOpacity(0.9),
                size: 45,
              ),
              onPressed: () {},
            ))
      ],
    );
  }
}

class IceCream {
  String image;
  String name;
  String price;
  IceCream({this.image, this.name, this.price});
}

List<IceCream> icecreams = [
  IceCream(image: 'assets/images/ice-cream.png', name: 'Strawberry', price: '\$ 15.99'),
  IceCream(image: 'assets/images/ice-cream-30.png', name: 'Chocolate', price: '\$ 17.99'),
  IceCream(image: 'assets/images/ice-cream-81.png', name: 'Strawberry', price: '\$ 15.99'),
  IceCream(image: 'assets/images/ice-cream.png', name: 'Strawberry', price: '\$ 15.99'),
  IceCream(image: 'assets/images/ice-cream-81.png', name: 'Strawberry', price: '\$ 15.99'),
  IceCream(image: 'assets/images/ice-cream-30.png', name: 'Strawberry', price: '\$ 15.99'),
];

List<IceCream> flavours = [
  IceCream(image: "assets/images/ice25.png", name: "Butterscotch", price: "\$3.99"),
  IceCream(image: "assets/images/ice22.png", name: "Butterscotch", price: "\$3.99"),
  IceCream(image: "assets/images/ice23.png", name: "Butterscotch", price: "\$3.99"),
  IceCream(image: "assets/images/ice24.png", name: "Butterscotch", price: "\$3.99"),
];
