import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                  Icon(Icons.code, color: Colors.blueAccent),
                  Text('Code', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13920074-Hotel-Booking-App/attachments/5529769?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.blueAccent),
                  Text('Source UI', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
        ],
      ),
      body: Column(
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
            child: Text(
              widget.hotel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
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
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Text('(135 Reviews)', style: TextStyle(color: Colors.grey),)
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
          )
        ],
      ),
    );
  }
}
