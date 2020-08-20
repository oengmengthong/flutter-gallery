import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';

//cuberto_bottom_bar: ^1.1.2+3
class SampleBottomNavigationBar14 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar14State createState() => _SampleBottomNavigationBar14State();
}

class _SampleBottomNavigationBar14State extends State<SampleBottomNavigationBar14> with SingleTickerProviderStateMixin {
  int currentPage;
  Color currentColor = Colors.deepPurple;
  Color inactiveColor = Colors.black;
  PageController tabBarController;
  List<Tabs> tabs = new List();

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    tabs.add(Tabs(
      Icons.home,
      "Home",
      Colors.deepPurple,
      getGradient(Colors.deepPurple),
    ));
    tabs.add(
        Tabs(Icons.search, "Search", Colors.pink, getGradient(Colors.pink)));
    tabs.add(
        Tabs(Icons.alarm, "Alarm", Colors.amber, getGradient(Colors.amber)));
    tabs.add(Tabs(
        Icons.settings, "Settings", Colors.teal, getGradient(Colors.teal)));
    tabBarController = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    Widget tabView({int destinationIndex}) {
      return Container(
          decoration: BoxDecoration(color: tabs[currentPage].color),
          child: InkWell(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        tabs[currentPage].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Click here to Change the tab To " +
                            tabs[destinationIndex].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  )),
              onTap: () {
                setState(() {
                  currentPage = destinationIndex;
                  tabBarController.jumpToPage(currentPage);
                });
              }));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Sample 14'),),
      body: PageView(
          controller: tabBarController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            tabView(destinationIndex: 3),
            tabView(destinationIndex: 0),
            tabView(destinationIndex: 1),
            tabView(destinationIndex: 2)
          ]),
//      drawer: new Container(
//          width: 250.0,
//          margin: EdgeInsets.only(bottom: 60.0),
//          color: Colors.blue,
//          child: ListView(
//            children: <Widget>[Text("Hello"), Text("World")],
//          )),
//      endDrawer: new Container(
//          width: 250.0,
//          margin: EdgeInsets.only(bottom: 60.0),
//          color: Colors.blue,
//          child: ListView(
//            children: <Widget>[Text("Hello"), Text("World")],
//          )),
      bottomNavigationBar: CubertoBottomBar(
        key: Key("BottomBar"),
        inactiveIconColor: inactiveColor,
        tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
        selectedTab: currentPage,
        tabs: tabs
            .map((value) => TabData(
            key: Key(value.title),
            iconData: value.icon,
            title: value.title,
            tabColor: value.color,
            tabGradient: value.gradient))
            .toList(),
        onTabChangedListener: (position, title, color) {
          setState(() {
            currentPage = position;
            tabBarController.jumpToPage(position);
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }
}

class Tabs {
  final IconData icon;
  final String title;
  final Color color;
  final Gradient gradient;

  Tabs(this.icon, this.title, this.color, this.gradient);
}

getGradient(Color color) {
  return LinearGradient(
      colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
      stops: [0.0, 0.7]);
}