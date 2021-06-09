import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  @override
  _MyFadeTransitionState createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    opacity = new Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FadeTransition(opacity: opacity, child: _Square())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_rounded),
        onPressed: () {
          controller.forward(from: 0.0);
        },
      ),
    );
  }
}

class _Square extends StatelessWidget {
  // final Color color;
  // final double opacity;

  // _Square(this.color, this.opacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
