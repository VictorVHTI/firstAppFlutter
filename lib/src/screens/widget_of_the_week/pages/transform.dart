import 'package:flutter/material.dart';

class MytTansform extends StatefulWidget {
  @override
  _MytTansformState createState() => _MytTansformState();
}

class _MytTansformState extends State<MytTansform>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> translateAnimation;
  @override
  void initState() {
    animationController =
        new AnimationController(duration: Duration(seconds: 1), vsync: this);
    scaleAnimation =
        Tween<double>(begin: 1, end: 2).animate(animationController);
    translateAnimation = Tween<double>(begin: 0, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, _) {
              return Transform.scale(
                  scale: scaleAnimation.value,
                  child: Transform.translate(
                      offset: (Offset(translateAnimation.value, 0)),
                      child: Transform(
                          transform: Matrix4.skewX(0), child: _Square())));
            }),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                animationController.reset();
              },
              child: Icon(Icons.restore),
            ),
            FloatingActionButton(
              onPressed: () {
                animationController.forward();
              },
              child: Icon(Icons.play_arrow_outlined),
            )
          ],
        )
      ],
    ));
  }
}

class _Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(color: Colors.blue),
      child: Icon(
        Icons.menu,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
