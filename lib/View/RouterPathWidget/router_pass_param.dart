import 'package:flutter/material.dart';

class RouterPassDataPage extends StatefulWidget {
  String? ParamExample;

  RouterPassDataPage({super.key, this.ParamExample});

  @override
  State<RouterPassDataPage> createState() => _RouterPassDataPageState();
}

class _RouterPassDataPageState extends State<RouterPassDataPage> {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Router 取得資料'),
      ),
      body: Center(
        child: Text('${widget.ParamExample}'),
      ),
    );
  }
}
