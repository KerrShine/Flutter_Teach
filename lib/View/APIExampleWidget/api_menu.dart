import 'package:flutter/material.dart';
import 'package:mvvm_pro/Router/router_page.dart';

class APIMenuPage extends StatefulWidget {
  const APIMenuPage({super.key});

  @override
  State<APIMenuPage> createState() => _APIMenuPageState();
}

class _APIMenuPageState extends State<APIMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API 目錄'),
      ),
      body: Container(
        child: ListView.builder(
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
                      ApiRouterName.data[index],
                    );
                  },
                  child: Text(
                    ApiRouterName.data[index],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          },
          itemCount: ApiRouterName.data.length,
        ),
      ),
    );
  }
}
