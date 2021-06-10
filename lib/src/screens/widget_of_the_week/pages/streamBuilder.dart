import 'dart:async';

import 'package:flutter/material.dart';

class MyStreamBuilder extends StatefulWidget {
  @override
  _MyStreamBuilderState createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  final colorStream = StreamController<Color>();
  int counter = -1;
  final List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.pink,
  ];

  @override
  void dispose() {
    colorStream.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(  
      child: StreamBuilder(
        stream: colorStream.stream ,
        //initialData: initialData ,
        builder: (BuildContext context, AsyncSnapshot snapshot){

          if (!snapshot.hasData) {
            return LoadingWidget();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text('Finish Stream');
          }
          return Container(
              width: 150,
              height: 150,
              color: snapshot.data,
            );

        },
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        counter++;
        if(counter < colorList.length){
          colorStream.sink.add(colorList[counter]);
        } else {
          colorStream.close();
        }
      },
      child: Icon(Icons.color_lens),
    ),);
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Loading...'),
        SizedBox(height: 20),
        CircularProgressIndicator()
      ],
    );
  }
}