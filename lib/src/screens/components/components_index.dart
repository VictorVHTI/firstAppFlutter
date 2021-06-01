import 'package:example_flutter/src/providers/components/menu_provider.dart';
import 'package:example_flutter/src/utilities/icons_string.dart';
import 'package:flutter/material.dart';

class ComponentsPage extends StatefulWidget {
  ComponentsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ComponentsPage createState() => _ComponentsPage();
}

class _ComponentsPage extends State<ComponentsPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _listMenu()
    );
  }
      
  Widget _listMenu() {

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems( List<dynamic>? data, BuildContext context ) {
    final List<Widget> options = [];
      if (data != null) {
      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon'], Colors.blue),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
          onTap: () {
            String route = opt['ruta'];
            Navigator.of(context).pushNamed("/components/$route");
          },
        );

        options..add(widgetTemp)
                ..add(Divider());
      });
    }
    return options;
  }
}