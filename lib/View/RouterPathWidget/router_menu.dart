import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/RouterPathWidget/router_next_page.dart';
import 'package:mvvm_pro/View/RouterPathWidget/router_pass_param.dart';

class RouterMenuPage extends StatefulWidget {
  const RouterMenuPage({super.key});

  @override
  State<RouterMenuPage> createState() => _RouterMenuPageState();
}

class _RouterMenuPageState extends State<RouterMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Router 介紹頁面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'Router_Name',
              );
            },
            child: Text('Navigator by Named'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RouterNextPage(),
                ),
              );
            },
            child: Text('Navigator by not Name'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Router_PassData',
                  arguments: '透過construct外部丟來的資料');
            },
            child: Text('Navigator by Named pass data'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      RouterPassDataPage(ParamExample: '透過construct外部丟來的資料'),
                ),
              );
            },
            child: Text('Navigator no Named pass data'),
          ),
        ],
      ),
    );
  }
}
