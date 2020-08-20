import 'package:flutter/material.dart';
import 'package:gallerywidget/providers/searchTemplates.dart';
import 'package:gallerywidget/providers/searchWidgets.dart';
import 'package:gallerywidget/widget_catalog/bottom_navigation_bar/sample32.dart';
import 'package:provider/provider.dart';

import 'listGallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchWidgetsProvider()),
          ChangeNotifierProvider(create: (_) => SearchTemplatesProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  brightness: Brightness.light,
                  elevation: 0.0,
                  color: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.teal),
                  textTheme: TextTheme(
                      // ignore: deprecated_member_use
                      title: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)))),
          home: Directionality(
//            textDirection: TextDirection.rtl,
             textDirection: TextDirection.ltr,
            child: ListGalleryScreen()
          ),
        ));
  }
}
