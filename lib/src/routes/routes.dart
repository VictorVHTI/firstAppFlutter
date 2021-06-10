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
import 'package:example_flutter/src/screens/widget_of_the_week/pages/expanded.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/fadeTransition.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/floatingAB.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/futureBuilder.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/opacity.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/pageView.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/safeArea.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/silverList.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/sliverAppBar.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/streamBuilder.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/table.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/wrap.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/widgets_index.dart';
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
    '/widget': (BuildContext contex) =>
        WidgetOfTheWeekPage(title: "Widget of the week"),
    '/widget/safeArea': (BuildContext contex) => MySafeArea(),
    '/widget/expanded': (BuildContext contex) => MyExpanded(),
    '/widget/wrap': (BuildContext contex) => MyWrap(),
    '/widget/animatedContainer': (BuildContext contex) => AnimatedPage(),
    '/widget/animatedOpacity': (BuildContext contex) => MyOpacity(),
    '/widget/futureBulider': (BuildContext contex) => MyFutureBuilder(),
    '/widget/fadeTransition': (BuildContext contex) => MyFadeTransition(),
    '/widget/floationAB': (BuildContext contex) => MyFloatingActionButton(),
    '/widget/pageView': (BuildContext contex) => MyPageView(),
    '/widget/table': (BuildContext contex) => MyTable(),
    '/widget/silverAppBar': (BuildContext contex) => MySliverAppBar(),
    '/widget/silverList': (BuildContext contex) => MySilverList(),
    '/widget/fadeInImage': (BuildContext contex) => ListPage(),
    '/widget/streamBuilder': (BuildContext contex) => MyStreamBuilder(),
    
    
  };
}
