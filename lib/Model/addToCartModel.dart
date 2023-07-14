// To parse this JSON data, do
//
//     final addToModel = addToModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddToModel addToModelFromJson(String str) => AddToModel.fromJson(json.decode(str));

String addToModelToJson(AddToModel data) => json.encode(data.toJson());

class AddToModel {
  int itemId;
  String sku;
  int qty;
  String name;
  double price;
  String productType;
  String quoteId;
  ProductOption productOption;

  AddToModel({
    required this.itemId,
    required this.sku,
    required this.qty,
    required this.name,
    required this.price,
    required this.productType,
    required this.quoteId,
    required this.productOption,
  });

  factory AddToModel.fromJson(Map<String, dynamic> json) => AddToModel(
    itemId: json["item_id"],
    sku: json["sku"],
    qty: json["qty"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    productType: json["product_type"],
    quoteId: json["quote_id"],
    productOption: ProductOption.fromJson(json["product_option"]),
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "sku": sku,
    "qty": qty,
    "name": name,
    "price": price,
    "product_type": productType,
    "quote_id": quoteId,
    "product_option": productOption.toJson(),
  };
}

class ProductOption {
  ExtensionAttributes extensionAttributes;

  ProductOption({
    required this.extensionAttributes,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "extension_attributes": extensionAttributes.toJson(),
  };
}

class ExtensionAttributes {
  List<ConfigurableItemOption> configurableItemOptions;

  ExtensionAttributes({
    required this.configurableItemOptions,
  });

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    configurableItemOptions: List<ConfigurableItemOption>.from(json["configurable_item_options"].map((x) => ConfigurableItemOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "configurable_item_options": List<dynamic>.from(configurableItemOptions.map((x) => x.toJson())),
  };
}

class ConfigurableItemOption {
  String optionId;
  int optionValue;

  ConfigurableItemOption({
    required this.optionId,
    required this.optionValue,
  });

  factory ConfigurableItemOption.fromJson(Map<String, dynamic> json) => ConfigurableItemOption(
    optionId: json["option_id"],
    optionValue: json["option_value"],
  );

  Map<String, dynamic> toJson() => {
    "option_id": optionId,
    "option_value": optionValue,
  };
}
