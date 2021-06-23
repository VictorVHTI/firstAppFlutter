import 'dart:ui';

import 'package:flutter/material.dart';

const _cardColor = Color(0xFF5F40FB);
const _maxHeight = 350.0;
const _minHeight = 70.0;

class ExpandableNavBar extends StatefulWidget {
  @override
  _ExpandableNavBarState createState() => _ExpandableNavBarState();
}

class _ExpandableNavBarState extends State<ExpandableNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _expanded = false;
  double _currentHeight = _minHeight;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _menuWidth = _size.width * 0.5;
    return Scaffold(
      body: Stack(children: [
        ListView.builder(
          padding: const EdgeInsets.only(bottom: _minHeight),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.primaries[index % Colors.primaries.length]),
              ),
            );
          },
        ),
        GestureDetector(
          onVerticalDragUpdate: _expanded
              ? (details) {
                  setState(() {
                    final newHeight = _currentHeight - details.delta.dy;
                    _controller.value = _currentHeight / _maxHeight;
                    _currentHeight = newHeight.clamp(_minHeight, _maxHeight);
                  });
                }
              : null,
          onVerticalDragEnd: _expanded
              ? (details) {
                  if (_currentHeight < _maxHeight / 1.5) {
                    _controller.reverse();
                    _expanded = false;
                  } else {
                    _expanded = true;
                    _controller.forward(from: _currentHeight / _maxHeight);
                    _currentHeight = _maxHeight;
                  }
                }
              : null,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, snapshot) {
              final value = ElasticInOutCurve(0.8).transform(_controller.value);
              return Stack(
                children: [
                  Positioned(
                      height:
                          lerpDouble(_minHeight, _currentHeight, value) ?? 0,
                      bottom: lerpDouble(40, 0, value) ?? 0,
                      left: lerpDouble(
                              (_size.width / 2 - _menuWidth / 2), 0, value) ??
                          0,
                      width: lerpDouble(_menuWidth, _size.width, value) ?? 0,
                      child: Container(
                          decoration: BoxDecoration(
                              color: _cardColor,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                  bottom: Radius.circular(
                                      lerpDouble(20.0, 0.0, value) ?? 0))),
                          child: _expanded
                              ? Opacity(
                                  opacity: _controller.value,
                                  child: _buildExpandedContext())
                              : _buildMenuContent())),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }

  Widget _buildExpandedContext() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Last Century',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Body Tear',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shuffle),
                Icon(Icons.pause),
                Icon(Icons.playlist_add),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.calendar_today_sharp),
        GestureDetector(
            onTap: () {
              setState(() {
                _expanded = true;
                _currentHeight = _maxHeight;
                _controller.forward(from: 0.0);
              });
            },
            child: Icon(Icons.calendar_today)),
        Icon(Icons.calendar_today_sharp),
      ],
    );
  }
}
