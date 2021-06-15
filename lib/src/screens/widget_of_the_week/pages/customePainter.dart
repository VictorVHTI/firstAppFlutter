import 'package:flutter/material.dart';

class MyCustomPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 260,
          width: 260,
          //color: Colors.black12,
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = new Path();

    // path.lineTo(size.width * 0.5, 0);
    // path.lineTo(size.width * 0.5, size.height * 0.5);
    // path.lineTo(0, size.height * 0.5);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, size.height * 0.5);

    path.moveTo(size.width * 0.3333, 0);
    path.lineTo(size.width * 0.3333, size.height);

    path.moveTo(size.width * 0.6666, 0);
    path.lineTo(size.width * 0.6666, size.height);

    path.moveTo(0, size.height * 0.3333);
    path.lineTo(size.width, size.height * 0.3333);

    path.moveTo(0, size.height * 0.6666);
    path.lineTo(size.width, size.height * 0.6666);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
