// To parse this JSON data, do
//
//     final productSimilarModel = productSimilarModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductSimilarModel productSimilarModelFromJson(String str) => ProductSimilarModel.fromJson(json.decode(str));

String productSimilarModelToJson(ProductSimilarModel data) => json.encode(data.toJson());

class ProductSimilarModel {
  Data data;

  ProductSimilarModel({
    required this.data,
  });

  factory ProductSimilarModel.fromJson(Map<String, dynamic> json) => ProductSimilarModel(
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
  List<ForProductPage> forProductPage;

  Pages({
    required this.forProductPage,
  });

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
    forProductPage: List<ForProductPage>.from(json["forProductPage"].map((x) => ForProductPage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forProductPage": List<dynamic>.from(forProductPage.map((x) => x.toJson())),
  };
}

class ForProductPage {
  var totalPrimaryCount;
  String divId;
  String resultId;
  String resultTitle;
  String resultToken;
  List<ProductPrimary> primary;

  ForProductPage({
    required this.totalPrimaryCount,
    required this.divId,
    required this.resultId,
    required this.resultTitle,
    required this.resultToken,
    required this.primary,
  });

  factory ForProductPage.fromJson(Map<String, dynamic> json) => ForProductPage(
    totalPrimaryCount: json["totalPrimaryCount"],
    divId: json["divId"],
    resultId: json["resultId"],
    resultTitle: json["resultTitle"],
    resultToken: json["resultToken"],
    primary: List<ProductPrimary>.from(json["primary"].map((x) => ProductPrimary.fromJson(x))),
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

class ProductPrimary {
  String productId;
  String name;
  double price;
  var listPrice;
  CurrencyCode currencyCode;
  String imageUrl;
  String url;

  ProductPrimary({
    required this.productId,
    required this.name,
    required this.price,
    required this.listPrice,
    required this.currencyCode,
    required this.imageUrl,
    required this.url,
  });

  factory ProductPrimary.fromJson(Map<String, dynamic> json) => ProductPrimary(
    productId: json["productId"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    listPrice: json["listPrice"],
    currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
    imageUrl: json["imageUrl"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "price": price,
    "listPrice": listPrice,
    "currencyCode": currencyCodeValues.reverse[currencyCode],
    "imageUrl": imageUrl,
    "url": url,
  };
}

enum CurrencyCode { INR }

final currencyCodeValues = EnumValues({
  "INR": CurrencyCode.INR
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
