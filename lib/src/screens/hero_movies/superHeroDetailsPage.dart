import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_flutter/src/screens/hero_movies/superhero.dart';
import 'package:flutter/material.dart';

class SuperHeroDetailsPage extends StatefulWidget {
  final Superhero superhero;
  const SuperHeroDetailsPage({
    Key? key,
    required this.superhero,
  }) : super(key: key);

  @override
  _SuperHeroDetailsPageState createState() => _SuperHeroDetailsPageState();
}

class _SuperHeroDetailsPageState extends State<SuperHeroDetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _colorGradientValue;
  late Animation<double> _whiteGradientValue;
  late bool _changeToBlack;
  late bool _enableInfoItems;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _colorGradientValue = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));
    _whiteGradientValue = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 1.0, curve: Curves.fastOutSlowIn)));

    _changeToBlack = false;
    _enableInfoItems = false;
    Future.delayed(const Duration(microseconds: 600), () {
      _controller.forward();
      Future.delayed(const Duration(microseconds: 300), () {
        setState(() {
          _changeToBlack = true;
        });
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _enableInfoItems = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(widget.superhero.movies);
    return Material(
      child: Stack(
        children: [
          // Animated background
          Positioned.fill(
              child: Hero(
            tag: widget.superhero.heroName + 'background',
            child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(widget.superhero.rawColor),
                              Colors.white
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              _colorGradientValue.value,
                              _whiteGradientValue.value
                            ])),
                  );
                }),
          )),
          // Items - body
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                    child: Hero(
                  tag: widget.superhero.pathImage,
                  child: Image.asset(
                    widget.superhero.pathImage,
                    height: size.height * 0.5,
                    width: size.width,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        heightFactor: 0.7,
                        alignment: Alignment.bottomLeft,
                        child: Hero(
                          tag: widget.superhero.heroName,
                          child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              child: Text(
                                widget.superhero.heroName.toLowerCase(),
                              ),
                              style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.w600,
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: widget.superhero.name,
                            child: AnimatedDefaultTextStyle(
                              duration: kThemeAnimationDuration,
                              child: Text(
                                widget.superhero.name.toLowerCase(),
                              ),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -1.0,
                                  color: _changeToBlack
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            tween: Tween(
                                begin: 0.0, end: _enableInfoItems ? 1.0 : 0.0),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/heroes/marvel_logo.jpg',
                              height: 35,
                              width: 100,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 30,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                            0, !_enableInfoItems ? 50 : 0, 0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _enableInfoItems ? 1 : 0,
                          child: Text(
                            widget.superhero.description,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[500],
                              height: 1.3,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 30,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.elasticOut,
                        transform: Matrix4.translationValues(
                            0, !_enableInfoItems ? 50 : 0, 0),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _enableInfoItems ? 1 : 0,
                          child: Text(
                            'movies',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                letterSpacing: -1.0,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.superhero.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = widget.superhero.movies[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TweenAnimationBuilder(
                          duration:
                              Duration(milliseconds: 1000 + (300 * index)),
                          curve: Curves.elasticOut,
                          tween: Tween(
                              begin: 0.0, end: _enableInfoItems ? 0.0 : 1.0),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Transform.translate(
                              offset: Offset(0, 50 * value),
                              child: Opacity(
                                  opacity: 1 - value.clamp(0.0, 1.0),
                                  child: child),
                            );
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                  imageUrl: movie.urlImage,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error))),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // Back button
          Positioned(
              left: 20,
              top: 0,
              child: SafeArea(
                child: IconButton(
                    onPressed: () async {
                      setState(() {
                        _enableInfoItems = false;
                      });
                      Future.delayed(const Duration(microseconds: 600), () {
                        setState(() {
                          _changeToBlack = false;
                        });
                      });
                      await _controller.reverse();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ))
        ],
      ),
    );
  }
}
