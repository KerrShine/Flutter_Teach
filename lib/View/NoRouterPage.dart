import 'package:flutter/material.dart';

class NoRouterPage extends StatelessWidget {
  const NoRouterPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No route defined for ${name}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('回到上一頁'))
        ],
      )),
    );
  }
}
