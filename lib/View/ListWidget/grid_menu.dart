import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class GridViewMenu extends StatefulWidget {
  const GridViewMenu({super.key});

  @override
  State<GridViewMenu> createState() => _GridViewMenuState();
}

class _GridViewMenuState extends State<GridViewMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView 示範'),
      ),
      body: ListView.builder(
        itemCount: GridRouteName.data.length,
        itemBuilder: (context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    GridRouteName.data[index],
                  );
                },
                child: Text(
                  GridRouteName.data[index],
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
