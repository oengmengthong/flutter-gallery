import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class GradientColorsPicker extends StatefulWidget {
  @override
  _GradientColorsPickerState createState() => _GradientColorsPickerState();
}

class _GradientColorsPickerState extends State<GradientColorsPicker> {

  Color _currentColor = Colors.white;

  void _onColorChanged(Color color) {
    setState(() => _currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient Colors'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.all(16),
            //   height: 70,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     gradient: Gradient(colors: [])
            //   ),
            // ),
            Center(
              child: CircleColorPicker(
                initialColor: _currentColor,
                onChanged: _onColorChanged,
              ),
            ),
            Center(
              child: CircleColorPicker(
                initialColor: _currentColor,
                onChanged: _onColorChanged,
                strokeWidth: 1,
                thumbSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
