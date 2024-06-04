import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: RouterName.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            color: Colors.white,
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouterName.data[index],
                );
              },
              child: Text(
                RouterName.data[index],
                style: TextStyle(fontSize: 30),
              ),
            )),
          );
        },
      ),
    );
  }
}
