import 'package:flutter/material.dart';

class MyAbsorbPointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _AbsorbBody(),
    );
  }
}

class _AbsorbBody extends StatefulWidget {
  const _AbsorbBody({
    Key? key,
  }) : super(key: key);

  @override
  __AbsorbBodyState createState() => __AbsorbBodyState();
}

class __AbsorbBodyState extends State<_AbsorbBody> {
  bool isAbsorbing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this.isAbsorbing = !this.isAbsorbing;
          });
        },
        child: Icon(this.isAbsorbing ? Icons.lock : Icons.lock_open),
      ),
      body: AbsorbPointer(absorbing: this.isAbsorbing, child: _BodyScafoold()),
    );
  }
}

class _BodyScafoold extends StatelessWidget {
  const _BodyScafoold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _ButtonWidget(width: double.infinity),
          Row(
            children: [
              _ButtonWidget(width: 230),
              Expanded(child: _ButtonWidget())
            ],
          ),
          Row(
            children: [
              Expanded(child: _ButtonWidget()),
              _ButtonWidget(width: 230)
            ],
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(5),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black12)),
            child: ListView.builder(
                itemBuilder: (_, i) => ListTile(
                      title: Text('${i + 1}'),
                    )),
          ))
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final double width;
  final double height;

  const _ButtonWidget({Key? key, this.height = 150, this.width = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: this.width,
        height: this.height,
        child: OutlinedButton(onPressed: () {}, child: Text('Button')));
  }
}
