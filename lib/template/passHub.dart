import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

import 'detailpasshub.dart';

class PassHubItem {
  String name;
  String imageUrl;
  String status;
  PassHubItem({this.name, this.imageUrl, this.status});
}

class PassHubTemplate extends StatefulWidget {
  @override
  _PassHubTemplateState createState() => _PassHubTemplateState();
}

class _PassHubTemplateState extends State<PassHubTemplate> {
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
                          ViewScourceCodeScreen(source: 'lib/template/passHub.dart'))),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'PassHub',
                  style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                Icon(FontAwesomeIcons.user, color: Colors.blueGrey)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              minLines: 1,
              decoration: InputDecoration(
                  fillColor: Colors.lightBlueAccent.withOpacity(0.1),
                  filled: true,
                  prefixIcon: Icon(EvaIcons.searchOutline, color: Colors.blueGrey),
                  hintText: "Name",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    minLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.lightBlueAccent.withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(EvaIcons.castOutline, color: Colors.blueGrey),
                        suffixIcon: Icon(EvaIcons.arrowDown, color: Colors.blueGrey),
                        hintText: "Status",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    minLines: 1,
                    decoration: InputDecoration(
                        fillColor: Colors.lightBlueAccent.withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.airport_shuttle, color: Colors.blueGrey),
                        suffixIcon: Icon(EvaIcons.arrowDown, color: Colors.blueGrey),
                        hintText: "Buses",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.blueGrey.withOpacity(0.5),),
          Expanded(
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context, CupertinoPageRoute(builder: (context) => DetailPassHubScreen(item: _items[index],))),
                      child: _boxItem(
                          _items[index].name, _items[index].imageUrl, _items[index].status),
                    );
                  }))
        ],
      ),
    );
  }

  Widget _boxItem(name, imageUrl, status) {
    return status == "not"
        ? Container(
            height: 80,
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 16,
                      color: Colors.lightBlueAccent.withOpacity(0.15))
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text('Buses, Boat tours',
                          style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                    ],
                  ),
                )
              ],
            ),
          )
        : Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                padding: EdgeInsets.all(8),
                height: 80,
                width: 70,
                decoration: BoxDecoration(
                  color: status == "done"
                      ? Colors.cyanAccent.withOpacity(0.2)
                      : Colors.redAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: status == "done" ? Colors.cyan : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      status == "done" ? 'VISITED' : 'CANCELED',
                      style: TextStyle(
                          fontSize: 10, color: status == "done" ? Colors.cyan : Colors.red),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 1 - 102,
                margin: EdgeInsets.only(left: 16, top: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey.withOpacity(0.3)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      foregroundDecoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        backgroundBlendMode: BlendMode.saturation,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black.withOpacity(0.4)),
                          ),
                          Text('Buses, Boat tours',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blueGrey.withOpacity(0.4))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}

List<PassHubItem> _items = [
  PassHubItem(
      name: "Los Angeles beach",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/19774.jpg",
      status: "not"),
  PassHubItem(
      name: "Troll Wall Romsdal Norway",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/22712.jpg",
      status: "not"),
  PassHubItem(
      name: "lavender mountain",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/16530.jpg",
      status: "done"),
  PassHubItem(
      name: "Hohenzollern Castle",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/16631.jpg",
      status: "done"),
  PassHubItem(
      name: "Turquoise beach",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/19758.jpg",
      status: "not"),
  PassHubItem(
      name: "Paris Eiffel Tower",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/6483.jpg",
      status: "cancel"),
  PassHubItem(
      name: "Keelung Harbor",
      imageUrl: "https://wallpapershome.com/images/pages/pic_h/8539.jpg",
      status: "not"),
];
