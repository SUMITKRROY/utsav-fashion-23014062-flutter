// To parse this JSON data, do
//
//     final getcartListModel = getcartListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetcartListModel> getcartListModelFromJson(String str) => List<GetcartListModel>.from(json.decode(str).map((x) => GetcartListModel.fromJson(x)));

String getcartListModelToJson(List<GetcartListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetcartListModel {
  int itemId;
  String sku;
  int qty;
  String name;
  double price;
  String productType;
  String quoteId;
  ProductOption productOption;
  List<MediaGalleryEntry> mediaGalleryEntries;

  GetcartListModel({
    required this.itemId,
    required this.sku,
    required this.qty,
    required this.name,
    required this.price,
    required this.productType,
    required this.quoteId,
    required this.productOption,
    required this.mediaGalleryEntries,
  });

  factory GetcartListModel.fromJson(Map<String, dynamic> json) => GetcartListModel(
    itemId: json["item_id"],
    sku: json["sku"],
    qty: json["qty"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    productType: json["product_type"],
    quoteId: json["quote_id"],
    productOption: ProductOption.fromJson(json["product_option"]),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
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
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
  };
}

class MediaGalleryEntry {
  int id;
  String mediaType;
  dynamic label;
  int position;
  bool disabled;
  List<String> types;
  String file;

  MediaGalleryEntry({
    required this.id,
    required this.mediaType,
    required this.label,
    required this.position,
    required this.disabled,
    required this.types,
    required this.file,
  });

  factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) => MediaGalleryEntry(
    id: json["id"],
    mediaType: json["media_type"],
    label: json["label"],
    position: json["position"],
    disabled: json["disabled"],
    types: List<String>.from(json["types"].map((x) => x)),
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_type": mediaType,
    "label": label,
    "position": position,
    "disabled": disabled,
    "types": List<dynamic>.from(types.map((x) => x)),
    "file": file,
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
