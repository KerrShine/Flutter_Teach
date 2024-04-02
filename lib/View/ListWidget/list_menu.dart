import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class ListViewMenu extends StatefulWidget {
  const ListViewMenu({super.key});

  @override
  State<ListViewMenu> createState() => _ListViewMenuState();
}

class _ListViewMenuState extends State<ListViewMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表目錄'),
      ),
      body: ListView.builder(
        itemCount: ListRouterName.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ListRouterName.data[index],
                  );
                },
                child: Text(
                  ListRouterName.data[index],
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
