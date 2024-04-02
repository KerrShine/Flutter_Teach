import 'package:flutter/material.dart';
import 'package:mvvm_pro/View/APIExampleWidget/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatefulWidget {
  const ProviderWidget({super.key});

  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        )
      ],
      child: ProviderPage(),
    );
  }
}

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  int counts = 1;

  @override
  Widget build(BuildContext context) {
    debugPrint('Provider 重建widget ');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 頁面'),
      ),
      body: Center(
        child: Text(
          'Provider Count ${Provider.of<Counter>(context).count}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().increment();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
