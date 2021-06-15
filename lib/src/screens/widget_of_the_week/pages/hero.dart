import 'package:example_flutter/src/screens/widget_of_the_week/pages/heroDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  void _pushRoute(BuildContext context) {
    Navigator.push(context,
        CupertinoPageRoute(builder: (BuildContext context) => MyHeroDetails()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Table(
        children: [
          TableRow(children: [
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150)
          ]),
          TableRow(children: [
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150)
          ]),
          TableRow(children: [
            GestureDetector(
              onTap: () => _pushRoute(context),
              child: Hero(
                tag: 'Widget_Hero',
                child: FlutterLogo(
                  size: 150,
                ),
              ),
            ),
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150)
          ]),
          TableRow(children: [
            Placeholder(fallbackHeight: 150),
            Placeholder(fallbackHeight: 150),
            Container()
          ])
        ],
      ),
    ));
  }
}
