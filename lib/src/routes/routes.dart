import 'package:example_flutter/src/app.dart';
import 'package:example_flutter/src/screens/books/index.dart';
import 'package:example_flutter/src/screens/coffee_concept/coffee_home.dart';
import 'package:example_flutter/src/screens/components/components_index.dart';
import 'package:example_flutter/src/screens/components/pages/alert_page.dart';
import 'package:example_flutter/src/screens/components/pages/animated_page.dart';
import 'package:example_flutter/src/screens/components/pages/avatar_page.dart';
import 'package:example_flutter/src/screens/components/pages/cards_page.dart';
import 'package:example_flutter/src/screens/components/pages/inputs.page.dart';
import 'package:example_flutter/src/screens/components/pages/list_page.dart';
import 'package:example_flutter/src/screens/components/pages/slider_page.dart';
import 'package:example_flutter/src/screens/counter/counter.dart';
import 'package:example_flutter/src/screens/expandable_navbar/index.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/absorbPointer.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/clipRRec.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/customePainter.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/expanded.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/fadeTransition.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/fitteBox.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/floatingAB.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/futureBuilder.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/hero.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/imageFilter.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/inherited.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/layoutBuilder.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/opacity.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/pageView.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/safeArea.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/silverList.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/sliverAppBar.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/streamBuilder.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/table.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/tooltip.dart';
import 'package:example_flutter/src/screens/widget_of_the_week/pages/transform.dart';
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
    '/widget/inherited': (BuildContext contex) => MyInherited(),
    '/widget/cliprrec': (BuildContext contex) => MyClipRRec(),
    '/widget/hero': (BuildContext contex) => MyHero(),
    '/widget/customPainter': (BuildContext contex) => MyCustomPainter(),
    '/widget/tooltip': (BuildContext contex) => MyTooltip(),
    '/widget/fitteBox': (BuildContext contex) => MyFitteBox(),
    '/widget/layoutBuilder': (BuildContext contex) => MylayoutBuilder(),
    '/widget/absorbPointer': (BuildContext contex) => MyAbsorbPointer(),
    '/widget/transform': (BuildContext contex) => MytTansform(),
    '/widget/imageFilter': (BuildContext contex) => MyImageFilter(),
    '/coffee': (BuildContext contex) => CoffeeHome(),
    '/expandableNavbar': (BuildContext contex) => ExpandableNavBar(),
    '/booksList': (BuildContext contex) => BooksConcept(),
  };
}
