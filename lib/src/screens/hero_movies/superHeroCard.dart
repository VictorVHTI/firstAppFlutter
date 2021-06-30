import 'dart:ui';

import 'package:example_flutter/src/screens/hero_movies/superhero.dart';
import 'package:flutter/material.dart';

class SuperHeroCard extends StatelessWidget {
  final Superhero superhero;
  final double factorChange;
  const SuperHeroCard({
    Key? key,
    required this.superhero,
    required this.factorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sepation = size.height * 0.24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            top: sepation,
            child: Hero(
              tag: superhero.heroName + 'background',
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(superhero.rawColor),
                      borderRadius: BorderRadius.circular(40))),
            ),
          ),
          Positioned(
              left: 20,
              right: 20,
              top: sepation * factorChange,
              bottom: size.height * 0.35,
              child: Opacity(
                  opacity: 1 - factorChange,
                  child: Transform.scale(
                      scale: lerpDouble(1, .4, factorChange) ?? 0,
                      child: Hero(
                          tag: superhero.pathImage,
                          child: Image.asset(superhero.pathImage))))),
          Positioned(
              left: 40,
              right: 100,
              top: size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: superhero.heroName,
                    child: Text(
                      superhero.heroName.toLowerCase(),
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Hero(
                    tag: superhero.name,
                    child: Text(
                      superhero.name.toLowerCase(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -1.0,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(
                    text: 'learn more',
                    children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.arrow_right_alt_outlined,
                            color: Colors.amber,
                          ))
                    ],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -1.0,
                        color: Colors.amber),
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
