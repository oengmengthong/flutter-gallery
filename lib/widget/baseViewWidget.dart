import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataList.dart';

import 'listWidget.dart';

class BaseViewWidgetScreen extends StatefulWidget {
  BaseViewWidgetScreen({Key key, this.lists}) : super(key: key);
  Lists lists;
  @override
  _BaseViewWidgetScreenState createState() => _BaseViewWidgetScreenState();
}

class _BaseViewWidgetScreenState extends State<BaseViewWidgetScreen> {
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
      body: ListWidgetsScreen(),
    );
  }
}
