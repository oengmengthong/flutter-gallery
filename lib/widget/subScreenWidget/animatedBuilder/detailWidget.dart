import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AnimatedBuilderWidgetScreen extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetScreenState createState() => _AnimatedBuilderWidgetScreenState();
}

class _AnimatedBuilderWidgetScreenState extends State<AnimatedBuilderWidgetScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              width: 200.0,
              height: 200.0,
              child: FlutterLogo(size: 80),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
          Spacer(),
          boxTextDisplay(
            context: context,
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
          )
        ],
      ))),
    );
  }
}
