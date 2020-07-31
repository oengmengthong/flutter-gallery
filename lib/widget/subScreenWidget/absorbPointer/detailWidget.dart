import 'package:flutter/material.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AbsordPointerWidgetScreen extends StatelessWidget {
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
          Text('FlatButton without AbsordPointer Widget'),
          FlatButton(onPressed: () {}, child: Text("Button"), color: Colors.lightBlue),
          SizedBox(height: 16),
          Text('FlatButton with AbsordPointer Widget'),
          AbsorbPointer(
              absorbing: true,
              ignoringSemantics: true,
              child: FlatButton(onPressed: () {}, child: Text("Button"), color: Colors.lightBlue)),
          Spacer(),
          boxTextDisplay(
              child: RichText(
                text: TextSpan(
                  text: 'A widget that absorbs pointers during hit testing.\n\n',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    boldText('Properties\'s AbsordPoint:\n\n'),
                    boldText('\t - absorbing → bool :'),
                    normalText(' Whether this widget absorbs pointers during hit testing.\n\n'),
                    boldText('\t - ignoringSemantics → bool :'),
                    normalText(' Whether the semantics of this render object is ignored '
                        'when compiling the semantics tree.\n\n')
                  ],
                ),
              ),
              context: context)
        ],
      ))),
    );
  }
}
