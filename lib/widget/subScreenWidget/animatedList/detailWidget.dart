import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/values/style.dart';

class Item {
  String name;
  Item({this.name});
}

// ignore: must_be_immutable
class AnimatedListWidgetScreen extends StatefulWidget {
  @override
  _AnimatedListWidgetScreenState createState() => _AnimatedListWidgetScreenState();
}

class _AnimatedListWidgetScreenState extends State<AnimatedListWidgetScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  List<Item> items = new List();
  var _range = Random();

  _addItem() {
    setState(() {
      _listKey.currentState.insertItem(items.length, duration: Duration(seconds: 1));
      int id = _range.nextInt(5000);
      items.add(Item(name: 'Add Item $id'));
    });
  }

  _removeItem() {
    setState(() {
      int id = _range.nextInt(items.length);
      _listKey.currentState.removeItem(
          id, (context, animation) => _buildItem(context, 0, animation),
          duration: Duration(seconds: 1));
      items.removeAt(id);
    });
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
      sizeFactor: animation,
      child: ListTile(
        title: Text('${items[index].name}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: boxPreview(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AnimatedList(
                key: _listKey,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(context, index, animation);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  onPressed: items.length <= 1 ? null : _removeItem,
                  child: Icon(Icons.remove_circle_outline)),
              FlatButton(onPressed: _addItem, child: Icon(Icons.add_circle_outline)),
            ],
          ),
          boxTextDisplay(
            child: RichText(
              text: TextSpan(
                text: 'AnimatedBuilder is useful for more complex widgets that wish to include an '
                    'animation as part of a larger build function.\n\n',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  boldText('Properties\'s AnimatedBuilder:\n\n'),
                  boldText('\t - builder → TransitionBuilder :'),
                  normalText(' Called every time the animation changes value.\n\n'),
                  boldText('\t - child → Widget :'),
                  normalText(' The child widget to pass to the builder.\n\n')
                ],
              ),
            ),
            context: context,
          )
        ],
      ))),
    );
  }
}
