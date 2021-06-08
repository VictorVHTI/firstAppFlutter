import 'package:example_flutter/src/providers/widget_of_the_week/widget_of_the_week_provider.dart';
import 'package:flutter/material.dart';

class WidgetOfTheWeekPage extends StatefulWidget {
  WidgetOfTheWeekPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WidgetOfTheWeekPage createState() => _WidgetOfTheWeekPage();
}

class _WidgetOfTheWeekPage extends State<WidgetOfTheWeekPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _listWidgets()
    );
  }
      
  Widget _listWidgets() {

    return FutureBuilder(
      future: widgetOfTheWeekProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems( List<dynamic>? data, BuildContext context ) {
    final List<Widget> _widgets = [];
      if (data != null) {
      data.forEach((widgetItem) {
        final widgetTemp = ListTile(
          title: Text(widgetItem['title']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
          onTap: () {
            String route = widgetItem['route'];
            Navigator.of(context).pushNamed("/widget/$route");
          },
        );

        _widgets..add(widgetTemp)
                ..add(Divider());
      });
    }
    return _widgets;
  }
}