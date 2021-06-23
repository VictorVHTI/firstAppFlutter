import 'package:example_flutter/src/screens/coffee_concept/coffee.dart';
import 'package:example_flutter/src/screens/coffee_concept/coffee_details.dart';
import 'package:flutter/material.dart';

const _duration = Duration(microseconds: 300);
const _initialPage = 8.0;

class CoffeeIndex extends StatefulWidget {
  @override
  _CoffeeIndexState createState() => _CoffeeIndexState();
}

class _CoffeeIndexState extends State<CoffeeIndex> {
  final _pageCoffeController =
      PageController(viewportFraction: 0.35, initialPage: _initialPage.toInt());

  final _pageTextController = PageController(initialPage: _initialPage.toInt());
  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _coffeScrollListener() {
    setState(() {
      _currentPage = _pageCoffeController.page!;
    });
  }

  void _textScrollListener() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    _pageCoffeController.addListener(_coffeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeController.removeListener(_coffeScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pageCoffeController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.brown,
          ),
        ),
        body: Stack(
          children: [
            Positioned(
                left: 20,
                right: 20,
                bottom: -size.height * 0.22,
                height: size.height * 0.3,
                child: DecoratedBox(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      blurRadius: 90,
                      offset: Offset.zero,
                      spreadRadius: 45,
                    )
                  ]),
                )),
            Transform.scale(
              scale: 1.7,
              alignment: Alignment.bottomCenter,
              child: PageView.builder(
                  controller: _pageCoffeController,
                  itemCount: coffes.length,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    if (value < coffes.length) {
                      _pageTextController.animateToPage(value,
                          duration: _duration, curve: Curves.easeOut);
                    }
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox.shrink();
                    }

                    final coffee = coffes[index - 1];
                    final result = _currentPage - index + 1;
                    final value = -0.4 * result + 1;
                    final opacity = value.clamp(0.0, 1.0);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 650),
                            pageBuilder: (context, animation, _) {
                              return FadeTransition(
                                  opacity: animation,
                                  child: CoffeeDetails(coffee: coffee));
                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..translate(
                                  0.0, size.height / 2.4 * (1 - value).abs())
                              ..scale(value),
                            child: Opacity(
                                opacity: opacity,
                                child: Hero(
                                  tag: coffee.name,
                                  child: Image.asset(
                                    coffee.image,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ))),
                      ),
                    );
                  }),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 100,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0.0, -100 * value),
                      child: child,
                    );
                  },
                  duration: Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      Expanded(
                          child: PageView.builder(
                              itemCount: coffes.length,
                              controller: _pageTextController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (contex, index) {
                                final opacity = (1 - (index - _textPage).abs())
                                    .clamp(0.0, 1.0);
                                return Opacity(
                                    opacity: opacity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.2),
                                      child: Hero(
                                        tag: "text_${coffes[index].name}",
                                        child: Material(
                                          child: Text(
                                            coffes[index].name,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              })),
                      const SizedBox(
                        height: 12,
                      ),
                      AnimatedSwitcher(
                        duration: _duration,
                        child: Text(
                          '\$${coffes[_currentPage.toInt()].price.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                          key: Key(coffes[_currentPage.toInt()].name),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
