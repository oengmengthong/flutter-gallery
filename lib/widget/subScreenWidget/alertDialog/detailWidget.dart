import 'package:flutter/material.dart';
import 'package:gallerywidget/values/style.dart';

// ignore: must_be_immutable
class AlertDialogWidgetScreen extends StatefulWidget {
  @override
  _AlertDialogWidgetScreenState createState() => _AlertDialogWidgetScreenState();
}

class _AlertDialogWidgetScreenState extends State<AlertDialogWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Disapprove',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: boxPreview(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(),
            Text('Click to popup AlertDialog Widget'),
            FlatButton(
              onPressed: () => _showMyDialog(),
              child: Text("Show AlertDialog"),
              color: Colors.lightBlue,
            ),
            Spacer(),
            boxTextDisplay(
                child: RichText(
                  text: TextSpan(
                    text:
                        'An alert dialog informs the user about situations that require acknowledgement. '
                        'An alert dialog has an optional title and an optional list of actions. '
                        'The title is displayed above the content and the actions are displayed '
                        'below the content.\n\n',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      boldText('Properties\'s AlertDialog:\n\n'),
                      boldText('\t - actions (List<Widget>) :'),
                      normalText(
                          ' The (optional) set of actions that are displayed at the bottom of the dialog.\n\n'),
                      boldText('\t - actionsOverflowButtonSpacing → double :'),
                      normalText(' The spacing between actions when the button bar overflows.\n\n'),
                      boldText('\t - actionsOverflowDirection → VerticalDirection :'),
                      normalText(
                          ' The vertical direction of actions if the children overflow horizontally.\n\n'),
                      boldText('\t - actionsPadding → EdgeInsetsGeometry :'),
                      normalText(
                          ' Padding around the set of actions at the bottom of the dialog.\n\n'),
                      boldText('\t - backgroundColor → Color :'),
                      normalText(' The background color of the surface of this Dialog.\n\n'),
                      boldText('\t - buttonPadding → EdgeInsetsGeometry :'),
                      normalText(' The padding that surrounds each button in actions.\n\n'),
                      boldText('\t - clipBehavior → Clip :'),
                      normalText(' Controls how the contents of the dialog are clipped (or not) to '
                          'the given shape.\n\n'),
                      boldText('\t - content → Widget :'),
                      normalText(' The (optional) content of the dialog is displayed in the center '
                          'of the dialog in a lighter font.\n\n'),
                      boldText('\t - contentPadding → EdgeInsetsGeometry :'),
                      normalText(' Padding around the content.\n\n'),
                      boldText('\t - contentTextStyle → TextStyle :'),
                      normalText(' Style for the text in the content of this AlertDialog.\n\n'),
                      boldText('\t - elevation → double :'),
                      normalText(' The z-coordinate of this Dialog..\n\n'),
                      boldText('\t - insetPadding → EdgeInsets :'),
                      normalText(' The amount of padding added to MediaQueryData.viewInsets on the '
                          'outside of the dialog. This defines the minimum space between the '
                          'screen\'s edges and the dialog.\n\n'),
                      boldText('\t - scrollable → bool :'),
                      normalText(' Determines whether the title and content widgets are wrapped in '
                          'a scrollable.\n\n'),
                      boldText('\t - semanticLabel → String :'),
                      normalText(
                          ' The semantic label of the dialog used by accessibility frameworks '
                          'to announce screen transitions when the dialog is opened and closed.\n\n'),
                      boldText('\t - shape → ShapeBorder :'),
                      normalText(' The shape of this dialog\'s border.\n\n'),
                      boldText('\t - title → Widget :'),
                      normalText(' The (optional) title of the dialog is displayed in a large font '
                          'at the top of the dialog.\n\n'),
                      boldText('\t - titlePadding → EdgeInsetsGeometry :'),
                      normalText(' Padding around the title.\n\n'),
                      boldText('\t - titleTextStyle → TextStyle :'),
                      normalText(' Style for the text in the title of this AlertDialog.\n\n'),
                    ],
                  ),
                ),
                context: context),
          ],
        )),
      ),
    );
  }
}
