import 'package:flutter/material.dart';

class MyClipRRec extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Image(
              image: NetworkImage('https://www.concettolabs.com/blog/wp-content/uploads/2019/07/flutter-desktop-app.jpg'),
            ),
      ),
    );
  }
}