import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/utils.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    final Dio dio = Dio();
    on<AddressEventHandler>((event, emit) async {

      developer.log('Api AddressDetails get ');
      developer.log("${AppUrl.guest_billing_address}${Utils.usercartkey}/billing-address");
      emit(AddressLoading());
      try {

        Response response = await dio.get(
          "${AppUrl.guest_billing_address}${Utils.usercartkey}/billing-address",

          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),

        );
        // developer.log('statuscode>>>>${response.statusCode}  ');

        if (response.statusCode == 200) {
          developer.log('response.data AddressSuccess---${response.data}');
          emit(AddressSuccess(  response.data ));

        }
        else {
          // emit(AddressFailure(response.data  ));

        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

  }
}
