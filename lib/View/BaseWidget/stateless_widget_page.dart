import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;

  MyStatelessWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text('這是Stateless示範'),
      ),
    );
  }
}
