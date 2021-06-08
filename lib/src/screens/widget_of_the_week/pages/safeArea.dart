import 'package:flutter/material.dart';

class MySafeArea extends StatelessWidget {

  final TextStyle styleTxt = TextStyle( fontSize: 25 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: List.generate(50, (i) => Text(
            '$i - Hola Mundo',
            style: styleTxt,
            )),
        ),
      ),
    );
  }
}