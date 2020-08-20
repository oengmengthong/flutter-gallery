import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

//custom_navigation_bar: ^0.2.7
class SampleBottomNavigationBar34 extends StatefulWidget {
  @override
  _SampleBottomNavigationBar34State createState() =>
      _SampleBottomNavigationBar34State();
}

class _SampleBottomNavigationBar34State
    extends State<SampleBottomNavigationBar34> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample 34'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _buildOriginDesign(),
            _buildLightDesign(),
            _buildNoElevation(),
            _buildCustomIconDesign(),
            _buildBorderRadiusDesign(),
          ],
        ),
      ),
    );
  }

  Widget _buildOriginDesign() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Text('Dribbble'),
        SizedBox(
          height: 8.0,
        ),
        CustomNavigationBar(
          scaleFactor: 0.1,
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: Color(0xff6c788a),
          backgroundColor: Color(0xff040307),
          items: [
            CustomNavigationBarItem(
              icon: Icons.home,
            ),
            CustomNavigationBarItem(
              icon: Icons.shopping_cart,
            ),
            CustomNavigationBarItem(
              icon: Icons.lightbulb_outline,
            ),
            CustomNavigationBarItem(
              icon: Icons.search,
            ),
            CustomNavigationBarItem(
              icon: Icons.account_circle,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget _buildLightDesign() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Text('Light'),
        SizedBox(
          height: 8.0,
        ),
        CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Color(0xff040307),
          strokeColor: Color(0x30040307),
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: Icons.home,
            ),
            CustomNavigationBarItem(
              icon: Icons.shopping_cart,
            ),
            CustomNavigationBarItem(
              icon: Icons.lightbulb_outline,
            ),
            CustomNavigationBarItem(
              icon: Icons.search,
            ),
            CustomNavigationBarItem(
              icon: Icons.account_circle,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget _buildNoElevation() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Text('No elevation'),
        SizedBox(
          height: 8.0,
        ),
        CustomNavigationBar(
          elevation: 0.0,
          iconSize: 30.0,
          selectedColor: Color(0xff625aff),
          strokeColor: Color(0xff625aff),
          unSelectedColor: Colors.white,
          backgroundColor: Color(0xffa9a5f2),
          items: [
            CustomNavigationBarItem(
              icon: Icons.home,
            ),
            CustomNavigationBarItem(
              icon: Icons.shopping_cart,
            ),
            CustomNavigationBarItem(
              icon: Icons.lightbulb_outline,
            ),
            CustomNavigationBarItem(
              icon: Icons.search,
            ),
            CustomNavigationBarItem(
              icon: Icons.account_circle,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget _buildCustomIconDesign() {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0),
        Text('Custom Icon from Ant Design'),
        SizedBox(height: 8.0),
        CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Color(0xff0c18fb),
          strokeColor: Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: AntDesign.home,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.shoppingcart,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.cloudo,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.search1,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.user,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget _buildBorderRadiusDesign() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Text('Navigation Bar with border radius'),
        SizedBox(
          height: 8.0,
        ),
        CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Color(0xff0c18fb),
          strokeColor: Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.white,
          borderRadius: Radius.circular(20.0),
          items: [
            CustomNavigationBarItem(
              icon: AntDesign.home,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.shoppingcart,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.cloudo,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.search1,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.user,
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
