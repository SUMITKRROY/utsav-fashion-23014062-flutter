// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  CurrencyModel({
    required this.baseCurrencyCode,
    required this.baseCurrencySymbol,
    required this.defaultDisplayCurrencyCode,
    required this.defaultDisplayCurrencySymbol,
    required this.availableCurrencyCodes,
    required this.exchangeRates,
  });

  String baseCurrencyCode;
  String baseCurrencySymbol;
  String defaultDisplayCurrencyCode;
  String defaultDisplayCurrencySymbol;
  List<String> availableCurrencyCodes;
  List<ExchangeRate> exchangeRates;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    baseCurrencyCode: json["base_currency_code"],
    baseCurrencySymbol: json["base_currency_symbol"],
    defaultDisplayCurrencyCode: json["default_display_currency_code"],
    defaultDisplayCurrencySymbol: json["default_display_currency_symbol"],
    availableCurrencyCodes: List<String>.from(json["available_currency_codes"].map((x) => x)),
    exchangeRates: List<ExchangeRate>.from(json["exchange_rates"].map((x) => ExchangeRate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "base_currency_code": baseCurrencyCode,
    "base_currency_symbol": baseCurrencySymbol,
    "default_display_currency_code": defaultDisplayCurrencyCode,
    "default_display_currency_symbol": defaultDisplayCurrencySymbol,
    "available_currency_codes": List<dynamic>.from(availableCurrencyCodes.map((x) => x)),
    "exchange_rates": List<dynamic>.from(exchangeRates.map((x) => x.toJson())),
  };
}

class ExchangeRate {
  ExchangeRate({
    required this.currencyTo,
    required this.rate,
  });

  String currencyTo;
  double rate;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
    currencyTo: json["currency_to"],
    rate: json["rate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "currency_to": currencyTo,
    "rate": rate,
  };
}
