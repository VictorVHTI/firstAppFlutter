import 'package:flutter/material.dart';

class MyColorsInherited extends InheritedWidget {
  MyColorsInherited({
    Key? key,
    required this.child,
    required this.color1, 
    required this.color2,
    }) : super(key: key, child: child);

  final Widget child;
  final Color color1;
  final Color color2;

  static MyColorsInherited of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MyColorsInherited>()as MyColorsInherited);
  }

  @override
  bool updateShouldNotify( MyColorsInherited oldWidget) {
    return color1 != oldWidget.color1 || color2 != oldWidget.color2 ;
  }
}