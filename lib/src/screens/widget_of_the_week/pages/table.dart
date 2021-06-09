import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      //defaultColumnWidth: FixedColumnWidth(100),
      columnWidths: {
        //0: FractionColumnWidth(0.5),
      },
      border: TableBorder.all(),
      children: [
        TableRow(
            children: [_RectanlgeLarge(), _RectanMedium(), _RectanSmall()]),
        TableRow(children: [
          _RectanSmall(),
          _RectanlgeLarge(),
          _RectanMedium(),
        ]),
        TableRow(children: [_RectanMedium(), _RectanlgeLarge(), _RectanSmall()])
      ],
    )));
  }
}

class _RectanlgeLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 200,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class _RectanMedium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 150,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.teal),
    );
  }
}

class _RectanSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 100,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.yellow),
    );
  }
}
