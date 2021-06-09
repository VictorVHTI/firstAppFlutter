import 'dart:math';

import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final rnd = new Random();
  final List<Color> colors = [
    Colors.red,
    Colors.deepOrangeAccent,
    Colors.blueGrey,
    Colors.black,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.white70,
    Colors.pink,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        100,
        (index) => Container(
              width: double.infinity,
              height: 150,
              color: colors[rnd.nextInt(colors.length)],
            ));

    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: items.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return items[index];
    //     },
    //   ),
    // );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //floating: true,
            pinned: true,
            expandedHeight: 150,
            title: Text('Test'),
            flexibleSpace: Image.network(
              'https://cdn.domestika.org/c_limit,dpr_auto,f_auto,q_auto,w_820/v1496706927/content-items/001/973/143/matte_painting_carolyfotos.120ppp-original.jpg?1496706927',
              fit: BoxFit.cover,
            ),
          ),
          SliverList(delegate: new SliverChildListDelegate(items))
        ],
      ),
    );
  }
}
