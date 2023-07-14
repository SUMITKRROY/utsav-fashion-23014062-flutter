import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:utsav/Model/ViewTotalModel.dart';
import 'package:utsav/Model/addToCartModel.dart';
import 'package:utsav/utils/utils.dart';
import 'dart:developer' as developer;
import '../../../utils/appUrl.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {


  final Dio dio = Dio();
  ShoppingBloc() : super(ShoppingInitial()) {
    on<AddtoCartEvent>((event, emit) async {
      try {
        Response response = await dio.get("${AppUrl.guest_cartId}${Utils.usercartkey}/items");
         if (response.statusCode == 200) {
          final data = AddToModel.fromJson(response.data);
          emit(ShoppingSuccess( AddToModel.fromJson(response.data)));
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


    on<ViewDetailsCartEvent>((event, emit) async {

      try {
        Response response = await dio.get("${AppUrl.guest_carts_ViewTotal}${Utils.usercartkey}/totals");

         if (response.statusCode == 200) {

           Utils.viewTotalModel = response.data;
           developer.log('viewTotalModel>>${Utils.viewTotalModel}');
          emit(ViewDetailsSuccess(response.data));
        } else {
          print('Enter Data Failure');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }


    });

  }
}
