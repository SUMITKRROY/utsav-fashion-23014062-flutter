// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  List<RequestDatum> requestData;

  FilterModel({
    required this.requestData,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    requestData: List<RequestDatum>.from(json["RequestData"].map((x) => RequestDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RequestData": List<dynamic>.from(requestData.map((x) => x.toJson())),
  };
}

class RequestDatum {
  String categoryName;
  String value;
  String type;
  int index;
  int lenght;

  RequestDatum({
    required this.categoryName,
    required this.value,
    required this.type,
    required this.index,
    required this.lenght,
  });

  factory RequestDatum.fromJson(Map<String, dynamic> json) => RequestDatum(
    categoryName: json["categoryName"],
    value: json["value"],
    type: json["type"],
    index: json["index"],
    lenght: json["lenght"],
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "value": value,
    "type": type,
    "index": index,
    "lenght": lenght
  };
}
