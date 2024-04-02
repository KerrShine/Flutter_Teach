import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class WidgetMenu extends StatefulWidget {
  const WidgetMenu({super.key});

  @override
  State<WidgetMenu> createState() => _WidgetMenuState();
}

class _WidgetMenuState extends State<WidgetMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('佈局Menu'),
      ),
      body: ListView.builder(
        itemCount: WidgetRouterName.data.length,
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
                    WidgetRouterName.data[index],
                  );
                },
                child: Text(
                  WidgetRouterName.data[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
