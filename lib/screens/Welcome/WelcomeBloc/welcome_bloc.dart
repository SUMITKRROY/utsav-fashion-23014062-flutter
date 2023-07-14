import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/Model/CountryModel.dart';
import 'package:utsav/Model/CurrencyModel.dart';
import 'package:utsav/Model/SingleCountryModel.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/pref_utils.dart';
import 'dart:developer' as developer;

import 'package:utsav/utils/utils.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final Dio dio = Dio();
  var taskComplete = false;

  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeEventHandler>((event, emit) async {
      print('hello');
      emit(WelcomeLoading());
      try {
        List<Response> response = await Future.wait([
          dio.get(AppUrl.countries),
          dio.get(AppUrl.Singlecountries),
          dio.get(AppUrl.currency),
        ]);
        developer.log("countries Url :-${AppUrl.countries}");
        developer.log("Singlecountries Url :-${AppUrl.Singlecountries}");
        developer.log("currency Url :-${AppUrl.currency}");

        developer.log("States Url :-${AppUrl.countries}");
        Utils.StateList = response[0].data;
        developer.log("States Url Response :-${Utils.StateList}");
        developer.log('countries>>>${response[0].data}');
        developer.log('Singlecountries>>>${response[1].data}');
        developer.log('currency>>>${response[2].data}');

        List<dynamic> category = [];
        List<dynamic> Singlecountries = [];
        Map<String, dynamic> currency = {};
        if (response[0].statusCode == 200 &&
            response[1].statusCode == 200 &&
            response[2].statusCode == 200) {
          // developer.log('countries>>>${response[0].data.runtimeType}');
          // developer.log('countries>>>${response[1].data.runtimeType}');
          // developer.log('countries>>>${response[2].data.runtimeType}');
          // developer.log('Singlecountries>>>${response[1].data}');
          // developer.log('currency>>>${response[2].data}');

          category.addAll(response[0].data);
          Utils.category = response[0].data;
          Utils.currencyModel = response[2].data;

          // print("litdynamic>>>>>${category}");
          // emit(WelcomeSuccess(CountriesModel.fromJson(response[0].data), SingleCountriesModel.fromJson(response[0].data), CurrencyModel.fromJson(response[0].data),));

          for (int i = 0; i < Utils.category.length; i++) {
            if (Utils.category[i]['full_name_locale'] == Utils.loaction) {
              developer.log(
                  "full_name_locale>>>>${Utils.category[i]['full_name_locale']}");

              // categoriesModel.add(state.categoriesModel['children_data'][i]);
            }
          }

          for (int i = 0;
              i < Utils.currencyModel['available_currency_codes'].length;
              i++) {
            if (Utils.currencyModel['available_currency_codes'][i] ==
                Utils.currencyName) {
              developer.log(
                  "currencyName>>>>${Utils.currencyModel['available_currency_codes'][i]}");

              Utils.currencyName =
                  Utils.currencyModel['available_currency_codes'][i];

              taskComplete = true;
              print("Utils.currencyName>>>${Utils.currencyName}");
              // categoriesModel.add(state.categoriesModel['children_data'][i]);
            }
          }

          if (!taskComplete) {
            Utils.currencyName = 'USD';
            Utils.currencySymbol = '\$';
            print("Utils.currencyName>>>${Utils.currencyName}");
          }
        } else {
          emit(WelcomeFailure(
            response[0].data,
            response[1].data,
            response[2].data,
          ));
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
    on<WelcomeEventNostoApi>((event, emit) async {
      final headers = {
        'Content-Type': 'application/graphql',
        'Authorization': AppUrl.nostoAutheKey,
        // 'Cookie': 'NOSTO_SESSION=5ecd49a7a35a6e2710ca58367033162d76ec6d66-___AT=c03adf79fdefddc3951649b886ef5cd8374f1898&___TS=1682973247844; NOSTO_SESSION=05f6fdc557c0b3d838262984c826f79f0e4b01cb-___AT=c03adf79fdefddc3951649b886ef5cd8374f1898&___TS=1682975134085'
      };
      const data =
          '''mutation {newSession(referer: "https://utsavfashion.com")}''';
      developer.log("nosto_session");
      try {
        final Response<dynamic> response = await dio.post(
          AppUrl.api_nosto,
          data: data,
          options: Options(headers: headers),
        );

        if (response.statusCode == 200) {
          developer
              .log("nosto_session_id>>${response.data['data']['newSession']}");
          // Utils.NostosessionId = response.data['data']['newSession'];
          PrefUtils.setNostoToken(
              response.data['data']['newSession'].toString());
          // PrefUtils.setNostoToken('tokken');

          developer.log('token>>>${PrefUtils.getNostoToken()}');
        } else {
          developer.log("error${response.statusMessage}");
        }
      } catch (e) {
        print(e);
        developer.log("error>>>Nosto$e");
      }
    });

    on<WelcomeEventgetAllCountires>((event, emit) async {
      final Dio dio = Dio();
      print("test get contires:-${AppUrl.getcountries}");
      try {
        Response response = await dio.get("${AppUrl.getcountries}");
        if (response.statusCode == 200) {
          print("getCountires");
          print(response.data);
          print(response.data.runtimeType);
          Utils.getCountires = response.data["available_regions"];
          developer.log('getCountires>>${Utils.getCountires[0].length}');
          developer.log('getCountires>>${Utils.getCountires}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

  }
}
