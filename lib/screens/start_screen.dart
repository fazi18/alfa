import 'package:alpha/const/navigator.dart';
import 'package:alpha/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWelcomText(),
          _buildIntroImage(),
          _buildStartButton(),
        ],
      ),
    );
  }

  _buildIntroImage() => Container(
        height: 180.h,
        width: 180.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/intro.jpeg'),
          ),
        ),
      );

  _buildStartButton() {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 35.h,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: const Center(
            child: Text(
              'Get started',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        onTap: () {
          navigateTO(context, const LoginScreen());
        });
  }

  _buildWelcomText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Text(
          'Boost Your Style Sense',
          style: TextStyle(
              color: Colors.white, fontSize: 32.sp, fontFamily: 'Gotham'),
        ),
      );
}
