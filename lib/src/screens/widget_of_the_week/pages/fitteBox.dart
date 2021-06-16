import 'package:flutter/material.dart';

class MyFitteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              color: Colors.blue,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                    image: NetworkImage(
                        'https://www.sportsmanagementdegreehub.com/wp-content/uploads/2020/05/The-30-Most-Architecturally-Impressive-Sports-Stadiums-in-the-World.jpg')),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
