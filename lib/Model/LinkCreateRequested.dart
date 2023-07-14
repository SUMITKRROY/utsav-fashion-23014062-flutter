import 'package:meta/meta.dart';
import 'dart:convert';

List<LinkCreateRequested> linkCreateRequestedFromJson(String str) => List<LinkCreateRequested>.from(json.decode(str).map((x) => LinkCreateRequested.fromJson(x)));

String linkCreateRequestedToJson(List<LinkCreateRequested> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinkCreateRequested {
  int position;
  String catName;
  List<String> value;

  LinkCreateRequested({
    required this.position,
    required this.catName,
    required this.value,
  });

  factory LinkCreateRequested.fromJson(Map<String, dynamic> json) => LinkCreateRequested(
    position: json["position"],
    catName: json["catName"],
    value: List<String>.from(json["value"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "catName": catName,
    "value": List<dynamic>.from(value.map((x) => x)),
  };
}