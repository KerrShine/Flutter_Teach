// To parse this JSON data, do
//
//     final sheetData = sheetDataFromJson(jsonString);

import 'dart:convert';

List<SheetData> sheetDataFromJson(String str) =>
    List<SheetData>.from(json.decode(str).map((x) => SheetData.fromJson(x)));

String sheetDataToJson(List<SheetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SheetData {
  String kinds;
  String sheet;
  String osheet;
  String facNo;
  String newOsheet;

  SheetData({
    required this.kinds,
    required this.sheet,
    required this.osheet,
    required this.facNo,
    required this.newOsheet,
  });

  factory SheetData.fromJson(Map<String, dynamic> json) => SheetData(
        kinds: json["kinds"],
        sheet: json["sheet"],
        osheet: json["osheet"],
        facNo: json["facNo"],
        newOsheet: json["newOsheet"],
      );

  Map<String, dynamic> toJson() => {
        "kinds": kinds,
        "sheet": sheet,
        "osheet": osheet,
        "facNo": facNo,
        "newOsheet": newOsheet,
      };
}
