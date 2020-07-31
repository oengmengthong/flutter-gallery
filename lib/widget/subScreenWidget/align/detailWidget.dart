import 'package:flutter/material.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AlignWidgetScreen extends StatefulWidget {
  @override
  _AlignWidgetScreenState createState() => _AlignWidgetScreenState();
}

class _AlignWidgetScreenState extends State<AlignWidgetScreen> {
  String currentValue = 'Center';
  Alignment currentAlign = Alignment.center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: boxPreview(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Change with XY: '),
                  Text('X : -0.5 & Y : -0.5\nalignment: Alignment(-0.5,-0.5)')
                ],
              ),
              Center(
                child: Container(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  width: 120,
                  height: 120,
                  child: Align(alignment: Alignment(-0.5, -0.5), child: FlutterLogo(size: 40)),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Change with FractionalOffset : '),
                  Text('X : 0.1 & Y : 1\nalignment: FractionalOffset(0.1, 1)')
                ],
              ),
              Center(
                child: Container(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  width: 120,
                  height: 120,
                  child: Align(alignment: FractionalOffset(0.1, 1), child: FlutterLogo(size: 40)),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Change Alignment : '),
                  DropdownButton(
                      value: currentValue,
                      items: <String>[
                        'Center',
                        'CenterRight',
                        'CenterLeft',
                        'TopCenter',
                        'TopLeft',
                        'TopRight',
                        'BottomCenter',
                        'BottomLeft',
                        'BottomRight'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String newValue) {
                        switch (newValue) {
                          case 'Center':
                            currentAlign = Alignment.center;
                            break;
                          case 'BottomCenter':
                            currentAlign = Alignment.bottomCenter;
                            break;
                          case 'BottomLeft':
                            currentAlign = Alignment.bottomLeft;
                            break;
                          case 'BottomRight':
                            currentAlign = Alignment.bottomRight;
                            break;
                          case 'CenterLeft':
                            currentAlign = Alignment.centerLeft;
                            break;
                          case 'CenterRight':
                            currentAlign = Alignment.centerRight;
                            break;
                          case 'TopCenter':
                            currentAlign = Alignment.topCenter;
                            break;
                          case 'TopLeft':
                            currentAlign = Alignment.topLeft;
                            break;
                          case 'TopRight':
                            currentAlign = Alignment.topRight;
                            break;
                        }

                        setState(() {
                          currentValue = newValue;
                        });
                      }),
                ],
              ),
              Center(
                child: Container(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  width: 120,
                  height: 120,
                  child: Align(
                      alignment: currentAlign, child: FlutterLogo(size: 40)),
                ),
              ),
            ],
          ),
          Spacer(),
          boxTextDisplay(
            context: context,
            child: RichText(
              text: TextSpan(
                text: 'A widget that aligns its child within itself and optionally sizes itself '
                    'based on the child\'s size.\n\n',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  boldText('Properties\'s Align:\n\n'),
                  boldText('\t - alignment → AlignmentGeometry :'),
                  normalText(' How to align the child.\n\n'),
                  boldText('\t - heightFactor → double :'),
                  normalText(' If non-null, sets its height to the child\'s height '
                      'multiplied by this factor.\n\n'),
                  boldText('\t - widthFactor → double :'),
                  normalText(' If non-null, sets its width to the child\'s width multiplied '
                      'by this factor.\n\n'),
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}
