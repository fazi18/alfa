import 'package:flutter/cupertino.dart';

void navigateTO(BuildContext context, screen) {
  Future.delayed(Duration.zero, () {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation, Widget child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInCirc);
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation) {
          return screen;
        },
      ),
    );
  });
}
