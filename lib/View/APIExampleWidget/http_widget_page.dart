import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_pro/Model/login_data_model.dart';
import 'package:mvvm_pro/Model/sheet_data_model.dart';
import 'package:mvvm_pro/Model/test_model.dart';

class httpPage extends StatefulWidget {
  const httpPage({super.key});

  @override
  State<httpPage> createState() => _httpPageState();
}

String callback = "";

class _httpPageState extends State<httpPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('widget refreash!');
    return Scaffold(
        appBar: AppBar(
          title: Text('Http 示範'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  callApiPostEvent();
                },
                child: Text('Http Call 範例'),
              ),
              SizedBox(
                height: 20,
              ),
              Text('{$callback}')
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Future callApiPostEvent() async {
    debugPrint('loading');
    var response = await http.post(
      Uri.parse('https://httpbin.org/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'title': '123',
        },
      ),
    );

    if (response.statusCode == 200) {
      callback = response.body.toString();
      debugPrint(callback);

      // var data = logindataFromJson(response.body);
      setState(() {});
      debugPrint('end');
    } else {
      debugPrint('error: code $response.tatusCode');
    }
  }

  Future callApiEvent() async {
    debugPrint('loading');
    var response = await http.get(
      Uri.parse('https://api.agify.io/?name=meelad'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      callback = response.body.toString();
      debugPrint(callback);

      var data = testModelFromJson(response.body);
      setState(() {});
      debugPrint('end');
    } else {
      debugPrint('error: code $response.tatusCode');
    }
  }
}
