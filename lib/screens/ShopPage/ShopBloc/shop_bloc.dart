import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/utils.dart';
import 'dart:developer' as developer;
part 'shop_event.dart';
part 'shop_state.dart';


class ShopBloc extends Bloc<ShopEvent, ShopState> {

  final Dio dio = Dio();
  ShopBloc() : super(ShopInitial()) {
    on<ShopEventHandler>((event, emit) async {
      print(
          "${AppUrl.products_render_info}?storeId=${event.storeId}"
              "&currencyCode=${event.currencyCode}&searchCriteria=${event.searchCriteria}"
              "&searchCriteria[pageSize]=${event.pageSize}&searchCriteriacurrentPage=${event.currentPage}"
              "&searchCriteria[filter_groups][0][filters][0][field]=${event.field}&searchCriteria[filter_groups][0][filters][0][value]=${event.value}&searchCriteria[filter_groups][0][filters][0][condition_type]=${event.conditionType}");

      try {
        Response response = await dio.get(

            "${AppUrl.products_render_info}?storeId=${event.storeId}&currencyCode=${event.currencyCode}&searchCriteria=${event.searchCriteria}&searchCriteria[pageSize]=${event.pageSize}&searchCriteriacurrentPage=${event.currentPage}&searchCriteria[filter_groups][0][filters][0][field]=${event.field}&searchCriteria[filter_groups][0][filters][0][value]=${event.value}&searchCriteria[filter_groups][0][filters][0][condition_type]=${event.conditionType}");
            // "${AppUrl.products_render_info}?storeId=${event.storeId}&currencyCode=${event.currencyCode}&searchCriteria=${event.searchCriteria}&searchCriteria[pageSize]=${event.pageSize}&searchCriteria[currentPage]=${event.currentPage}");
        print('${response}');
        if (response.statusCode == 200) {
          // final data = ProdRendInfoModel.fromJson(response.data);

        } else {
          print('Enter Data Failure');
        }
      } on DioError catch (e) {
        // if (kDebugMode) {
        //   print(e.error);
        // }
      }

      // try {
      //   Response response = await dio.get(
      //       "${AppUrl.products_render_info}?storeId=${event.storeId}&currencyCode=${event.currencyCode}&searchCriteria=${event.searchCriteria}&searchCriteria[pageSize]=${event.pageSize}&searchCriteriacurrentPage=${event.currentPage}&searchCriteria[filter_groups][0][filters][0][field]=${event.field}&searchCriteria[filter_groups][0][filters][0][value]=${event.value}&searchCriteria[filter_groups][0][filters][0][condition_type]=${event.conditionType}"
      //       "${AppUrl.products_render_info}?storeId=${event.storeId}&currencyCode=${event.currencyCode}&searchCriteria=${event.searchCriteria}&searchCriteria[pageSize]=${event.pageSize}&searchCriteriacurrentPage=${event.currentPage}");
      //     if (response.statusCode == 200) {
      //     emit(SuccessData( ProdRendInfoModel.fromJson(response.data)));
      //   } else {
      //     print('Enter Data Failure');
      //   }
      // } on DioError catch (e) {
      //   // if (kDebugMode) {
      //   //   print(e.error);
      //   // }
      // }
    });

    on<ShipInFilterdata>((event, emit) async {
      final Dio dio = Dio();
      try {
        emit (SuccessLoading( ));
        print("Ship Filter >>>${AppUrl.shipsIn}");
        Response response = await dio.get(
          "${AppUrl.shipsIn}",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {

          Utils.shipinfilter = response.data["options"];

          emit (SuccessData(response.data["options"]));
          developer.log('ShipInFilterdata>>>${response.data["options"]}');
        }
      } on DioError catch (e) {
        emit (FailureData(e.message));
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
  }
}
