// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.items,
    required this.searchCriteria,
    required this.totalCount,
  });

  List<Item> items;
  SearchCriteria searchCriteria;
  int totalCount;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
  Item({
    required this.id,
    required this.sku,
    required this.name,
    required this.attributeSetId,
    required this.price,
    required this.status,
    required this.visibility,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
    required this.weight,
    required this.extensionAttributes,
    required this.productLinks,
    required this.options,
    required this.mediaGalleryEntries,
    required this.tierPrices,
    required this.customAttributes,
  });

  int id;
  String sku;
  String name;
  int attributeSetId;
  int price;
  int status;
  int visibility;
  String typeId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic weight;
  ExtensionAttributes extensionAttributes;
  List<ItemProductLink> productLinks;
  List<dynamic> options;
  List<MediaGalleryEntry> mediaGalleryEntries;
  List<dynamic> tierPrices;
  List<CustomAttribute> customAttributes;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: json["type_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    productLinks: List<ItemProductLink>.from(json["product_links"].map((x) => ItemProductLink.fromJson(x))),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
    tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "weight": weight,
    "extension_attributes": extensionAttributes.toJson(),
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
    "options": List<dynamic>.from(options.map((x) => x)),
    "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
    "tier_prices": List<dynamic>.from(tierPrices.map((x) => x)),
    "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  CustomAttribute({
    required this.attributeCode,
    required this.value,
  });

  String attributeCode;
  dynamic value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
  };
}

class ExtensionAttributes {
  ExtensionAttributes({
    required this.websiteIds,
    required this.categoryLinks,
    required this.bundleProductOptions,
  });

  List<int> websiteIds;
  List<CategoryLink> categoryLinks;
  List<BundleProductOption> bundleProductOptions;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
    bundleProductOptions: List<BundleProductOption>.from(json["bundle_product_options"].map((x) => BundleProductOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
    "category_links": List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
    "bundle_product_options": List<dynamic>.from(bundleProductOptions.map((x) => x.toJson())),
  };
}

class BundleProductOption {
  BundleProductOption({
    required this.optionId,
    required this.title,
    required this.required,
    required this.type,
    required this.position,
    required this.sku,
    required this.productLinks,
  });

  int optionId;
  String title;
  bool required;
  String type;
  int position;
  String sku;
  List<BundleProductOptionProductLink> productLinks;

  factory BundleProductOption.fromJson(Map<String, dynamic> json) => BundleProductOption(
    optionId: json["option_id"],
    title: json["title"],
    required: json["required"],
    type: json["type"],
    position: json["position"],
    sku: json["sku"],
    productLinks: List<BundleProductOptionProductLink>.from(json["product_links"].map((x) => BundleProductOptionProductLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "option_id": optionId,
    "title": title,
    "required": required,
    "type": type,
    "position": position,
    "sku": sku,
    "product_links": List<dynamic>.from(productLinks.map((x) => x.toJson())),
  };
}

class BundleProductOptionProductLink {
  BundleProductOptionProductLink({
    required this.id,
    required this.sku,
    required this.optionId,
    required this.qty,
    required this.position,
    required this.isDefault,
    required this.price,
    required this.priceType,
    required this.canChangeQuantity,
  });

  String id;
  String sku;
  int optionId;
  int qty;
  int position;
  bool isDefault;
  int price;
  dynamic priceType;
  int canChangeQuantity;

  factory BundleProductOptionProductLink.fromJson(Map<String, dynamic> json) => BundleProductOptionProductLink(
    id: json["id"],
    sku: json["sku"],
    optionId: json["option_id"],
    qty: json["qty"],
    position: json["position"],
    isDefault: json["is_default"],
    price: json["price"],
    priceType: json["price_type"],
    canChangeQuantity: json["can_change_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "option_id": optionId,
    "qty": qty,
    "position": position,
    "is_default": isDefault,
    "price": price,
    "price_type": priceType,
    "can_change_quantity": canChangeQuantity,
  };
}

class CategoryLink {
  CategoryLink({
    required this.position,
    required this.categoryId,
  });

  int position;
  String categoryId;

  factory CategoryLink.fromJson(Map<String, dynamic> json) => CategoryLink(
    position: json["position"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "category_id": categoryId,
  };
}

class MediaGalleryEntry {
  MediaGalleryEntry({
    required this.id,
    required this.mediaType,
    required this.label,
    required this.position,
    required this.disabled,
    required this.types,
    required this.file,
  });

  int id;
  String mediaType;
  dynamic label;
  int position;
  bool disabled;
  List<String> types;
  String file;

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

class ItemProductLink {
  ItemProductLink({
    required this.sku,
    required this.linkType,
    required this.linkedProductSku,
    required this.linkedProductType,
    required this.position,
  });

  String sku;
  String linkType;
  String linkedProductSku;
  String linkedProductType;
  int position;

  factory ItemProductLink.fromJson(Map<String, dynamic> json) => ItemProductLink(
    sku: json["sku"],
    linkType: json["link_type"],
    linkedProductSku: json["linked_product_sku"],
    linkedProductType: json["linked_product_type"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "link_type": linkType,
    "linked_product_sku": linkedProductSku,
    "linked_product_type": linkedProductType,
    "position": position,
  };
}

class SearchCriteria {
  SearchCriteria({
    required this.filterGroups,
  });

  List<FilterGroup> filterGroups;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
  };
}

class FilterGroup {
  FilterGroup({
    required this.filters,
  });

  List<Filter> filters;

  factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    required this.field,
    required this.value,
    required this.conditionType,
  });

  String field;
  String value;
  String conditionType;

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
