import 'dart:math';

import 'package:example_flutter/src/screens/hero_movies/superHeroCard.dart';
import 'package:example_flutter/src/screens/hero_movies/superHeroDetailsPage.dart';
import 'package:example_flutter/src/screens/hero_movies/superhero.dart';
import 'package:flutter/material.dart';

class SuperHeroMovies extends StatefulWidget {
  @override
  _SuperHeroMoviesState createState() => _SuperHeroMoviesState();
}

class _SuperHeroMoviesState extends State<SuperHeroMovies> {
  late PageController _pageController;
  late int _index;
  late int _auxIndex;
  late double _percent;
  late double _auxPercent;
  bool _isScrolling = false;

  void _pagelListener() {
    _index = _pageController.page!.floor();
    _auxIndex = _index + 1;
    _percent = (_pageController.page! - _index).abs();
    _auxPercent = 1.0 - _percent;
    _isScrolling = (_pageController.page! % 1) != 0;
    setState(() {});
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _index = 0;
    _auxIndex = _index + 1;
    _percent = 0.0;
    _auxPercent = 1.0 - _percent;
    _pageController.addListener(_pagelListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pagelListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heroes = Superhero.marvelHeroes;
    final angleRotate = (pi * 0.5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Movies',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: kThemeAnimationDuration,
            top: 0,
            bottom: 0,
            right: _isScrolling ? 10 : 0,
            left: _isScrolling ? 10 : 0,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, 50 * _auxPercent),
                  child: SuperHeroCard(
                    superhero: heroes[_auxIndex.clamp(0, heroes.length - 1)],
                    factorChange: _auxPercent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-800 * _percent, 100 * _percent),
                  child: Transform.rotate(
                    angle: angleRotate * _percent,
                    child: SuperHeroCard(
                      superhero: heroes[_index],
                      factorChange: _percent,
                    ),
                  ),
                )
              ],
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: heroes.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () => _openDetails(context, heroes[index]),
                  child: const SizedBox());
            },
          )
        ],
      ),
    );
  }

  _openDetails(BuildContext context, Superhero superhero) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: SuperHeroDetailsPage(
          superhero: superhero,
        ),
      );
    }));
  }
}
