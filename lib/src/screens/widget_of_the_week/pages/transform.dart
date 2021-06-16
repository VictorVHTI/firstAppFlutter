import 'package:flutter/material.dart';

class MytTansform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Square(),
      ),
    );
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(color: Colors.blue),
      child: Icon(
        Icons.menu,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
