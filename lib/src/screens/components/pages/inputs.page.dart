import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key = const Key("key_input")}) : super(key: key);
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Inputs')),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          children: <Widget>[
            _createInput(),
            Devider(),
            _createPerson(),
          ],
        )
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('${_name.length} Letters'),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Only name',
        suffixIcon: Icon(Icons.person),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (name) {
        setState(() {
          _name = name;
        });
      }
    );
  }

  Widget _createPerson() {
    return ListTitle(
      title: Text('The name is: $_name')
    );
  }
}