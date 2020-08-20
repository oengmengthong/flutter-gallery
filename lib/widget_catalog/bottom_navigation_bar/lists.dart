import 'package:flutter/material.dart';
import 'package:gallerywidget/models/dataBottomNavigationBarList.dart';

class ListsBottomNavigationStyle extends StatefulWidget {
  @override
  _ListsBottomNavigationStyleState createState() =>
      _ListsBottomNavigationStyleState();
}

class _ListsBottomNavigationStyleState
    extends State<ListsBottomNavigationStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Style Bottom Navigation Bar'),
      ),
      body: ListView.builder(
        itemCount: dataBottomBars.length,
        itemBuilder: (context, index) {
          int num = index + 1;
          return ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => dataBottomBars[index].child)),
            leading: Text(num.toString()),
            title: Text(dataBottomBars[index].title),
          );
        },
      ),
    );
  }
}
