import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required this.textController,
    this.placeHolder,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController textController;
  final String placeHolder;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: CupertinoTextField(
          controller: textController,
          clearButtonMode: OverlayVisibilityMode.editing,
          prefix: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(Icons.search, color: Colors.grey)),
          placeholder: placeHolder,
          placeholderStyle: TextStyle(color: Colors.grey),
          style: TextStyle(color: Colors.black),
          onChanged: onChanged,
          decoration:
              BoxDecoration(color: Color(0xffefeff4), borderRadius: BorderRadius.circular(6)),
        ));
  }
}
