import 'dart:convert';

ProdRendInfoModel prodRendInfoModelFromJson(String str) => ProdRendInfoModel.fromJson(json.decode(str));

String prodRendInfoModelToJson(ProdRendInfoModel data) => json.encode(data.toJson());

class ProdRendInfoModel {
  ProdRendInfoModel({
    required this.items,
  });

  List<Item> items;

  factory ProdRendInfoModel.fromJson(Map<String, dynamic> json) => ProdRendInfoModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.addToCartButton,
    required this.addToCompareButton,
    required this.priceInfo,
    required this.images,
    required this.url,
    required this.id,
    required this.name,
    required this.type,
    required this.isSalable,
    required this.storeId,
    required this.currencyCode,
    required this.extensionAttributes,
  });

  Button addToCartButton;
  Button addToCompareButton;
  PriceInfo priceInfo;
  List<Images> images;
  String url;
  int id;
  String name;
  String type;
  String isSalable;
  int storeId;
  String currencyCode;
  ItemExtensionAttributes extensionAttributes;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    addToCartButton: Button.fromJson(json["add_to_cart_button"]),
    addToCompareButton: Button.fromJson(json["add_to_compare_button"]),
    priceInfo: PriceInfo.fromJson(json["price_info"]),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    url: json["url"],
    id: json["id"],
    name: json["name"],
    type: json["type"],
    isSalable: json["is_salable"],
    storeId: json["store_id"],
    currencyCode: json["currency_code"],
    extensionAttributes: ItemExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "add_to_cart_button": addToCartButton.toJson(),
    "add_to_compare_button": addToCompareButton.toJson(),
    "price_info": priceInfo.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "url": url,
    "id": id,
    "name": name,
    "type": type,
    "is_salable": isSalable,
    "store_id": storeId,
    "currency_code": currencyCode,
    "extension_attributes": extensionAttributes.toJson(),
  };
}

class Button {
  Button({
    this.postData,
    required this.url,
    this.requiredOptions,
  });

  String? postData;
  String url;
  bool? requiredOptions;

  factory Button.fromJson(Map<String, dynamic> json) => Button(
    postData: json["post_data"],
    url: json["url"],
    requiredOptions: json["required_options"],
  );

  Map<String, dynamic> toJson() => {
    "post_data": postData,
    "url": url,
    "required_options": requiredOptions,
  };
}

class ItemExtensionAttributes {
  ItemExtensionAttributes({
    required this.reviewHtml,
    required this.wishlistButton,
  });

  String reviewHtml;
  Button wishlistButton;

  factory ItemExtensionAttributes.fromJson(Map<String, dynamic> json) => ItemExtensionAttributes(
    reviewHtml: json["review_html"],
    wishlistButton: Button.fromJson(json["wishlist_button"]),
  );

  Map<String, dynamic> toJson() => {
    "review_html": reviewHtml,
    "wishlist_button": wishlistButton.toJson(),
  };
}

class Images {
  Images({
    required this.url,
    required this.code,
    required this.height,
    required this.width,
    required this.label,
    required this.resizedWidth,
    required this.resizedHeight,
  });

  String url;
  String code;
  int height;
  int width;
  String label;
  int resizedWidth;
  int resizedHeight;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    url: json["url"],
    code: json["code"],
    height: json["height"],
    width: json["width"],
    label: json["label"],
    resizedWidth: json["resized_width"],
    resizedHeight: json["resized_height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "code": code,
    "height": height,
    "width": width,
    "label": label,
    "resized_width": resizedWidth,
    "resized_height": resizedHeight,
  };
}

class PriceInfo {
  PriceInfo({
    required this.finalPrice,
    required this.maxPrice,
    required this.maxRegularPrice,
    required this.minimalRegularPrice,
    this.specialPrice,
    required this.minimalPrice,
    required this.regularPrice,
    required this.formattedPrices,
    required this.extensionAttributes,
  });

  double finalPrice;
  double maxPrice;
  double maxRegularPrice;
  double minimalRegularPrice;
  dynamic specialPrice;
  double minimalPrice;
  double regularPrice;
  FormattedPrices formattedPrices;
  PriceInfoExtensionAttributes extensionAttributes;

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
    finalPrice: json["final_price"]?.toDouble(),
    maxPrice: json["max_price"]?.toDouble(),
    maxRegularPrice: json["max_regular_price"]?.toDouble(),
    minimalRegularPrice: json["minimal_regular_price"]?.toDouble(),
    specialPrice: json["special_price"],
    minimalPrice: json["minimal_price"]?.toDouble(),
    regularPrice: json["regular_price"]?.toDouble(),
    formattedPrices: FormattedPrices.fromJson(json["formatted_prices"]),
    extensionAttributes: PriceInfoExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "final_price": finalPrice,
    "max_price": maxPrice,
    "max_regular_price": maxRegularPrice,
    "minimal_regular_price": minimalRegularPrice,
    "special_price": specialPrice,
    "minimal_price": minimalPrice,
    "regular_price": regularPrice,
    "formatted_prices": formattedPrices.toJson(),
    "extension_attributes": extensionAttributes.toJson(),
  };
}

class PriceInfoExtensionAttributes {
  PriceInfoExtensionAttributes({
    required this.msrp,
    required this.taxAdjustments,
    required this.weeeAttributes,
    required this.weeeAdjustment,
  });

  Msrp msrp;
  TaxAdjustments taxAdjustments;
  List<dynamic> weeeAttributes;
  String weeeAdjustment;

  factory PriceInfoExtensionAttributes.fromJson(Map<String, dynamic> json) => PriceInfoExtensionAttributes(
    msrp: Msrp.fromJson(json["msrp"]),
    taxAdjustments: TaxAdjustments.fromJson(json["tax_adjustments"]),
    weeeAttributes: List<dynamic>.from(json["weee_attributes"].map((x) => x)),
    weeeAdjustment: json["weee_adjustment"],
  );

  Map<String, dynamic> toJson() => {
    "msrp": msrp.toJson(),
    "tax_adjustments": taxAdjustments.toJson(),
    "weee_attributes": List<dynamic>.from(weeeAttributes.map((x) => x)),
    "weee_adjustment": weeeAdjustment,
  };
}

class Msrp {
  Msrp({
    required this.msrpPrice,
    required this.isApplicable,
    required this.isShownPriceOnGesture,
    required this.msrpMessage,
    required this.explanationMessage,
  });

  String msrpPrice;
  String isApplicable;
  String isShownPriceOnGesture;
  String msrpMessage;
  String explanationMessage;

  factory Msrp.fromJson(Map<String, dynamic> json) => Msrp(
    msrpPrice: json["msrp_price"],
    isApplicable: json["is_applicable"],
    isShownPriceOnGesture: json["is_shown_price_on_gesture"],
    msrpMessage: json["msrp_message"],
    explanationMessage: json["explanation_message"],
  );

  Map<String, dynamic> toJson() => {
    "msrp_price": msrpPrice,
    "is_applicable": isApplicable,
    "is_shown_price_on_gesture": isShownPriceOnGesture,
    "msrp_message": msrpMessage,
    "explanation_message": explanationMessage,
  };
}

class TaxAdjustments {
  TaxAdjustments({
    required this.finalPrice,
    required this.maxPrice,
    required this.maxRegularPrice,
    required this.minimalRegularPrice,
    required this.specialPrice,
    required this.minimalPrice,
    required this.regularPrice,
    required this.formattedPrices,
  });

  double finalPrice;
  double maxPrice;
  double maxRegularPrice;
  double minimalRegularPrice;
  double specialPrice;
  double minimalPrice;
  double regularPrice;
  FormattedPrices formattedPrices;

  factory TaxAdjustments.fromJson(Map<String, dynamic> json) => TaxAdjustments(
    finalPrice: json["final_price"]?.toDouble(),
    maxPrice: json["max_price"]?.toDouble(),
    maxRegularPrice: json["max_regular_price"]?.toDouble(),
    minimalRegularPrice: json["minimal_regular_price"]?.toDouble(),
    specialPrice: json["special_price"]?.toDouble(),
    minimalPrice: json["minimal_price"]?.toDouble(),
    regularPrice: json["regular_price"]?.toDouble(),
    formattedPrices: FormattedPrices.fromJson(json["formatted_prices"]),
  );

  Map<String, dynamic> toJson() => {
    "final_price": finalPrice,
    "max_price": maxPrice,
    "max_regular_price": maxRegularPrice,
    "minimal_regular_price": minimalRegularPrice,
    "special_price": specialPrice,
    "minimal_price": minimalPrice,
    "regular_price": regularPrice,
    "formatted_prices": formattedPrices.toJson(),
  };
}

class FormattedPrices {
  FormattedPrices({
    required this.finalPrice,
    required this.maxPrice,
    required this.minimalPrice,
    required this.maxRegularPrice,
    this.minimalRegularPrice,
    this.specialPrice,
    required this.regularPrice,
  });

  String finalPrice;
  String maxPrice;
  String minimalPrice;
  String maxRegularPrice;
  dynamic minimalRegularPrice;
  String? specialPrice;
  String regularPrice;

  factory FormattedPrices.fromJson(Map<String, dynamic> json) => FormattedPrices(
    finalPrice: json["final_price"],
    maxPrice: json["max_price"],
    minimalPrice: json["minimal_price"],
    maxRegularPrice: json["max_regular_price"],
    minimalRegularPrice: json["minimal_regular_price"],
    specialPrice: json["special_price"],
    regularPrice: json["regular_price"],
  );

  Map<String, dynamic> toJson() => {
    "final_price": finalPrice,
    "max_price": maxPrice,
    "minimal_price": minimalPrice,
    "max_regular_price": maxRegularPrice,
    "minimal_regular_price": minimalRegularPrice,
    "special_price": specialPrice,
    "regular_price": regularPrice,
  };
}
