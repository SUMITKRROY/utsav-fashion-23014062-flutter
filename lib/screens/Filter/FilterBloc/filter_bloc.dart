import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:utsav/Model/FilterModel.dart';
import 'package:utsav/utils/appUrl.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterHandler>((event, emit) async {
      emit(FilterLoading());


      final Dio dio = Dio();
      try {

        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_filter_screen"
              "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
              "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
              "&searchCriteria[filter_groups][1][filters][0][value]=1"
              "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );

        if (response.statusCode == 200) {
          print("filterdata>>${response.data}");

          emit(FilterSuccess(FuilterModel.fromJson(response.data)));
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
  }
}
