import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.ease);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
        );
}
