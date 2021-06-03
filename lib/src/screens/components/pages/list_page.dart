import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _listInt = [];
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _addMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List view'),),
      body: _createList()
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listInt.length,
      itemBuilder: (BuildContext context, int index) {

        final image = _listInt[index];
        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
        );
      },
    );
  }

  void _addMore() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listInt.add(_lastItem);
    }
    setState(() {});
  }
}