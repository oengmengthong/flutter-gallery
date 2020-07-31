import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class HomeTrackPackageTemplate extends StatefulWidget {
  @override
  _HomeTrackPackageTemplateState createState() => _HomeTrackPackageTemplateState();
}

class _HomeTrackPackageTemplateState extends State<HomeTrackPackageTemplate> {
  SizedBox _sizedBox = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          ViewScourceCodeScreen(source: 'lib/template/homeTrackPackage.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.blueAccent),
                  Text('Code', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/12504809-Miber-Delivery-Tracking-App/attachments/4112685?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.blueAccent),
                  Text('Source UI', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset('assets/images/box.png', width: 70)),
            Center(
              child: Text('Track your\npackage',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            _sizedBox,
            _sizedBox,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                minLines: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, right: 8, top: 5, bottom: 5),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    hintText: 'input your tracking number',
                    suffixIcon: Icon(FontAwesomeIcons.search, size: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            _sizedBox,
            _sizedBox,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text('Recent Tracking',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            _sizedBox,
            Container(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    boxTrack(sizedBox: _sizedBox, top: true),
                    boxTrack(sizedBox: _sizedBox, top: false),
                    boxTrack(sizedBox: _sizedBox, top: false),
                    boxTrack(sizedBox: _sizedBox, top: false),
                    boxTrack(sizedBox: _sizedBox, top: false),
                    boxTrack(sizedBox: _sizedBox, top: false),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: boxTrack(sizedBox: _sizedBox, top: false),
                    ),
                  ],
                )),
            _sizedBox,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text('History Tracking',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            _sizedBox,
            Column(
              children: <Widget>[
                boxRowTrack(sizedBox: _sizedBox, top: false),
                boxRowTrack(sizedBox: _sizedBox, top: false),
                boxRowTrack(sizedBox: _sizedBox, top: false),
                boxRowTrack(sizedBox: _sizedBox, top: false),
                boxRowTrack(sizedBox: _sizedBox, top: false),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBarCustom(),
    );
  }
}

class BottomBarCustom extends StatelessWidget {
  const BottomBarCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(offset: Offset(1, 1), blurRadius: 8, color: Colors.black.withOpacity(0.1))
          ],
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('Dashboard')),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), title: Text('Inbox')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), title: Text('Notifications')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('Book')),
        ],
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// ignore: camel_case_types
class boxTrack extends StatelessWidget {
  const boxTrack({
    Key key,
    @required SizedBox sizedBox,
    @required this.top,
  })  : _sizedBox = sizedBox,
        super(key: key);

  final SizedBox _sizedBox;
  final bool top;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5 - 32,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16),
      decoration: BoxDecoration(
          color: top ? Colors.indigo : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(3, 3), blurRadius: 5, color: Colors.blueAccent.withOpacity(0.1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundColor: top ? Colors.white.withOpacity(0.2) : Colors.pink.withOpacity(0.1),
            child: top
                ? Image.asset('assets/images/box1.png', width: 35)
                : Image.asset('assets/images/box11.png', width: 35),
          ),
          _sizedBox,
          Text(
            'Package Name',
            style: TextStyle(
                fontSize: 13,
                color: top ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5)),
          ),
          Text(
            'PhnomPenh,Cambodia',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: top ? Colors.white : Colors.black),
          ),
          _sizedBox,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: top ? Colors.white : Colors.indigo, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text('Track',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: top ? Colors.black : Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class boxRowTrack extends StatelessWidget {
  const boxRowTrack({
    Key key,
    @required SizedBox sizedBox,
    @required this.top,
  })  : _sizedBox = sizedBox,
        super(key: key);

  final SizedBox _sizedBox;
  final bool top;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
          color: top ? Colors.indigo : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(3, 3), blurRadius: 5, color: Colors.blueAccent.withOpacity(0.1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: top ? Colors.white.withOpacity(0.2) : Colors.pink.withOpacity(0.1),
            child: top
                ? Image.asset('assets/images/box1.png', width: 35)
                : Image.asset('assets/images/box11.png', width: 35),
          ),
          _sizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Package Name',
                style: TextStyle(
                    fontSize: 13,
                    color: top ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5)),
              ),
              Text(
                'PhnomPenh,Cambodia',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: top ? Colors.white : Colors.black),
              ),
            ],
          ),
          _sizedBox,
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
                color: top ? Colors.white : Colors.indigo, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text('Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: top ? Colors.black : Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
