import 'dart:math';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

//fluid_bottom_nav_bar: ^1.1.1
class SampleBottomNavigationBar17 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar17State createState() => _SampleBottomNavigationBar17State();
}

class _SampleBottomNavigationBar17State extends State<SampleBottomNavigationBar17> {
  Widget _child;

  @override
  void initState() {
    _child = HomeContent();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return Scaffold(
      backgroundColor: Color(0xFF75B7E1),
      extendBody: true,
      body: _child,
      appBar: AppBar(title: Text('Sample 17'),),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              iconPath: "assets/home.svg",
              backgroundColor: Color(0xFF4285F4),
              extras: {"label": "home"}),
          FluidNavBarIcon(
              iconPath: "assets/bookmark.svg",
              backgroundColor: Color(0xFFEC4134),
              extras: {"label": "bookmark"}),
          FluidNavBarIcon(
              iconPath: "assets/partner.svg",
              backgroundColor: Color(0xFFFCBA02),
              extras: {"label": "partner"}),
          FluidNavBarIcon(
              iconPath: "assets/conference.svg",
              backgroundColor: Color(0xFF34A950),
              extras: {"label": "conference"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 1.5,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}

class PlaceholderCardShort extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color color;
  final Color backgroundColor;

  const PlaceholderCardShort(
      {Key key,
        this.cornerRadius = 4,
        this.color,
        this.backgroundColor,
        this.width = 400,
        this.height = 90})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var r = Random();
    var fgColor = color ?? Color(0xfff2f2f2);
    double lineHeight = 16;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      padding: EdgeInsets.all(16),
      child: Stack(
        children: <Widget>[
          //Circle image
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: fgColor),
              height: 32,
              width: 32,
            ),
          ),

          //Content Line
          Container(
              margin: EdgeInsets.only(right: 60.0 + r.nextInt(60)),
              color: fgColor,
              height: lineHeight),

          //Content Line
          Container(
              margin: EdgeInsets.only(
                  right: 80.0 + r.nextInt(120), top: lineHeight + 6),
              color: fgColor,
              height: lineHeight),
        ],
      ),
    );
  }
}

class PlaceholderCardTall extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color color;
  final Color backgroundColor;

  const PlaceholderCardTall(
      {Key key,
        this.cornerRadius = 4,
        this.color,
        this.backgroundColor,
        this.width = 400,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var r = Random();
    var fgColor = color ?? Color(0xfff2f2f2);
    double lineHeight = 14;
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          //Circle image
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999), color: fgColor),
            height: 45,
            width: 45,
          ),
          //Title
          Container(
              margin: EdgeInsets.only(left: 65, top: 10),
              color: fgColor,
              height: lineHeight * 1.2,
              width: 100.0 + r.nextInt(100)),

          //Content Line
          Container(
              margin: EdgeInsets.only(top: 60, right: 10.0 + r.nextInt(60)),
              color: fgColor,
              height: lineHeight),

          //Content Line
          Container(
              margin: EdgeInsets.only(top: 85, right: 10.0 + r.nextInt(60)),
              color: fgColor,
              height: lineHeight),

          //Content Line
          Container(
              margin: EdgeInsets.only(top: 110, right: 10.0 + r.nextInt(60)),
              color: fgColor,
              height: lineHeight),

          //Content Line
          Container(
              margin: EdgeInsets.only(top: 135, right: 60.0 + r.nextInt(60)),
              color: fgColor,
              height: lineHeight),
        ],
      ),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color color;
  final Color backgroundColor;

  const PlaceholderImage(
      {Key key,
        this.cornerRadius = 4,
        this.color,
        this.backgroundColor,
        this.width = 100,
        this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fgColor = color ?? Color(0xfff2f2f2);
    var bgColor = backgroundColor ?? Colors.white;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: bgColor,
      ),
      margin: EdgeInsets.all(12),
      child: CustomPaint(
        painter: _ImagePainter(fgColor, bgColor),
      ),
    );
  }
}

class _ImagePainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;

  _ImagePainter(this.color, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paintForeground = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = color;
    //Draw mountains, size to width
    var width = size.width * .6;
    canvas.translate(
        size.width / 2 - width / 2, size.height / 2 + (width * .7) / 2);
    var path = Path()
      ..lineTo(width * .4, -width * .66)
      ..lineTo(width * .63, -width * .29)
      ..lineTo(width * .74, -width * .44)
      ..lineTo(width, 0)
      ..lineTo(0, 0);
    //Paint twice, for both stroke and fill
    canvas.drawPath(path, paintForeground);
    paintForeground.style = PaintingStyle.fill;
    canvas.drawPath(path, paintForeground);
    //Draw sun
    canvas.drawCircle(
        Offset(width * .9, -width * .7), width * .1, paintForeground);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PlaceholderImageWithText extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color color;
  final Color backgroundColor;

  const PlaceholderImageWithText(
      {Key key,
        this.cornerRadius = 0,
        this.color,
        this.backgroundColor,
        this.width = 100,
        this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fgColor = color ?? Color(0xfff2f2f2);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(child: Container(color: fgColor)),
          Stack(
            children: <Widget>[
              Container(
                  color: fgColor,
                  height: 16,
                  margin: EdgeInsets.only(top: 12, left: 10, right: 70)),
              Container(
                  color: fgColor,
                  height: 10,
                  margin: EdgeInsets.only(top: 40, left: 10, right: 30)),
              Container(
                  color: fgColor,
                  height: 10,
                  margin: EdgeInsets.only(top: 56, left: 10, right: 10)),
              Container(
                  color: fgColor,
                  height: 10,
                  margin: EdgeInsets.only(
                      top: 72, left: 10, right: 60, bottom: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountContent extends StatefulWidget {
  @override
  _AccountContentState createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView.builder(
          itemCount: 9,
          itemBuilder: (content, index) {
            return PlaceholderCardShort(
                color: Color(0xFF99D3F7), backgroundColor: Color(0xFFC7EAFF));
          }),
    );
  }
}

class GridContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 3 : 2;

    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 20),
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(20, (index) {
          return PlaceholderImageWithText(
              color: Color(0xFF99D3F7), backgroundColor: Color(0xFFC7EAFF));
        }),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (content, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PlaceholderCardTall(
                height: 200,
                color: Color(0xFF99D3F7),
                backgroundColor: Color(0xFFC7EAFF)),
          );
        },
      ),
    );
  }
}