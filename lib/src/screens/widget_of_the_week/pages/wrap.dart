import 'package:flutter/material.dart';

class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          //direction: Axis.vertical,
          spacing: 15.0,
          children: <Widget>[
            Tag('Metal Gear'),
            Tag('Overwatch'),
            Tag('CyberPunk'),
            Tag('Call of Duty'),
            Tag('Smartwatch'),
            Tag('Smash'),
            Tag('Nintendo'),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String title;

  const Tag(this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        child: Text(title[0]),
        backgroundColor: Colors.white,
      ),
      label: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
