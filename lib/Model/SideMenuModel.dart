// To parse this JSON data, do
//
//     final sideListModel = sideListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SideListModel> sideListModelFromJson(String str) => List<SideListModel>.from(json.decode(str).map((x) => SideListModel.fromJson(x)));

String sideListModelToJson(List<SideListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SideListModel {
  SideListModel({
    required this.id,
    required this.categoryName,
    required this.children,
    required this.subCategory,
  });

  int id;
  String categoryName;
  String children;
  List<SubCategory> subCategory;

  factory SideListModel.fromJson(Map<String, dynamic> json) => SideListModel(
    id: json["id"],
    categoryName: json["categoryName"],
    children: json["children"],
    subCategory: List<SubCategory>.from(json["subCategory"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "children": children,
    "subCategory": List<dynamic>.from(subCategory.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.subCategoryName,
    required this.children,
    required this.subCategoryData,
  });

  int id;
  String subCategoryName;
  String children;
  List<SubCategoryDatum> subCategoryData;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    subCategoryName: json["subCategoryName"],
    children: json["children"],
    subCategoryData: List<SubCategoryDatum>.from(json["subCategoryData"].map((x) => SubCategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subCategoryName": subCategoryName,
    "children": children,
    "subCategoryData": List<dynamic>.from(subCategoryData.map((x) => x.toJson())),
  };
}

class SubCategoryDatum {
  SubCategoryDatum({
    required this.id,
    required this.subClidName,
    required this.customAttributes,
  });

  int id;
  String subClidName;
  List<CustomAttribute> customAttributes;

  factory SubCategoryDatum.fromJson(Map<String, dynamic> json) => SubCategoryDatum(
    id: json["id"],
    subClidName: json["subClidName"],
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subClidName": subClidName,
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  String value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}
