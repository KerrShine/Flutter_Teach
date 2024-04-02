import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/APIExampleWidget/count_provider.dart';
import 'package:provider/provider.dart';

class WithoutProviderPage extends StatefulWidget {
  const WithoutProviderPage({super.key});

  @override
  State<WithoutProviderPage> createState() => _WithoutProviderPageState();
}

class _WithoutProviderPageState extends State<WithoutProviderPage> {
  int counts = 1;

  @override
  Widget build(BuildContext context) {
    debugPrint('沒使用Provider 重建widget ${counts}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 頁面'),
      ),
      body: Center(
        child: Text(
          'Count: ${counts}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: increment,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void increment() {
    setState(() {
      counts++;
    });
  }
}
