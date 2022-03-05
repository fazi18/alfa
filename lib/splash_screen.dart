import 'package:alpha/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 250.0,
      splash: 'assets/intro.jpeg',
      nextScreen: const StartScreen(),
      splashTransition: SplashTransition.rotationTransition,
      duration: 400,
      centered: true,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.black,
    );
  }
}
