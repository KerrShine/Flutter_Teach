import 'dart:convert';

List<Logindata> logindataFromJson(String str) =>
    List<Logindata>.from(json.decode(str).map((x) => Logindata.fromJson(x)));

// List<Logindata> logindataFromJson(String str) {
//   return List<Logindata>.from(json.decode(str).map((x) => Logindata.fromJson(x)));
// }

String logindataToJson(List<Logindata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Logindata logindata(String str) => Logindata.fromJson(json.decode(str));

String logintoJson(Logindata data) => json.encode(data.toJson());

class Logindata {
  String wareName;
  String dataSource;
  String catalog;
  String moveWareNo;

  Logindata({
    required this.wareName,
    required this.dataSource,
    required this.catalog,
    required this.moveWareNo,
  });

  factory Logindata.fromJson(Map<String, dynamic> json) => Logindata(
        wareName: json["wareName"],
        dataSource: json["DataSource"],
        catalog: json["catalog"],
        moveWareNo: json["moveWareNo"],
      );

  Map<String, dynamic> toJson() => {
        "wareName": wareName,
        "DataSource": dataSource,
        "catalog": catalog,
        "moveWareNo": moveWareNo,
      };
}
