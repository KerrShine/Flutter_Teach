import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  const StackPage({super.key});

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        ),
        Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.yellow, shape: BoxShape.circle)),
        Container(
          width: 100,
          height: 100,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
      ],
    );
  }
}
