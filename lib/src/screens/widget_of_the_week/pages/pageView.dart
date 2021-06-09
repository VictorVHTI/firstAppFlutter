import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          child: PageView(
            controller: PageController(
              viewportFraction: 0.5,
              //initialPage: ,
            ),
            // scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: [
              _Page(Colors.red),
              _Page(Colors.blue),
              _Page(Colors.green),
              _Page(Colors.pink),
              _Page(Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final Color color;
  const _Page(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(left: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
    );
  }
}
