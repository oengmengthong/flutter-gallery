import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SingleColors extends StatefulWidget {
  @override
  _SingleColorsState createState() => _SingleColorsState();
}

class _SingleColorsState extends State<SingleColors> {
  bool lightTheme = true;
  Color currentColor = Colors.white;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: currentColor,
          title: GestureDetector(
            child: Text('Single Color'),
            // onDoubleTap: () => setState(() => lightTheme = !lightTheme),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            indicatorColor: Colors.teal,
            tabs: <Widget>[
              const Tab(text: 'HSV Color'),
              const Tab(text: 'Material Color')
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColorPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
                colorPickerWidth: MediaQuery.of(context).size.width,
                pickerAreaHeightPercent: 1,
                enableAlpha: true,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsv,
                pickerAreaBorderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(2.0),
                  topRight: const Radius.circular(2.0),
                ),
              ),
            ),
            Expanded(
              child: MaterialPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
                enableLabel: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
