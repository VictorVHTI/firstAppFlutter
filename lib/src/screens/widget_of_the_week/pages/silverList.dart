import 'dart:math';

import 'package:flutter/material.dart';

class MySilverList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(20, (i) => _Square(i));
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Sliver Grid'),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: items
            ),
            SliverAppBar(
              pinned: true,
              title: Text('Sliver List'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((contex, i) {
                return items[i];
              },
              childCount: items.length
              ),
            )
          ],
        )
    );
  }
}

class _Square extends StatelessWidget {
  final int index;
  const _Square(this.index);

  @override
  Widget build(BuildContext context) {

    final rnd = new Random();
    final r = rnd.nextInt(255);
    final g = rnd.nextInt(255);
    final b = rnd.nextInt(255);

    return Container(
      child: Center(child: Text('$index', style: TextStyle(color: Colors.white),),),
      width: 150,
      height: 150,
      color: Color.fromRGBO(r, g, b, 1),
    );
  }
}