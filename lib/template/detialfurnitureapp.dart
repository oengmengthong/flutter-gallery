import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class DetailFurnitureAppUI extends StatefulWidget {
  @override
  _DetailFurnitureAppUIState createState() => _DetailFurnitureAppUIState();
}

class _DetailFurnitureAppUIState extends State<DetailFurnitureAppUI> {
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
                          ViewScourceCodeScreen(source: 'lib/template/detailfurnitureapp.dart'))),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://wallpapershome.com/images/pages/pic_h/3558.jpg',
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(32),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(offset: Offset(0, -50), blurRadius: 50, color: Colors.black87)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Chiar',
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '\$ 4600',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$ 5600',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontSize: 10,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 32),
                      child: Row(
                        children: <Widget>[
                          _roundColor(Colors.redAccent),
                          _roundColor(Colors.blue),
                          _roundColor(Colors.orange),
                          _roundColor(Colors.blueGrey),
                        ],
                      ),
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(height: 2),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)),
                          child: IconButton(
                            icon: Icon(
                              EvaIcons.heartOutline,
                              size: 35,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          height: 57,
                          padding: EdgeInsets.only(left: 40, right: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _roundColor(Color color) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white70, width: 2),
          color: color),
    );
  }
}
