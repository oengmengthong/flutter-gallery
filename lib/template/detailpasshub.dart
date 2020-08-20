import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/passHub.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class DetailPassHubScreen extends StatefulWidget {
  DetailPassHubScreen({Key key, this.item});
  PassHubItem item;
  @override
  _DetailPassHubScreenState createState() => _DetailPassHubScreenState();
}

class _DetailPassHubScreenState extends State<DetailPassHubScreen> {
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
                          ViewScourceCodeScreen(source: 'lib/template/detailpasshub.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.white),
                  Text('Code', style: TextStyle(color: Colors.white))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/12294649-PASSHUB-kiosk/attachments/3909787?mode=media'),
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('PassHub',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  Icon(FontAwesomeIcons.user, color: Colors.blueGrey)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.lightBlueAccent.withOpacity(0.1),
                          filled: true,
                          prefixIcon: Icon(FontAwesomeIcons.ticketAlt, color: Colors.blueGrey),
                          hintText: "123456789",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 55,
                    height: 55,
                    decoration:
                        BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Icon(Icons.arrow_forward, color: Colors.white)),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.blueGrey.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Order: 31559165318',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '3 scans, 1 left',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.refresh, color: Colors.cyan, size: 25),
                          Text(
                            'Upgrade',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.cyan),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 55,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueGrey.withOpacity(0.3))),
                    child: Center(
                        child: Text('WRONG RESULT?',
                            style: TextStyle(fontSize: 15, color: Colors.cyan))),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 50,
                        color: Colors.lightBlueAccent.withOpacity(0.15))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(widget.item.imageUrl))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.item.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11, right: 16, bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.blueGrey),
                        Text('Lincoin Center Plaza, New York, NY 10023',
                            style: TextStyle(color: Colors.blueGrey))
                      ],
                    ),
                  ),
                  Divider(color: Colors.blueGrey.withOpacity(0.5)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      children: <Widget>[
                        IconWidget(iconData: FontAwesomeIcons.calendarAlt),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Pur.Date:',
                                style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                            Text('Sep 24, 2020',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(width: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Exp.Date:',
                                style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                            Text('Sep 28, 2020',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      children: <Widget>[
                        IconWidget(iconData: FontAwesomeIcons.calendarAlt),
                        Text('Type: ', style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                        Text('Regular, 4 time visit', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconWidget(iconData: FontAwesomeIcons.calendarAlt),
                        Text('Days Left: ', style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                        Text('3', style: TextStyle(fontSize: 14)),
                        Spacer(),
                        Text(
                          'MORE DETAILS',
                          style: TextStyle(
                              fontSize: 14, color: Colors.cyan, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.cyan)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: SpinKitCircle(color: Colors.cyan)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.lightBlueAccent)),
                    padding: EdgeInsets.only(left: 35, right: 35, top: 16, bottom: 16),
                    color: Colors.lightBlueAccent,
                    child: Text('Get my Pass', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  FlatButton(
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.redAccent)),
                    padding: EdgeInsets.only(left: 35, right: 35, top: 16, bottom: 16),
                    color: Colors.redAccent,
                    child: Text('Cancel Item', style: TextStyle(fontSize: 18, color: Colors.white)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({Key key, this.iconData}) : super(key: key);

  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.cyanAccent.withOpacity(0.3)),
      child: Icon(iconData, color: Colors.cyan, size: 20),
    );
  }
}
