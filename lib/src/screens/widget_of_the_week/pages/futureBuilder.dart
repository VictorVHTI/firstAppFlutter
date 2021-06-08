import 'package:animate_do/animate_do.dart';
import 'package:example_flutter/src/models/reqres_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilderPage();
  }
}

Future<ReqResResponse> _getUsers() async {
  final Uri uri = Uri.parse('https://reqres.in/api/users');
  final resp = await http.get(uri);
  return reqResResponseFromJson(resp.body);
}

class FutureBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getUsers(),
          //initialData: [],
          builder:
              (BuildContext context, AsyncSnapshot<ReqResResponse> snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return _UsersList(snapshot.data!.data);
            }
          }),
    );
  }
}

class _UsersList extends StatelessWidget {
  final List<Usuario> users;

  _UsersList(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return FadeInLeft(
            delay: Duration(milliseconds: 100 * index),
            child: ListTile(
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text(user.email),
              trailing: Image.network(user.avatar),
            ),
          );
        });
  }
}
