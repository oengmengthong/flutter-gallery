import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/hotelbooking.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class DetailHotelBookingScreen extends StatefulWidget {
  DetailHotelBookingScreen({Key key, this.hotel});
  Hotel hotel;
  @override
  _DetailHotelBookingScreenState createState() => _DetailHotelBookingScreenState();
}

class _DetailHotelBookingScreenState extends State<DetailHotelBookingScreen> {
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
                          ViewScourceCodeScreen(source: 'lib/template/detailhotelbooking.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.white),
                  Text('Code', style: TextStyle(color: Colors.white))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13920074-Hotel-Booking-App/attachments/5529769?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.white),
                  Text('Source UI', style: TextStyle(color: Colors.white))
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(fit: BoxFit.cover, image: NetworkImage(widget.hotel.imageUrl))),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 40,
                      width: 40,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      height: 40,
                      width: 40,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: Icon(Icons.favorite_border),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.hotel.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RatingBar(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Text('(135 Reviews)', style: TextStyle(color: Colors.grey))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.grey),
                  Expanded(
                    child: Text(
                      widget.hotel.location,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                widget.hotel.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Amenities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            Container(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: amenites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index < 1
                        ? EdgeInsets.all(16.0)
                        : EdgeInsets.only(top: 16, bottom: 16, right: 16),
                    child: _boxIcon(image: amenites[index].image, name: amenites[index].name),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(widget.hotel.price,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('/ night'),
                  Spacer(),
                  FlatButton(
                    onPressed: (){},
                    color: Color(0xff1F618D),
                    padding: EdgeInsets.only(left: 32,right: 32),
                    child: Text('Select Rooms', style: TextStyle(color: Colors.white, fontSize: 16),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _boxIcon({@required String image, @required String name}) {
    return Container(
      width: 60,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff1F618D).withOpacity(0.1),
            ),
            child: Image.asset(image),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, color: Color(0xff1F618D)),
          )
        ],
      ),
    );
  }
}

class Amenite {
  String image;
  String name;
  Amenite({this.image, this.name});
}

List<Amenite> amenites = [
  Amenite(image: "assets/images/pool.png", name: "Pool"),
  Amenite(image: "assets/images/shuttle.png", name: "Shuttle"),
  Amenite(image: "assets/images/spa.png", name: "Spa"),
  Amenite(image: "assets/images/fitness.png", name: "Fitness"),
  Amenite(image: "assets/images/tea.png", name: "Tea"),
  Amenite(image: "assets/images/bar.png", name: "Bar"),
  Amenite(image: "assets/images/breakfast.png", name: "Food"),
];
