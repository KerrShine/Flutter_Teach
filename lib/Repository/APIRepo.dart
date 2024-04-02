import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_pro/Repository/IAPIRepository.dart';
import 'package:mvvm_pro/Model/login_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_pro/Model/sheet_data_model.dart';

class APIRepo extends IAPIRepository {
  @override
  Future<List<Logindata>> getLoginData() async {
    debugPrint('loading');
    var response = await http.post(
      Uri.parse(
          'https://logistics.com.tw/DSV_PDA/api/LoginActivity/getLoginData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'WH': 'webDB',
        "Authorization": auth
      },
    );
    if (response.statusCode == 200) {
      var data = logindataFromJson(response.body);
      debugPrint('end');
      return data as List<Logindata>;
    } else {
      debugPrint('error: code $response.tatusCode');
      throw Exception;
    }
  }

  @override
  Future<List<SheetData>> getSheetData() async {
    // TODO: implement getSheetData
    debugPrint('loading');
    var response = await http.post(
      Uri.parse(
          'https://logistics.com.tw/DSV_PDA/api/CertifyActivity/getSheetNo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'WH': '@Test',
        "Authorization": auth
      },
    );

    if (response.statusCode == 200) {
      var data = sheetDataFromJson(response.body);
      debugPrint('end');
      return data as List<SheetData>;
    } else {
      debugPrint('error: code $response.tatusCode');
      throw Exception;
    }
  }

  var auth = 'Basic ' + base64Encode(utf8.encode('PDA:7GvU\$fUl'));
}
