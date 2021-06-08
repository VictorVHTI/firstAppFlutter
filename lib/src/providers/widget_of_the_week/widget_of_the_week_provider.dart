
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _WidgetOfTheWeekProvider {
  List<dynamic> _widged = [];

  _WidgetOfTheWeekProvider() {
    // loadData();
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/widgetOfTheWeek.json');
    Map dataMap = json.decode(response);
    _widged = dataMap['widget'];

    return _widged;
  }
}

final widgetOfTheWeekProvider = _WidgetOfTheWeekProvider();