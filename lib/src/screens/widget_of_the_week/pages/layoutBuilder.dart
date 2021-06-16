import 'package:example_flutter/src/screens/widget_of_the_week/pages/expanded.dart';
import 'package:flutter/material.dart';

class MylayoutBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColumnsContainer(),
      ),
    );
  }
}

class ColumnsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = [Expanded(child: _Square()), Expanded(child: _Square())];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.maxWidth < 600)
            ? Column(children: children)
            : Row(children: children);
      },
    );
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
