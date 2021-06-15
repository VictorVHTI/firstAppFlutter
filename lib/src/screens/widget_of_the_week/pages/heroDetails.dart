import 'package:flutter/material.dart';

class MyHeroDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hero Details')),
        body: Column(
          children: [
            Hero(
              tag: 'Widget_Hero',
              child: FlutterLogo(
                size: 450,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the.',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ));
  }
}
