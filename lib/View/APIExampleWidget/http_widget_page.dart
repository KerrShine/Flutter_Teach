import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_pro/Model/login_data_model.dart';
import 'package:mvvm_pro/Model/sheet_data_model.dart';

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
                  callApiEvent();
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
    // TODO: implement initState
    super.initState();
  }

  Future callApiwithGet() async {
    var auth = 'Basic ' + base64Encode(utf8.encode('PDA:7GvU\$fUl'));
    debugPrint('loading');
    //https://logistics.com.tw/DSV_PDA/api/CertifyActivity/getSheetNo

    // var response = await http.get(
    //   Uri.parse(
    //       'https://logistics.com.tw/DSV_PDA/api/CertifyActivity/getSheetNo'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     "Authorization": '', //data of Authorization
    //   },
    // );
    var response = await http.get(
      Uri.parse(
          'https://logistics.com.tw/DSV_PDA/api/CertifyActivity/getSheetNo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'WH': '@test',
        "Authorization": auth
      },
    );
    if (response.statusCode == 200) {
      var data = sheetDataFromJson(response.body);
      callback = data[0].facNo;
      debugPrint('end');
      setState(() {});
    } else {
      //todo exception progress
    }
  }

  Future callApiEvent() async {
    var auth = 'Basic ' + base64Encode(utf8.encode('PDA:7GvU\$fUl'));
    debugPrint('loading');
    var response = await http.post(
      Uri.parse(
          'https://logistics.com.tw/DSV_PDA/api/LoginActivity/getLoginData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'title': '',
        },
      ),
    );
    // var response = await http.post(
    //   Uri.parse(
    //       'https://logistics.com.tw/DSV_PDA/api/LoginActivity/getLoginData'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'WH': 'webDB',
    //     "Authorization": auth
    //   },
    //   body: jsonEncode(
    //     <String, String>{
    //       'title': '',
    //     },
    //   ),
    // );
    if (response.statusCode == 200) {
      callback = response.body.toString();
      debugPrint(callback);

      var data = logindataFromJson(response.body);
      setState(() {});
      debugPrint('end');
    } else {
      debugPrint('error: code $response.tatusCode');
    }
  }
}
