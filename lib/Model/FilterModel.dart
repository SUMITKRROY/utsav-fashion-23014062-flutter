// To parse this JSON data, do
//
//     final fuilterModel = fuilterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FuilterModel fuilterModelFromJson(String str) => FuilterModel.fromJson(json.decode(str));

String fuilterModelToJson(FuilterModel data) => json.encode(data.toJson());

class FuilterModel {
  List<Item> items;
  SearchCriteria searchCriteria;
  int totalCount;

  FuilterModel({
    required this.items,
    required this.searchCriteria,
    required this.totalCount,
  });

  factory FuilterModel.fromJson(Map<String, dynamic> json) => FuilterModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "search_criteria": searchCriteria.toJson(),
    "total_count": totalCount,
  };
}

class Item {
  int id;
  String identifier;
  String title;
  String content;
  DateTime creationTime;
  DateTime updateTime;
  bool active;

  Item({
    required this.id,
    required this.identifier,
    required this.title,
    required this.content,
    required this.creationTime,
    required this.updateTime,
    required this.active,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    identifier: json["identifier"],
    title: json["title"],
    content: json["content"],
    creationTime: DateTime.parse(json["creation_time"]),
    updateTime: DateTime.parse(json["update_time"]),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identifier": identifier,
    "title": title,
    "content": content,
    "creation_time": creationTime.toIso8601String(),
    "update_time": updateTime.toIso8601String(),
    "active": active,
  };
}

class SearchCriteria {
  List<FilterGroup> filterGroups;

  SearchCriteria({
    required this.filterGroups,
  });

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
  };
}

class FilterGroup {
  List<Filter> filters;

  FilterGroup({
    required this.filters,
  });

  factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
  };
}

class Filter {
  String field;
  String value;
  String conditionType;

  Filter({
    required this.field,
    required this.value,
    required this.conditionType,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    field: json["field"],
    value: json["value"],
    conditionType: json["condition_type"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "value": value,
    "condition_type": conditionType,
  };
}
