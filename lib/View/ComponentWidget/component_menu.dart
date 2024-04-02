import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class ComponentMenu extends StatefulWidget {
  const ComponentMenu({super.key});

  @override
  State<ComponentMenu> createState() => _ComponentMenuState();
}

class _ComponentMenuState extends State<ComponentMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('元件目錄'),
      ),
      body: ListView.builder(
        itemCount: ComponentRouterName.data.length,
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
                    ComponentRouterName.data[index],
                  );
                },
                child: Text(
                  ComponentRouterName.data[index],
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
