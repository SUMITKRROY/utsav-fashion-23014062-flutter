import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:utsav/Model/CategoriesModel.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/pref_utils.dart';
import 'dart:developer' as developer;


part 'onboard_event.dart';

part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(OnboardInitial()) {
    on<OnboardEventHandler>((event, emit) async {
      final Dio dio = Dio();
      try {
        emit(OnboardLoading());
        developer.log("userToken>>>>${event.token}");

        Response response = await dio.get(
          // AppUrl.categories,
          "${AppUrl.categories}?searchCriteria[filter_groups][0][filters][0][field]=include_in_menu"
              "&searchCriteria[filter_groups][0][filters][0][value]=1"
              "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
              "&searchCriteria[filter_groups][2][filters][0][field]=is_active"
              "&searchCriteria[filter_groups][2][filters][0][value]=1"
              "&searchCriteria[filter_groups][2][filters][0][conditionType]=eq"
              "&searchCriteria[sortOrders][0][direction]=ASC"
              "&searchCriteria[sortOrders][0][field]=level"
              "&searchCriteria[sortOrders][1][field]=position"
              "&searchCriteria[sortOrders][1][direction]=ASC",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${event.token}',

            },
          ),

        );

        if (response.statusCode == 200) {
          emit(OnboardSuccess( response.data));
        } else {
          emit(OnboardFailure(response.data));
        }
      } on DioError catch (e) {
        emit(OnboardServerError(e.error));
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<AutheHendler>((event, emit) async {
      final Dio dio = Dio();
      try {
        emit(AuthLoading());


        Response response = await dio.get(
          AppUrl.categories,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
            data: {
              // "username": "arvind.kumar",
              // "password": "test@123"
              "username": AppUrl.username,
              "password": AppUrl.password
            }
        );

        if (response.statusCode == 200) {
          emit(AuthSuccess( response.data));
        } else {
          emit(AuthFailure(response.data));
        }
      } on DioError catch (e) {
        emit(AuthServerError(e.error));
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
  }
}
