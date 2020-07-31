import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class ViewScourceCodeScreen extends StatefulWidget {
  ViewScourceCodeScreen({Key key, this.source}) : super(key: key);
  final source;
  @override
  _ViewScourceCodeScreenState createState() => _ViewScourceCodeScreenState();
}

class _ViewScourceCodeScreenState extends State<ViewScourceCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Code'),
        ),
        body: SourceCodeView(filePath: widget.source));
  }
}
