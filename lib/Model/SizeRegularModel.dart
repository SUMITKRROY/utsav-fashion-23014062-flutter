// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


class SizeRegular {
  String sizeName;
  String value;
  String type;


  SizeRegular({
    required this.sizeName,
    required this.value,
    required this.type,

  });

  factory SizeRegular.fromJson(Map<String, dynamic> json) => SizeRegular(
    sizeName: json["sizeName"],
    value: json["value"],
    type: json["type"],

  );

  Map<String, dynamic> toJson() => {
    "sizeName": sizeName,
    "value": value,
    "type": type,

  };
}
