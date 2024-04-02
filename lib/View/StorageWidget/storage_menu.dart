import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class StorageMenuPage extends StatefulWidget {
  const StorageMenuPage({super.key});

  @override
  State<StorageMenuPage> createState() => _StorageMenuPageState();
}

class _StorageMenuPageState extends State<StorageMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('本地儲存 Menu')),
      body: ListView.builder(
        itemCount: StorageRouterName.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  StorageRouterName.data[index],
                );
              },
              child: Text(
                StorageRouterName.data[index],
                style: TextStyle(fontSize: 20),
              ),
            )),
          );
        },
      ),
    );
  }
}
