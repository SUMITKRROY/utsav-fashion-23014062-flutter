// To parse this JSON data, do
//
//     final similarModel = similarModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SimilarModel similarModelFromJson(String str) => SimilarModel.fromJson(json.decode(str));

String similarModelToJson(SimilarModel data) => json.encode(data.toJson());

class SimilarModel {
  Data data;

  SimilarModel({
    required this.data,
  });

  factory SimilarModel.fromJson(Map<String, dynamic> json) => SimilarModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  UpdateSession updateSession;

  Data({
    required this.updateSession,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    updateSession: UpdateSession.fromJson(json["updateSession"]),
  );

  Map<String, dynamic> toJson() => {
    "updateSession": updateSession.toJson(),
  };
}

class UpdateSession {
  Pages pages;

  UpdateSession({
    required this.pages,
  });

  factory UpdateSession.fromJson(Map<String, dynamic> json) => UpdateSession(
    pages: Pages.fromJson(json["pages"]),
  );

  Map<String, dynamic> toJson() => {
    "pages": pages.toJson(),
  };
}

class Pages {
  List<ForFrontPage> forFrontPage;

  Pages({
    required this.forFrontPage,
  });

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
    forFrontPage: List<ForFrontPage>.from(json["forFrontPage"].map((x) => ForFrontPage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forFrontPage": List<dynamic>.from(forFrontPage.map((x) => x.toJson())),
  };
}

class ForFrontPage {
  int totalPrimaryCount;
  String divId;
  String resultId;
  String resultTitle;
  String resultToken;
  List<Primary> primary;

  ForFrontPage({
    required this.totalPrimaryCount,
    required this.divId,
    required this.resultId,
    required this.resultTitle,
    required this.resultToken,
    required this.primary,
  });

  factory ForFrontPage.fromJson(Map<String, dynamic> json) => ForFrontPage(
    totalPrimaryCount: json["totalPrimaryCount"],
    divId: json["divId"],
    resultId: json["resultId"],
    resultTitle: json["resultTitle"],
    resultToken: json["resultToken"],
    primary: List<Primary>.from(json["primary"].map((x) => Primary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalPrimaryCount": totalPrimaryCount,
    "divId": divId,
    "resultId": resultId,
    "resultTitle": resultTitle,
    "resultToken": resultToken,
    "primary": List<dynamic>.from(primary.map((x) => x.toJson())),
  };
}

class Primary {
  String productId;
  String name;
  double price;
  double listPrice;
  String currencyCode;
  String imageUrl;
  String url;

  Primary({
    required this.productId,
    required this.name,
    required this.price,
    required this.listPrice,
    required this.currencyCode,
    required this.imageUrl,
    required this.url,
  });

  factory Primary.fromJson(Map<String, dynamic> json) => Primary(
    productId: json["productId"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    listPrice: json["listPrice"]?.toDouble(),
    currencyCode: json["currencyCode"],
    imageUrl: json["imageUrl"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "price": price,
    "listPrice": listPrice,
    "currencyCode": currencyCode,
    "imageUrl": imageUrl,
    "url": url,
  };
}
