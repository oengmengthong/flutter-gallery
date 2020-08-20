import 'package:flutter/cupertino.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/lists.dart';
import 'package:gallerywidget/widget_catalog/button/lists.dart';
import 'package:gallerywidget/widget_catalog/card/lists.dart';
import 'package:gallerywidget/widget_catalog/chart/lists.dart';
import 'package:gallerywidget/widget_catalog/floatingbutton/lists.dart';
import 'package:gallerywidget/widget_catalog/loading/lists.dart';
import 'package:gallerywidget/widget_catalog/text/lists.dart';
import 'package:gallerywidget/widget_catalog/textfield/lists.dart';

class Catalog {
  String title;
  String image;
  Widget child;
  Catalog({this.title, this.image, this.child});
}

List<Catalog> dataCatalogs = [
  Catalog(
    title: 'Bottom Navigation Bar',
    image:
        'https://i.imgur.com/zczy9qy.gif',
    child: ListsBottomNavigationStyle()),
  Catalog(
    title: 'Loading',
    image:
        'https://static.dribbble.com/users/1186261/screenshots/3718681/_______.gif',
    child: ListLoadingStyle(),
  ),
  Catalog(
    title: 'Button',
    image: 'https://media.giphy.com/media/xUA7aRTHye1h86nbCU/giphy.gif',
    child: ListButtonStyle(),
  ),
  Catalog(
    title: 'TextField',
    image: 'https://flutterforum.s3.dualstack.eu-west-2.amazonaws.com/optimized/1X/f03067c47042ea0ae9a2fd1c6b08e0acc203681b_2_500x500.gif',
    child: ListTextFieldStyle(),
  ),
  Catalog(
    title: 'Floating Button',
    image: 'https://fluttercentral.com/Uploads/9da4a56f-0711-4091-8c38-a474e1c39df0.gif',
    child: ListFloatingStyle(),
  ),
  Catalog(
    title: 'Card',
    image: 'https://raw.githubusercontent.com/iamvivekkaushik/AwesomeCard/master/screenshot/card.gif',
    child: ListCardStyle(),
  ),
  Catalog(
    title: 'Text',
    image: 'https://startflutter.com/wp-content/uploads/2019/07/scale.gif',
    child: ListTextStyle(),
  ),
  Catalog(
    title: 'Chart & Bar',
    image: 'https://i.pinimg.com/originals/3c/4c/c2/3c4cc2099994ec8387c9bdad4f06bfa8.gif',
    child: ListChartStyle(),
  ),
];
