import 'package:flutter/material.dart';

class MyOpacity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpacityPage();
  }
}

class OpacityPage extends StatefulWidget {
  const OpacityPage({
    Key? key,
  }) : super(key: key);

  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: Wrap(
              direction: Axis.vertical,
              spacing: 25,
              children: [
                _Square(Color(0xff00E057), 1),
                _Square(Color(0xff00BFF4), opacity),
                _Square(Color(0xffFEBF2F), 1),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = opacity == 1 ? 0 : 1;
          });
        },
        child: Icon(Icons.opacity),
      ),
    );
  }
}

class _Square extends StatelessWidget {
  final Color color;
  final double opacity;

  _Square(this.color, this.opacity);

  @override
  Widget build(BuildContext context) {
    //return Opacity(
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeOut,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
