import 'package:example_flutter/src/app.dart';
import 'package:example_flutter/src/screens/components/components_index.dart';
import 'package:example_flutter/src/screens/components/pages/alert_page.dart';
import 'package:example_flutter/src/screens/components/pages/animated_page.dart';
import 'package:example_flutter/src/screens/components/pages/avatar_page.dart';
import 'package:example_flutter/src/screens/components/pages/cards_page.dart';
import 'package:example_flutter/src/screens/components/pages/inputs.page.dart';
import 'package:example_flutter/src/screens/components/pages/list_page.dart';
import 'package:example_flutter/src/screens/components/pages/slider_page.dart';
import 'package:example_flutter/src/screens/counter/counter.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MyHomePage(title: 'Home'),
    '/counter': (BuildContext contex) => CounterPage(title: 'Counter'),
    '/components': (BuildContext contex) => ComponentsPage(title: 'Components'),
    '/components/alert': (BuildContext contex) => AlertPage(),
    '/components/avatar': (BuildContext contex) => AvatarPage(),
    '/components/card': (BuildContext contex) => CardsPage(),
    '/components/animated': (BuildContext contex) => AnimatedPage(),
    '/components/inputs': (BuildContext contex) => InputsPage(),
    '/components/slider': (BuildContext contex) => SliderPage(),
    '/components/list': (BuildContext contex) => ListPage(),
  };
}
