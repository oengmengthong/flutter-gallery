import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataWidgets.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AnimatedCrossFadeWidgetScreen extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetScreenState createState() => _AnimatedCrossFadeWidgetScreenState();
}

class _AnimatedCrossFadeWidgetScreenState extends State<AnimatedCrossFadeWidgetScreen> {

  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: boxPreview(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Tap on Picture too see Animation'),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _first = !_first;
                      });
                    },
                    child: AnimatedCrossFade(
                      duration: const Duration(seconds: 3),
                      firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                      secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                      crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    ),
                  ),
                  Spacer(),
                  boxTextDisplay(child: RichText(
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
                  ),context: context,)
                ],
              ))),
    );
  }
}
