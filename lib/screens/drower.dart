import 'package:alpha/screens/main_screen.dart';
import 'package:alpha/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FlutterZoomDrawerDemo extends StatefulWidget {
  @override
  _FlutterZoomDrawerDemoState createState() => _FlutterZoomDrawerDemoState();
}

class _FlutterZoomDrawerDemoState extends State<FlutterZoomDrawerDemo> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        mainScreen: MainScreen(
          dController: _drawerController,
        ),
        menuScreen: MenuWidget(),
        borderRadius: 30,
        angle: -10,
        showShadow: false,
        slideWidth: MediaQuery.of(context).size.width * .32,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        backgroundColor: Colors.black,
      ),
    );
  }
}
