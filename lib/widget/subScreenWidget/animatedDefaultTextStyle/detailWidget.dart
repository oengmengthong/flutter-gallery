import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AnimatedDefaultTextStyleWidgetScreen extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetScreenState createState() =>
      _AnimatedDefaultTextStyleWidgetScreenState();
}

class _AnimatedDefaultTextStyleWidgetScreenState
    extends State<AnimatedDefaultTextStyleWidgetScreen> {
  TextStyle _textStyle = TextStyle(fontSize: 100, color: Colors.red, fontWeight: FontWeight.bold);

  TextStyle _textStyleP = TextStyle(
    fontSize: 80,
    color: Colors.blueAccent,
  );

  bool _selected = true;

  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _selected = !_selected;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: boxPreview(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });
            },
            child: AnimatedDefaultTextStyle(
                curve: Curves.elasticInOut,
                child: Text('Hello World!'),
                style: _selected ? _textStyleP : _textStyle,
                duration: Duration(seconds: 5)),
          ),
          Spacer(),
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
