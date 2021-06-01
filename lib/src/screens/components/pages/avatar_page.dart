import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.foxsports.com.mx/wp-content/uploads/2021/02/7cc40727-e6a1-495e-9e0a-b6f1ebddb2d8-1200x675.jpg'),
          ),
          SizedBox(width: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              child: Text('VT'),
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage('https://www.foxsports.com.mx/wp-content/uploads/2021/02/7cc40727-e6a1-495e-9e0a-b6f1ebddb2d8-1200x675.jpg')
        ),
      ),
    );
  }
}