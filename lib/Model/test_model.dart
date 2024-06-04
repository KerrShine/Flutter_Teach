// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  int count;
  String name;
  int age;

  TestModel({
    required this.count,
    required this.name,
    required this.age,
  });
    
  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        count: json["count"],
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "age": age,
      };
}
