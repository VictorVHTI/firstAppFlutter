import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 400.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Slider Page'),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                _createSlider(),
              ],
            ),
          )),
    );
  }

  _createSlider() {
    return Slider(
        activeColor: Colors.indigo,
        divisions: 10,
        label: "Size image",
        value: _valueSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (value) {
          setState(() {
            _valueSlider = value;
          });
        });
  }
}
