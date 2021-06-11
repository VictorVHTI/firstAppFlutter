import 'package:flutter/material.dart';

class MyClipRRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                child: Image(
                  image: NetworkImage(
                      'https://www.concettolabs.com/blog/wp-content/uploads/2019/07/flutter-desktop-app.jpg'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipPath(
                clipper: CustomeCliper(),
                child: Image(
                  image: NetworkImage(
                      'https://www.concettolabs.com/blog/wp-content/uploads/2019/07/flutter-desktop-app.jpg'),
                ),
              ),
            ],
          )),
    );
  }
}

class CustomeCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.3);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
