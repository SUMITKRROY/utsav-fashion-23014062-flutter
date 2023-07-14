import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/pref_utils.dart';
part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    final Dio dio = Dio();


    on<NavbarEventHandler>((event, emit) async {
      try{
        emit(NavbarLoading());
        developer.log('Enter NavbarLoading State');
        Response response = await dio.post(AppUrl.applepay_auth,
          options: Options(
            headers: {"Authorization": "Basic ${PrefUtils.getUserkey()}"},),

        );

        developer.log('data coming Get company List');
        // developer.log('>>>>>>>>>>>>>>>${response}');
        if(response.data['responseCode']==200){

          developer.log('Enter NavbarSuccess');
          emit(NavbarSuccess(/*ClientListModel.fromJson(response.data),*/response.data));
        }
        else{
          developer.log('Enter NavbarFailure');
          emit(NavbarFailure(response.data));

        }
      } on DioError catch (e) {


        if(kDebugMode){
          print('http401>>>>${e.error}');
        }
      }
    });

  }
}
