import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

TextSpan boldText(String text) {
  return TextSpan(text: text, style: new TextStyle(fontWeight: FontWeight.bold));
}

TextSpan normalText(String text) {
  return TextSpan(text: text);
}

Widget boxTextDisplay({Widget child, BuildContext context}) {
  return Container(
    color: Colors.grey.withOpacity(0.15),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.25,
    padding: EdgeInsets.all(8.0),
    margin: EdgeInsets.all(8.0),
    child: Scrollbar(child: SingleChildScrollView(child: child)),
  );
}


launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

BoxDecoration boxDecoration(double radius) {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: <BoxShadow>[
        BoxShadow(blurRadius: 8, offset: Offset(3, 3), color: Colors.blueAccent.withOpacity(0.1))
      ]);
}

Widget boxPreview({Widget child}) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: boxDecoration(20),
    child: child,
  );
}
