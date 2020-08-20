import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//convex_bottom_bar: ^2.4.1
class SampleBottomNavigationBar33 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar33State createState() =>
      _SampleBottomNavigationBar33State();
}

class _SampleBottomNavigationBar33State
    extends State<SampleBottomNavigationBar33>
    with SingleTickerProviderStateMixin {
  List<TabItem> items = <TabItem>[
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.map, title: 'Discovery'),
    TabItem(icon: Icons.plus_one, title: 'Add'),
  ];

  static const paletteColors = [
    Color(0xFFf44336),
    Color(0xFFE91E63),
    Color(0xFF9C27B0),
    Color(0xFF673AB7),
    Color(0xFF3F51B5),
    Color(0xFF2196F3),
    Color(0xFF00BCD4),
    Color(0xFF009688),
    Color(0xFF4CAF50),
    Color(0xFF8BC34A),
    Color(0xFFCDDC39),
    Color(0xFFFFEB3B),
    Color(0xFFFFC107),
    Color(0xFFFF9800),
    Color(0xFFFF5722),
    Color(0xFF795548),
    Color(0xFF9E9E9E),
    Color(0xFF607D8B),
  ];
  Color _tabBackgroundColor = paletteColors[5];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      initialIndex: 1, // always reset to index 1 when page is being rebuild
      child: Scaffold(
        appBar: AppBar(title: const Text('Custom ConvexAppBar')),
        body: TabBarView(
          children: items
              .map((i) => i.title == 'Discovery'
                  ? paletteBody()
                  : Center(
                      child: Text(
                      '<\t\t${i.title}\t\t>',
                      style: TextStyle(fontSize: 30),
                    )))
              .toList(growable: false),
        ),
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            height: 50,
            top: -30,
            curveSize: 100,
            style: TabStyle.fixedCircle,
            items: [
              TabItem(title: '2019', icon: Icons.link),
              TabItem(icon: Icons.import_contacts),
              TabItem(title: "2020", icon: Icons.work),
            ],
            backgroundColor: _tabBackgroundColor,
            cornerRadius: 25,
          ),
        ),
      ),
    );
  }

  Widget builder() {
    return ConvexAppBar.builder(
      itemBuilder: _CustomBuilder(items, _tabBackgroundColor),
      count: items.length,
      backgroundColor: _tabBackgroundColor,
    );
  }

  Container tabContent(TabItem data, Color color) {
    return Container(
        height: 50,
        padding: EdgeInsets.only(bottom: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(data.icon, color: color),
            Text(data.title, style: TextStyle(color: color))
          ],
        ));
  }

  GridView paletteBody() {
    return GridView.count(
      crossAxisCount: 5,
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: paletteColors
          .map((c) => GestureDetector(
                child: ColorItemView(c),
                onTap: () => _onColorChanged(c),
              ))
          .toList(),
    );
  }

  void _onColorChanged(Color color) {
    setState(() {
      _tabBackgroundColor = color;
    });
  }
}

class _CustomBuilder extends DelegateBuilder {
  final List<TabItem> items;
  final Color _tabBackgroundColor;

  _CustomBuilder(this.items, this._tabBackgroundColor);

  @override
  Widget build(BuildContext context, int index, bool active) {
    var navigationItem = items[index];
    var _color = active ? Colors.white : Colors.white60;

    if (index == items.length ~/ 2) {
      return Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
        child: Icon(
          Icons.add,
          size: 40,
          color: _tabBackgroundColor,
        ),
      );
    }
    var _icon = active
        ? navigationItem.activeIcon ?? navigationItem.icon
        : navigationItem.icon;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(_icon, color: _color),
          Text(navigationItem.title, style: TextStyle(color: _color))
        ],
      ),
    );
  }

  @override
  bool fixed() {
    return true;
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 20, color: color);
  }
}

class Badge {
  final Color color;
  final Color badgeColor;
  final EdgeInsets padding;
  final double borderRadius;
  final String text;

  const Badge(
    this.text, {
    this.color,
    this.badgeColor,
    this.padding,
    this.borderRadius,
  });
}

class ChoiceValue<T> {
  const ChoiceValue({this.value, this.title, this.label});

  final T value;
  final String title;
  final String label; // For the Semantics widget that contains title

  @override
  String toString() => '$runtimeType("$title")';
}

class NamedColor {
  const NamedColor(this.color, this.name);

  final Color color;
  final String name;
}

class ChipItem extends StatelessWidget {
  const ChipItem(this.chips, this.selectedChip, this.onChanged);

  final List<Badge> chips;
  final Badge selectedChip;
  final ValueChanged<Badge> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chips.map<Widget>((Badge chip) {
        return GestureDetector(
          onTap: () => onChanged(chip),
          child: Container(
            height: 40,
            width: 80,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: chip == selectedChip
                      ? Colors.black
                      : const Color(0xFFD5D7DA),
                  width: 2),
            ),
            child: chip == null
                ? Center(child: Text('clear'))
                : Center(
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(chip.borderRadius ?? 20),
                      ),
                      type: MaterialType.card,
                      color: chip.badgeColor ?? Colors.redAccent,
                      child: Padding(
                        padding:
                            chip.padding ?? EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          chip.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      }).toList(),
    );
  }
}

class ChooseTabItem extends StatelessWidget {
  const ChooseTabItem(this.tabTypes, this.selectedType, this.onChanged);

  final List<ChoiceValue<List<TabItem>>> tabTypes;
  final ChoiceValue<List<TabItem>> selectedType;
  final ValueChanged<ChoiceValue<List<TabItem>>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabTypes.map<Widget>((ChoiceValue<List<TabItem>> type) {
        return Expanded(
          child: RadioItem<List<TabItem>>(type, selectedType, onChanged),
        );
      }).toList(),
    );
  }
}

class ColorsItem extends StatelessWidget {
  const ColorsItem(this.colors, this.selectedColor, this.onChanged);

  final List<NamedColor> colors;
  final Color selectedColor;
  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map<Widget>((NamedColor namedColor) {
        return RawMaterialButton(
          onPressed: () {
            onChanged(namedColor.color);
          },
          constraints: const BoxConstraints.tightFor(
            width: 32.0,
            height: 32.0,
          ),
          fillColor: namedColor.color,
          shape: CircleBorder(
            side: BorderSide(
              color: namedColor.color == selectedColor
                  ? Colors.black
                  : const Color(0xFFD5D7DA),
              width: 2.0,
            ),
          ),
          child: Semantics(
            value: namedColor.name,
            selected: namedColor.color == selectedColor,
          ),
        );
      }).toList(),
    );
  }
}

class GradientItem extends StatelessWidget {
  const GradientItem(this.colors, this.selectedColor, this.onChanged);

  final List<Gradient> colors;
  final Gradient selectedColor;
  final ValueChanged<Gradient> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map<Widget>((Gradient namedColor) {
        return GestureDetector(
          onTap: () => onChanged(namedColor),
          child: Container(
            height: 40,
            width: 80,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: namedColor == selectedColor
                      ? Colors.black
                      : const Color(0xFFD5D7DA),
                  width: 2),
              gradient: namedColor,
              color: namedColor != null ? Colors.grey : null,
            ),
            child: namedColor == null ? Center(child: Text('clear')) : null,
          ),
        );
      }).toList(),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 48.0,
      padding: const EdgeInsetsDirectional.only(start: 56.0),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}

class RadioItem<T> extends StatelessWidget {
  const RadioItem(this.value, this.groupValue, this.onChanged);

  final ChoiceValue<T> value;
  final ChoiceValue<T> groupValue;
  final ValueChanged<ChoiceValue<T>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      alignment: AlignmentDirectional.centerStart,
      child: MergeSemantics(
        child: Row(
          children: <Widget>[
            Radio<ChoiceValue<T>>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Expanded(
              child: Semantics(
                container: true,
                button: true,
                label: value.label,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (onChanged != null) {
                      onChanged(value);
                    }
                  },
                  child: Text(value.title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorItemView extends StatelessWidget {
  final Color color;

  ColorItemView(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        color.value.toRadixString(16).toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ConvexButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ConvexButtonDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConvexButton Example')),
      body: Center(child: Text('count $count')),
      bottomNavigationBar: ConvexButton.fab(
        onTap: () => setState(() => count++),
      ),
    );
  }
}

class Data {
  static const gradients = [
    null,
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.redAccent, Colors.green, Colors.blue],
      tileMode: TileMode.repeated,
    ),
    LinearGradient(
      begin: Alignment.center,
      end: Alignment(-1, 1),
      colors: [Colors.redAccent, Colors.green, Colors.blue],
      tileMode: TileMode.repeated,
    ),
    RadialGradient(
      center: const Alignment(0, 0), // near the top right
      radius: 5,
      colors: [Colors.green, Colors.blue, Colors.redAccent],
    )
  ];

  static const namedColors = [
    NamedColor(Colors.blue, 'Blue'),
    NamedColor(Color(0xFFf44336), 'Read'),
    NamedColor(Color(0xFF673AB7), 'Purple'),
    NamedColor(Color(0xFF009688), 'Green'),
    NamedColor(Color(0xFFFFC107), 'Yellow'),
    NamedColor(Color(0xFF607D8B), 'Grey'),
  ];
  static const badges = [
    null,
    Badge('1'),
    Badge('hot',
        badgeColor: Colors.orange, padding: EdgeInsets.only(left: 7, right: 7)),
    Badge('99+', borderRadius: 2)
  ];

  static const curves = [
    ChoiceValue<Curve>(
      title: 'Curves.bounceInOut',
      label: 'The curve bounceInOut is used',
      value: Curves.bounceInOut,
    ),
    ChoiceValue<Curve>(
      title: 'Curves.decelerate',
      value: Curves.decelerate,
      label: 'The curve decelerate is used',
    ),
    ChoiceValue<Curve>(
      title: 'Curves.easeInOut',
      value: Curves.easeInOut,
      label: 'The curve easeInOut is used',
    ),
    ChoiceValue<Curve>(
      title: 'Curves.fastOutSlowIn',
      value: Curves.fastOutSlowIn,
      label: 'The curve fastOutSlowIn is used',
    ),
  ];

  static List<TabItem> items({bool image}) {
    if (image) {
      return [
        TabItem<Image>(
          icon: Image.asset('images/sample-1.png'),
          activeIcon: Image.asset('images/sample-1-2.png'),
          title: 'Happy',
        ),
        TabItem<Image>(
            icon: Image.asset('images/sample-2.png'),
            activeIcon: Image.asset('images/sample-2-2.png'),
            title: 'New'),
        TabItem<Image>(
          icon: Image.asset('images/sample-3.png'),
          activeIcon: Image.asset('images/sample-3-2.png'),
          title: 'Year',
        ),
        TabItem<Image>(
          icon: Image.asset('images/sample-4.png'),
          activeIcon: Image.asset('images/sample-4-2.png'),
          title: '20',
        ),
        TabItem<Image>(
          icon: Image.asset('images/sample-5.png'),
          activeIcon: Image.asset('images/sample-5-2.png'),
          title: '20',
        ),
      ];
    }
    return [
      TabItem<IconData>(icon: Icons.home, title: 'Home'),
      TabItem<IconData>(icon: Icons.map, title: "Discovery"),
      TabItem<IconData>(icon: Icons.publish, title: "Publish"),
      TabItem<IconData>(icon: Icons.message, title: 'Message'),
      TabItem<IconData>(icon: Icons.people, title: 'Profile'),
    ];
  }
}

class DefaultAppBarDemo extends StatefulWidget {
  @override
  State createState() {
    return _StateDefaultAppBarDemo();
  }
}

class _StateDefaultAppBarDemo extends State<DefaultAppBarDemo> with SingleTickerProviderStateMixin {
  static const kStyles = [
    ChoiceValue<TabStyle>(
      title: 'TabStyle.react',
      label: 'Appbar use react style',
      value: TabStyle.react,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.reactCircle',
      label: 'Appbar use reactCircle style',
      value: TabStyle.reactCircle,
    ),
    ChoiceValue<TabStyle>(
      title: kIsWeb
          ? 'TabStyle.flip (Flutter Web is not supported)'
          : 'TabStyle.flip',
      label: 'Appbar use flip style',
      value: TabStyle.flip,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.textIn',
      label: 'Appbar use textIn style',
      value: TabStyle.textIn,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.titled',
      label: 'Appbar use titled style',
      value: TabStyle.titled,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixed',
      label: 'Appbar use fixed style',
      value: TabStyle.fixed,
    ),
    ChoiceValue<TabStyle>(
      title: 'TabStyle.fixedCircle',
      label: 'Appbar use fixedCircle style',
      value: TabStyle.fixedCircle,
    ),
  ];

  static final kTabTypes = [
    ChoiceValue<List<TabItem>>(
      title: 'Icon Tab',
      label: 'Appbar use icon with Tab',
      value: Data.items(image: false),
    ),
    ChoiceValue<List<TabItem>>(
      title: 'Image Tab',
      label: 'Appbar use image with Tab',
      value: Data.items(image: true),
    ),
  ];
  var _tabItems = kTabTypes.first;

  ChoiceValue<TabStyle> _style = kStyles.first;
  ChoiceValue<Curve> _curve = Data.curves.first;
  Color _barColor = Data.namedColors.first.color;
  Gradient _gradient = Data.gradients.first;
  Badge _badge;
  TabController _tabController;
  TextDirection _textDirection = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.value.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var options = <Widget>[
      const Heading('Appbar Color'),
      ColorsItem(Data.namedColors, _barColor, _onBarColorChanged),
      const Heading('Background Gradient'),
      GradientItem(Data.gradients, _gradient, _onGradientChanged),
      const Heading('Badge Chip'),
      ChipItem(Data.badges, _badge, _onBadgeChanged),
      const Heading('Tab Type'),
      ChooseTabItem(kTabTypes, _tabItems, _onTabItemTypeChanged),
      const Heading('Tab Style'),
    ];
    options.addAll(kStyles.map((s) => RadioItem<TabStyle>(s, _style,
        s.value == TabStyle.flip && kIsWeb ? null : _onStyleChanged)));
    if (_style.value != TabStyle.fixed &&
        _style.value != TabStyle.fixedCircle) {
      options.add(const Heading('Animation Curve'));
      options.addAll(
          Data.curves.map((c) => RadioItem<Curve>(c, _curve, _onCurveChanged)));
    }

    return Directionality(
      textDirection: _textDirection,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Default ConvexAppBar'),
          backgroundColor: _barColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(_textDirection == TextDirection.rtl
                  ? Icons.format_textdirection_r_to_l
                  : Icons.format_textdirection_l_to_r),
              color: Colors.white,
              tooltip: _textDirection == TextDirection.rtl
                  ? "Change to LTR"
                  : "Change to RTL",
              onPressed: () {
                setState(() {
                  _textDirection = _textDirection == TextDirection.ltr
                      ? TextDirection.rtl
                      : TextDirection.ltr;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.style),
              color: Colors.white,
              tooltip: "Custom style example",
              onPressed: () => Navigator.of(context).pushNamed('/custom'),
            ),
            IconButton(
              icon: Icon(Icons.radio_button_checked),
              color: Colors.white,
              tooltip: "convex button example",
              onPressed: () => Navigator.of(context).pushNamed('/fab'),
            )
          ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: _tabItems.value
                .map((i) => i.title == 'Home' || i.title == 'Happy'
                ? ListView(children: options)
                : Center(
                child: Text(
                  '${i.title} World',
                  style: TextStyle(fontSize: 30),
                )))
                .toList(growable: false)),
        bottomNavigationBar: _badge == null
            ? ConvexAppBar(
          items: _tabItems.value,
          style: _style.value,
          curve: _curve.value,
          backgroundColor: _barColor,
          gradient: _gradient,
          controller: _tabController,
          onTap: (int i) => debugPrint('select index=$i'),
        )
            : ConvexAppBar.badge(
          {3: _badge.text, 4: Icons.assistant_photo, 2: Colors.redAccent},
          badgePadding: _badge.padding,
          badgeColor: _badge.badgeColor,
          badgeBorderRadius: _badge.borderRadius,
          badgeMargin: EdgeInsets.only(bottom: 20, left: 30),
          items: _tabItems.value,
          style: _style.value,
          curve: _curve.value,
          backgroundColor: _barColor,
          gradient: _gradient,
          controller: _tabController,
          onTap: (int i) => debugPrint('select index=$i'),
        ),
      ),
    );
  }

  void _onTabItemTypeChanged(ChoiceValue<List<TabItem>> value) {
    setState(() {
      _tabItems = value;
    });
  }

  void _onStyleChanged(ChoiceValue<TabStyle> value) {
    setState(() {
      _style = value;
    });
  }

  void _onCurveChanged(ChoiceValue<Curve> value) {
    setState(() {
      _curve = value;
    });
  }

  void _onBarColorChanged(Color value) {
    setState(() {
      _barColor = value;
    });
  }

  void _onGradientChanged(Gradient value) {
    setState(() {
      _gradient = value;
    });
  }

  void _onBadgeChanged(Badge value) {
    setState(() {
      _badge = value;
    });
  }
}