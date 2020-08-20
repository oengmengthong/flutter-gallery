import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

//flutter_snake_navigationbar: ^0.4.0+1
class SampleBottomNavigationBar23 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar23State createState() => _SampleBottomNavigationBar23State();
}

class _SampleBottomNavigationBar23State extends State<SampleBottomNavigationBar23> {
  SnakeShape customSnakeShape = SnakeShape(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      centered: true);
  ShapeBorder customBottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );

  int _selectedItemPosition = 2;
  SnakeBarStyle snakeBarStyle = SnakeBarStyle.floating;
  SnakeShape snakeShape = SnakeShape.circle;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));
  double elevation = 0;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color backgroundColor = Colors.white;
  Color selectionColor = Colors.black;

  Gradient backgroundGradient =
  const LinearGradient(colors: [Colors.black, Colors.lightBlue]);
  Gradient selectionGradient =
  const LinearGradient(colors: [Colors.white, Colors.amber]);

  EdgeInsets padding = EdgeInsets.all(12);
  Color containerColor = Color(0xFFFDE1D7);
  TextStyle labelTextStyle = TextStyle(
      fontSize: 11, fontFamily: 'Ubuntu', fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        brightness: Brightness.light,
        title: Text('Sample 23', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: AnimatedContainer(
        color: containerColor,
        duration: Duration(seconds: 1),
        child: PageView(
          onPageChanged: _onPageChanged,
          children: <Widget>[
            PagerPageWidget(
              text: 'This is our beloved SnakeBar.',
              description: 'Swipe right to see different styles',
              image: Image.asset('images/flutter1.png'),
            ),
            PagerPageWidget(
              text: 'It comes in all shapes and sizes...',
              description:
              'Change indicator and bottom bar shape at your will.',
              image: Image.asset('images/flutter2.png'),
            ),
            PagerPageWidget(
              text: '...not only the ones you see here',
              description:
              'Combine different shapes for unique and personalized style!.',
              image: Image.asset('images/flutter3.png'),
            ),
            PagerPageWidget(
              text: 'And it\'s all open source!',
              description:
              'Get the Flutter library on github.com/herodotdigital',
              image: Image.asset('images/flutter4.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar(
        style: snakeBarStyle,
        snakeShape: snakeShape,
        snakeColor: selectionColor, //comment if you want to see colors
        backgroundColor: backgroundColor, //comment if you want to see colors
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        shape: bottomBarShape,
        padding: padding,
        currentIndex: _selectedItemPosition,
        onPositionChanged: (index) =>
            setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text('tickets', style: labelTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('calendar', style: labelTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home', style: labelTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              title: Text('microphone', style: labelTextStyle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('search', style: labelTextStyle))
        ],
      ),
    );
  }

  _onPageChanged(int page) {
    switch (page) {
      case 0:
        setState(() {
          containerColor = Color(0xFFFDE1D7);
          snakeBarStyle = SnakeBarStyle.floating;
          snakeShape = SnakeShape.circle;
          padding = EdgeInsets.all(12).copyWith();
          bottomBarShape = RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)));
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
      case 1:
        setState(() {
          containerColor = Color(0xFFE4EDF5);
          snakeBarStyle = SnakeBarStyle.pinned;
          snakeShape = SnakeShape.circle;
          padding = EdgeInsets.zero;
          bottomBarShape = customBottomBarShape;
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;

      case 2:
        setState(() {
          containerColor = Color(0xFFF4E4CE);
          snakeBarStyle = SnakeBarStyle.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
          bottomBarShape = customBottomBarShape1;
          showSelectedLabels = true;
          showUnselectedLabels = true;
        });
        break;
      case 3:
        setState(() {
          containerColor = Color(0xFFE7EEED);
          snakeBarStyle = SnakeBarStyle.pinned;
          snakeShape = SnakeShape.indicator;
          padding = EdgeInsets.zero;
          bottomBarShape = null;
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
    }
  }
}

class PagerPageWidget extends StatelessWidget {
  final String text;
  final String description;
  final Image image;
  final TextStyle titleStyle =
  TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
  final TextStyle subtitleStyle = TextStyle(
      fontSize: 20, fontFamily: 'Ubuntu', fontWeight: FontWeight.w200);

  PagerPageWidget({
    Key key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(24),
    child: SafeArea(
      child: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(text, style: titleStyle),
                SizedBox(height: 16),
                Text(description, style: subtitleStyle),
              ],
            ),
            image
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(text, style: titleStyle),
                  Text(description, style: subtitleStyle),
                ],
              ),
            ),
            Expanded(child: image)
          ],
        );
      }),
    ),
  );
}