import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _listInt = [];
  int _lastItem = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _addMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_addMore();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List view'),),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      )
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

  Widget _createLoading() {
    //return _isLoading ? CircularProgressIndicator() : Container();
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 180.0,)
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  void _addMore() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listInt.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse () {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(microseconds: 150)
    );
    _addMore();
  }
}