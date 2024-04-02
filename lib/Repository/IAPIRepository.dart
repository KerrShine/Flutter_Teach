import 'package:mvvm_pro/Model/sheet_data_model.dart';

import '../Model/login_data_model.dart';

abstract class IAPIRepository {
  Future<List<Logindata>> getLoginData();

  Future<List<SheetData>> getSheetData();
}
