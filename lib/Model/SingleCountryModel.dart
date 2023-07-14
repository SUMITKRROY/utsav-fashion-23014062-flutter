// To parse this JSON data, do
//
//     final singleCountriesModel = singleCountriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SingleCountriesModel> singleCountriesModelFromJson(String str) => List<SingleCountriesModel>.from(json.decode(str).map((x) => SingleCountriesModel.fromJson(x)));

String singleCountriesModelToJson(List<SingleCountriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleCountriesModel {
  SingleCountriesModel({
    required this.id,
    required this.twoLetterAbbreviation,
    required this.threeLetterAbbreviation,
    required this.fullNameLocale,
    required this.fullNameEnglish,
    required this.availableRegions,
  });

  String id;
  String twoLetterAbbreviation;
  String threeLetterAbbreviation;
  String fullNameLocale;
  String fullNameEnglish;
  List<AvailableRegion> availableRegions;

  factory SingleCountriesModel.fromJson(Map<String, dynamic> json) => SingleCountriesModel(
    id: json["id"],
    twoLetterAbbreviation: json["two_letter_abbreviation"],
    threeLetterAbbreviation: json["three_letter_abbreviation"],
    fullNameLocale: json["full_name_locale"],
    fullNameEnglish: json["full_name_english"],
    availableRegions: List<AvailableRegion>.from(json["available_regions"].map((x) => AvailableRegion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "two_letter_abbreviation": twoLetterAbbreviation,
    "three_letter_abbreviation": threeLetterAbbreviation,
    "full_name_locale": fullNameLocale,
    "full_name_english": fullNameEnglish,
    "available_regions": List<dynamic>.from(availableRegions.map((x) => x.toJson())),
  };
}

class AvailableRegion {
  AvailableRegion({
    required this.id,
    required this.code,
    required this.name,
  });

  String id;
  String code;
  String name;

  factory AvailableRegion.fromJson(Map<String, dynamic> json) => AvailableRegion(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
  };
}
