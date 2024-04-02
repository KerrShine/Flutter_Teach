import 'package:flutter/material.dart';

class RouterNextPage extends StatefulWidget {
  const RouterNextPage({super.key});

  @override
  State<RouterNextPage> createState() => _RouterNextPageState();
}

class _RouterNextPageState extends State<RouterNextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nvaigator Page'),
      ),
      body: Center(
          // ElevatedButton(onPressed: () {}, child: Text('Page Show')),
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('back page'),
      )),
    );
  }
}
