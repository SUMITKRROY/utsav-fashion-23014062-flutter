// To parse this JSON data, do
//
//     final urlKeyModel = urlKeyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UrlKeyModel> urlKeyModelFromJson(String str) => List<UrlKeyModel>.from(json.decode(str).map((x) => UrlKeyModel.fromJson(x)));

String urlKeyModelToJson(List<UrlKeyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UrlKeyModel {
  String entityId;
  String attributeId;
  AttributeCode attributeCode;
  String value;
  String urlKey;

  UrlKeyModel({
    required this.entityId,
    required this.attributeId,
    required this.attributeCode,
    required this.value,
    required this.urlKey,
  });

  factory UrlKeyModel.fromJson(Map<String, dynamic> json) => UrlKeyModel(
    entityId: json["entity_id"],
    attributeId: json["attribute_id"],
    attributeCode: attributeCodeValues.map[json["attribute_code"]]!,
    value: json["value"],
    urlKey: json["url_key"],
  );

  Map<String, dynamic> toJson() => {
    "entity_id": entityId,
    "attribute_id": attributeId,
    "attribute_code": attributeCodeValues.reverse[attributeCode],
    "value": value,
    "url_key": urlKey,
  };
}

enum AttributeCode { CATEGORY, DISCOUNT, TTS, STITCHING, TYPE_NEW, OCCASION, SUBTYPE, WORK, GENDER, FABRIC, COLORFAM, SIZE_PLUS, SIZE_REGULAR, CATEGORY_FILTER }

final attributeCodeValues = EnumValues({
  "category": AttributeCode.CATEGORY,
  "category_filter": AttributeCode.CATEGORY_FILTER,
  "colorfam": AttributeCode.COLORFAM,
  "discount": AttributeCode.DISCOUNT,
  "fabric": AttributeCode.FABRIC,
  "gender": AttributeCode.GENDER,
  "occasion": AttributeCode.OCCASION,
  "size_plus": AttributeCode.SIZE_PLUS,
  "size_regular": AttributeCode.SIZE_REGULAR,
  "stitching": AttributeCode.STITCHING,
  "subtype": AttributeCode.SUBTYPE,
  "tts": AttributeCode.TTS,
  "type_new": AttributeCode.TYPE_NEW,
  "work": AttributeCode.WORK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
