import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          children: [
            Square(Colors.red),
            Expanded(child: Square(Colors.green)),
            Expanded(
              child: Square(Colors.green),
              flex: 2,
            ),
            Square(Colors.red),
          ],
        ),
      )),
    );
  }
}

class Square extends StatelessWidget {
  final Color color;

  Square(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(color: color),
    );
  }
}
