import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallerywidget/models/dataList.dart';
import 'package:gallerywidget/template/baseViewTemplate.dart';
import 'package:gallerywidget/widget/baseViewWidget.dart';
import 'package:get_version/get_version.dart';

import 'other/baseViewOther.dart';

class ListGalleryScreen extends StatefulWidget {
  @override
  _ListGalleryScreenState createState() => _ListGalleryScreenState();
}

class _ListGalleryScreenState extends State<ListGalleryScreen> {
  String projectVersion = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getVersion();
  }

  void _getVersion() async {
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                automaticallyImplyTitle: false,
                brightness: Brightness.light,
                backgroundColor: Colors.teal,
                trailing: Image.asset("assets/images/flutter.png", height: 30),
                largeTitle: Text('Flutter Gallery', style: TextStyle(color: Colors.white)),
              )
            ];
          },
          body: SafeArea(
            child: Column(
              children: <Widget>[_boxList(), Text("Version : " + projectVersion + " Development")],
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxList() {
    return Expanded(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: dataLists.map((item) {
                return InkWell(
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) {
                          String title = item.title;
                          if (title == "Templates") {
                            return BaseViewTemplateScreen(lists: item);
                          } else if (title == "Widgets") {
                            return BaseViewWidgetScreen(lists: item);
                          }
                          return BaseViewOtherScreen(lists: item);
                        })),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: Colors.white, boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 8,
                            offset: Offset(3, 3),
                            color: Colors.teal.withOpacity(0.1))
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: double.infinity,
                            child: Center(
                              child: Image.asset(
                                "assets/images/" + item.image + ".png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ),
                          )
                        ],
                      ),
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
