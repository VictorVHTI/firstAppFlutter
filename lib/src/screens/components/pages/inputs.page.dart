import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key = const Key("key_input")}) : super(key: key);
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  String _optSelected = 'Fly';
  TextEditingController _inputDateController = TextEditingController();
  List<String> _powersList = ['Fly', 'Rayos X', 'Fuerza'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('Inputs')),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            children: <Widget>[
              _createInput(),
              Divider(),
              _createEmail(),
              Divider(),
              _createPassword(),
              Divider(),
              _createDate(context),
              Divider(),
              _createDropdown(),
              Divider(),
              _createPerson(),
            ],
          )),
    );
  }

  Widget _createInput() {
    return TextField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('${_name.length} Letters'),
            hintText: 'Name',
            labelText: 'Name',
            helperText: 'Only name',
            suffixIcon: Icon(Icons.person),
            icon: Icon(Icons.account_circle)),
        onChanged: (name) {
          setState(() {
            _name = name;
          });
        });
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('The name is: $_name'),
      subtitle: Text('The email is: $_email'),
      trailing: Text(_optSelected),
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (data) {
          setState(() {
            _email = data;
          });
        });
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)),
        onChanged: (data) {});
  }

  Widget _createDate(BuildContext context) {
    return TextField(
        controller: _inputDateController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Date',
            labelText: 'Date',
            suffixIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _powersList.forEach((p) {
      list.add(DropdownMenuItem(
        child: Text(p),
        value: p,
      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(
        width: 30.0,
      ),
      Expanded(
        child: DropdownButton(
          value: _optSelected,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            _optSelected = opt.toString();
          },
        ),
      )
    ]);
  }
}
