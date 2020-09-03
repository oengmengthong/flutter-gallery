import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/Color/gradient_widget.dart';
import 'package:gallerywidget/Color/single_color.dart';
import 'package:gallerywidget/models/dataList.dart';

import 'gradient_color.dart';

class BaseViewListColors extends StatefulWidget {
  BaseViewListColors({Key key, this.lists}) : super(key: key);
  Lists lists;
  @override
  _BaseViewListColorsState createState() => _BaseViewListColorsState();
}

class _BaseViewListColorsState extends State<BaseViewListColors> {
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
      body: Column(
        children: [
          _boxColorList('singlecolor', 'Single Colors', SingleColors()),
          _boxColorList('gradientcolor', 'Gradient Colors', GradientColorsPicker()),
          _boxColorList('gradientwidget', 'Gradient Widgets', GradientWidgetScreen()),
        ],
      ),
    );
  }

  Widget _boxColorList(String image, String title, Widget ui) {
    return GestureDetector(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => ui)),
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.1),
                  offset: Offset(1, 1),
                  blurRadius: 8),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/' + image + '.png', height: 70, width: 70,),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Icon( Icons.arrow_forward_ios ,  color: Colors.grey.withOpacity(0.5),)
          ],),
      ),
    );
  }
}
