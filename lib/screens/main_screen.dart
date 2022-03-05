import 'package:alpha/const/colors.dart';
import 'package:alpha/screens/fav_screen.dart';
import 'package:alpha/screens/product/product_screen.dart';
import 'package:alpha/screens/search_screen.dart';
import 'package:alpha/screens/shopping_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.dController}) : super(key: key);
  final dController;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _screens = [
    ProductScreen(),
    SearchScreen(),
    FavScreen(),
    ShoppingScreen(),
  ];
  // bool isLike = false;
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_page),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            _buildNormalText(title: 'Oman, Muscat'),
            const Icon(Icons.arrow_drop_down, color: Colors.black54),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        leading: InkWell(
          onTap: () => setState(() {
            widget.dController.toggle();
          }),
          child: const Icon(
            Icons.sort_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: textColor,
        backgroundColor: bgColor,
        onTap: (value) => setState(() {
          _page = value;
        }),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 30),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black, size: 30),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeColor: Colors.black,
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              position: BadgePosition.topEnd(top: -2, end: -2),
              animationDuration: const Duration(milliseconds: 250),
              animationType: BadgeAnimationType.scale,
              badgeContent: const Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {}),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  _buildNormalText(
          {String title = '', int fontSize = 12, bool isBold = false}) =>
      Text(
        title,
        maxLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize.sp,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      );
}
