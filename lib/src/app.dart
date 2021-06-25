import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonNavigation('Counter', '/counter'),
            ButtonNavigation('Components', '/components'),
            ButtonNavigation('Widget of the week', '/widget'),
            ButtonNavigation('Coffee Concept List', '/coffee'),
            ButtonNavigation('Expandable NavBar', '/expandableNavbar'),
            ButtonNavigation('Books List', '/booksList'),
          ],
        ),
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  final String name;
  final String route;

  ButtonNavigation(this.name, this.route);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
