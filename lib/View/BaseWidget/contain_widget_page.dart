import 'package:flutter/material.dart';

class ContainWidget extends StatelessWidget {
  const ContainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //child 內部widget
      child: Text('這是 Container', style: TextStyle(fontSize: 22)),
      //width 長度 可以指定也可以 match parent = double.infinity,
      width: double.infinity,
      height: 100,
      // color: Colors.yellow,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        color: Colors.yellow,
      ),
      //對齊
      alignment: Alignment.topLeft,
      //內邊距
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //外編距
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      // margin: EdgeInsets.all(10),
    );
  }
}
