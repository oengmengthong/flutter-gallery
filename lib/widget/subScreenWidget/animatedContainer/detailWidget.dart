import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AnimatedContainerWidgetScreen extends StatefulWidget {
  @override
  _AnimatedContainerWidgetScreenState createState() => _AnimatedContainerWidgetScreenState();
}

class _AnimatedContainerWidgetScreenState extends State<AnimatedContainerWidgetScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: boxPreview(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Tap on Container to see Animation'),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 75),
              ),
            ),
          ),
          Spacer(),
          boxTextDisplay(
            child: RichText(
              text: TextSpan(
                text: 'The AnimatedContainer will automatically animate between the old and '
                    'new values of properties when they change using the provided curve and duration.\n\n',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  boldText('Properties\'s AnimatedBuilder:\n\n'),
                  boldText('\t - alignment → AlignmentGeometry :'),
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
