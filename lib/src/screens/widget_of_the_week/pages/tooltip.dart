import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Tooltip(
          message: 'This is a Button',
          showDuration: Duration(microseconds: 1000),
          preferBelow: false,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              'Hola mundo',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
