import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blokCheck = false;

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
                _createCheckBox(),
                _createSwitch(),
                _createImage()
              ],
            ),
          )),
    );
  }

  _createSlider() {
    return Slider(
        activeColor: Colors.indigo,
        //divisions: 10,
        label: "Size image",
        value: _valueSlider,
        min: 10.0,
        max: 400.0,
        onChanged: _blokCheck ? null : (value) {
          setState(() {
            _valueSlider = value;
          });
        });
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Block Slider'),
      value: _blokCheck,
      onChanged: (value) {
        setState(() {
          _blokCheck = value != null ? value : false;
        });
      }
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      value: _blokCheck,
      onChanged: (value) {
        setState(() {
          _blokCheck = value;
        });
      }
    );
  }

  Widget _createImage() {
    return Expanded(
      child: Image(
        image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
        width: _valueSlider,
        fit: BoxFit.contain,
      ),
    );
  }
}
