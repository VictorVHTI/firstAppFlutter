import 'package:example_flutter/src/models/my_colors.dart';
import 'package:flutter/material.dart';

class MyInherited extends StatefulWidget {

  @override
  _MyInheritedState createState() => _MyInheritedState();
}

class _MyInheritedState extends State<MyInherited> {

  Color color1 = Colors.redAccent;
  Color color2 = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return MyColorsInherited(
      color1: color1,
      color2: color2,
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Rectangle01(),
            _Rectangle02()
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            color1 = (color1 == Colors.redAccent) ? Colors.blue : Colors.redAccent;
            color2 = (color2 == Colors.yellow) ? Colors.green : Colors.yellow;
          });
        },
        child: Icon(Icons.play_arrow)
        ),
    ),
    );
  }
}

class _Rectangle01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myColors = context.dependOnInheritedWidgetOfExactType<MyColorsInherited>();
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: myColors!.color1),
    );
  }
}

class _Rectangle02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myColors = context.dependOnInheritedWidgetOfExactType<MyColorsInherited>();
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: myColors!.color2),
    );
  }
}
