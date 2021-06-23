import 'package:example_flutter/src/screens/coffee_concept/coffee.dart';
import 'package:example_flutter/src/screens/coffee_concept/index.dart';
import 'package:flutter/material.dart';

class CoffeeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 650),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                      opacity: animation, child: CoffeeIndex());
                }));
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0XFFA89276), Colors.white])),
              ),
            ),
            Positioned(
              height: _size.height * 0.6,
              left: 0,
              right: 0,
              //bottom: 0,
              top: _size.height * 0.15,
              child: Hero(
                tag: coffes[6].name,
                child: Image.asset(coffes[6].image),
              ),
            ),
            Positioned(
              height: _size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: coffes[7].name,
                child: Image.asset(
                  coffes[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: _size.height,
              left: 0,
              right: 0,
              bottom: -_size.height * 0.8,
              child: Hero(
                tag: coffes[8].name,
                child: Image.asset(
                  coffes[8].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: _size.height * 0.25,
              child: Image.asset('assets/coffee/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
