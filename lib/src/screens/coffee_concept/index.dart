import 'dart:ffi';

import 'package:example_flutter/src/screens/coffee_concept/coffe.dart';
import 'package:flutter/material.dart';

const _duration = Duration(microseconds: 300);

class CoffeeIndex extends StatefulWidget {

  @override
  _CoffeeIndexState createState() => _CoffeeIndexState();
}

class _CoffeeIndexState extends State<CoffeeIndex> {

  final _pageCoffeController = PageController(
    viewportFraction: 0.35,
  );
  double _currentPage = 0.0;

  void _coffeScrollListener() {
    setState(() {
      _currentPage = _pageCoffeController.page!;
    });
  }

  @override
  void initState() { 
    _pageCoffeController.addListener(_coffeScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeController.removeListener(_coffeScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * 0.22,
            height: size.height * 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown,
                    blurRadius: 90,
                    offset: Offset.zero,
                    spreadRadius: 45,
                  )
                ]
              ),
            )
          ),
          Transform.scale(
            scale: 1.7,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _pageCoffeController,
              itemCount: coffes.length + 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }

                final coffee = coffes[index - 1];
                final result = _currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(
                        0.0,
                        size.height / 2.6 * (1 - value).abs()
                      )
                      ..scale(value),
                    child: Opacity(
                      opacity: opacity,
                      child: Image.asset(coffee.image, fit: BoxFit.fitHeight,)
                    )
                  ),
                );
              }),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 100,
            child: Column(children: [
              AnimatedSwitcher(
                duration: _duration,
                child: Text('\$${coffes[_currentPage.toInt()].price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 30),
                  key: Key(coffes[_currentPage.toInt()].name),
                ),
              )
            ],)
          ),
        ],
      )
    );
  }
}