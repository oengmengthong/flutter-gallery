import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallerywidget/template/viewSourceCode.dart';
import 'package:gallerywidget/values/style.dart';

class FurnitureAppScreen extends StatefulWidget {
  @override
  _FurnitureAppScreenState createState() => _FurnitureAppScreenState();
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(
      count, (i) => new IntSize((rnd.nextInt(300) + 100), rnd.nextInt(400) + 100));
}

class _FurnitureAppScreenState extends State<FurnitureAppScreen> {
  final SlideBarFurniture slideBarFurniture = SlideBarFurniture();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  _FurnitureAppScreenState() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 1000;
  final List<IntSize> _sizes;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.33;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          ViewScourceCodeScreen(source: 'lib/template/furnitureapp.dart'))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.code, color: Colors.blueAccent),
                  Text('Code', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
          FlatButton(
              onPressed: () => launchURL(
                  'https://dribbble.com/shots/13919175-Furniture-app/attachments/5528865?mode=media'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link, color: Colors.blueAccent),
                  Text('Source UI', style: TextStyle(color: Colors.blueAccent))
                ],
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.sort, color: Colors.teal), onPressed: () {}),
              Spacer(),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.teal),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.teal),
                onPressed: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Hi Nevil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.slidersH, color: Colors.teal),
                onPressed: () {},
              )
            ],
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 0),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : categoryHeight,
                child: slideBarFurniture),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              primary: false,
              padding: EdgeInsets.all(8.0),
              controller: controller,
              crossAxisCount: 4,
              physics: BouncingScrollPhysics(),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
              staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
            ),
          )
        ],
      ),
    );
  }
}

class SlideBarFurniture extends StatefulWidget {
  @override
  _SlideBarFurnitureState createState() => _SlideBarFurnitureState();
}

class _SlideBarFurnitureState extends State<SlideBarFurniture> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final double categoryHeight = double.infinity;

    List<Widget> _listSlide = [
      Container(
        height: categoryHeight,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mocka.com.au/media/catalog/category/resized/321_214.5_Living.jpg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Upto 50% off',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text('Living Room'),
            Spacer(),
            FlatButton(
              color: Colors.teal,
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      Container(
        height: categoryHeight,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mocka.com.au/media/catalog/category/resized/321_214.5_Living.jpg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Upto 50% off',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text('Living Room'),
            Spacer(),
            FlatButton(
              color: Colors.teal,
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      Container(
        height: categoryHeight,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.mocka.com.au/media/catalog/category/resized/321_214.5_Living.jpg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Upto 50% off',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text('Living Room'),
            Spacer(),
            FlatButton(
              color: Colors.teal,
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ];

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: _listSlide.map((item) => item).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _listSlide.map((url) {
              int index = _listSlide.indexOf(url);
              return FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Container(
                  width: 16.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _current == index ? Colors.teal : Colors.grey.withOpacity(0.3),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        fit: BoxFit.fitWidth,
        image: 'https://picsum.photos/${size.width}/${size.height}/',
      ),
    );
  }
}
