import 'dart:ui';

import 'package:flutter/material.dart';

class MyImageFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Image.network(
              'https://www.androiddeveloper.co.in/blog/wp-content/uploads/2019/12/How-Google-Flutter-Became-The-Best-SDK-for-Mobile-App-Development.png'),
        ),
        Positioned(
          top: 330,
          bottom: 350,
          left: 20,
          right: 20,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                  //color: Colors.red.withOpacity(0.4),
                  ),
            ),
          ),
        ),
        Center(
          child: Text(
            'No Blur',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    ));
  }
}
