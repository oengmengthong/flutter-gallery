import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataList.dart';

class BaseViewOtherScreen extends StatefulWidget {
  BaseViewOtherScreen({Key key, this.lists}) : super(key: key);
  Lists lists;
  @override
  _BaseViewOtherScreenState createState() => _BaseViewOtherScreenState();
}

class _BaseViewOtherScreenState extends State<BaseViewOtherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lists.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset("assets/images/" + widget.lists.image + ".png", width: 30,),
          )
        ],
      ),
    );
  }
}
