import 'package:flutter/material.dart';
import 'package:mvvm_pro/Repository/IAPIRepository.dart';
import 'package:mvvm_pro/Model/login_data_model.dart';
import 'package:mvvm_pro/Repository/APIRepo.dart';
import 'package:mvvm_pro/Model/sheet_data_model.dart';

class APIViewModel extends ChangeNotifier {
  final IAPIRepository APIRepository;
  List<Logindata>? data;
  List<SheetData>? sheedata;

  APIViewModel(
    this.APIRepository,
  );

  Future<void> getLoginData() async {
    try {
      data = await APIRepository.getLoginData();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getSheetData() async {
    try {
      sheedata = await APIRepository.getSheetData();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
