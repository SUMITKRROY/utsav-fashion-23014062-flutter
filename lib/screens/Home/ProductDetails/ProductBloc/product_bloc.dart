

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
 import 'package:utsav/Model/ProductSimilarModel.dart';
 import 'dart:developer' as developer;
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/pref_utils.dart';
import 'package:utsav/utils/utils.dart';
import 'package:xml2json/xml2json.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Dio dio = Dio();
  Map<String, dynamic> Sizechartjsoncm = {};
  Map<String, dynamic> Sizechartjsoninch = {};
  ProductBloc() : super(ProductInitial()) {
    on<ProductEventhandler>((event, emit) async {
      developer.log('Api productsDetails ');
      emit(ProductLoding());
      try {
        developer.log(event.token);
        developer.log(
          "Productdetails>>>>>>>>${AppUrl.products_}"
          "?searchCriteria[filter_groups][0][filters][0][field]=url_key"
          "&searchCriteria[filter_groups][0][filters][0][value]=${event.productId}"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&storeId=2"
          "&currencyCode=INR",
        );

        Response response = await dio.get(
          "${AppUrl.products_}"
          "?searchCriteria[filter_groups][0][filters][0][field]=url_key"
          "&searchCriteria[filter_groups][0][filters][0][value]=${event.productId}"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&storeId=2"
          "&currencyCode=INR",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        developer.log('statuscode>>>>${response.statusCode}  ');

        if (response.statusCode == 200) {
          developer.log('response.data Productdetails---${response.data}');
          // developer.log('response.data Productdetails---${json.decode(response.data)}');
          emit(ProductSuccess(/*ProductModel.fromJson(response.data)*/
              response.data));
        } else {
          emit(ProductFailure(response.data));
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
    on<ProductDropDown>((event, emit) async {
      developer.log('Api productsDetails ');
      emit(ProductDropDownLoding());
      try {
        Response response = await dio.get(
          "${AppUrl.products_}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_color_and_wash_care_json"
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
        developer.log('statuscode>>>>${response.statusCode}  ');

        if (response.statusCode == 200) {
          developer.log('response.data Productdetails---${response.data}');
          emit(ProductDropDownSuccess(/*ProductModel.fromJson(response.data)*/
              response.data));
        } else {
          emit(ProductDropDownFailure(response.data));
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<ColorWashEventhandler>((event, emit) async {
      developer.log("Color Api Call");
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_color_and_wash_care_json"
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
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.colorWash = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
    on<CustomstockStatus>((event, emit) async {
      developer.log("CustomstockStatus Api Call");
      developer.log( "CustomstockStatus${AppUrl.custom_stock_status}${event.tagName}");
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.custom_stock_status}${event.tagName}",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          // developer.log('custom_stock_status>>${response.data["options"].runtimeType}');
          // developer.log('custom_stock_status>>${response.data["options"]}');
          Utils.custom_stock_status = response.data["options"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<SizeregularApi>((event, emit) async {
      developer.log("Sizeregular Api Call");
      developer.log( "Sizeregular${AppUrl.Sizeregular}${event.tagName}");
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.custom_stock_status}${event.tagName}",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          developer.log('SizeregularApi>>${response.data["options"].runtimeType}');
          developer.log('SizeregularApi>>${response.data["options"]}');
          Utils.SizeregularApi = response.data["options"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<TailoringServices>((event, emit) async {
      print("Color Api Call");
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_tailoring_services_json"
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
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.tailoringServices = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<FallandEdging>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_fall_and_edging_json"
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
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.FallandEdging = response.data["items"][0]["content"];
          print(Utils.FallandEdging);
          print(response.data);
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<MeasurementWomen>((event, emit) async {
      final Dio dio = Dio();
        var value = "mob_how_to_measure_women";
        developer.log('Measurement_tagname>>${event.tagname}');

      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=${event.tagname=="Women"?"mob_how_to_measure_women":"mob_how_to_measure_men"}"
          // "&searchCriteria[filter_groups][0][filters][0][value]=mob_how_to_measure_men"
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
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.MeasurementWomen = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    // on<Measurementmen>((event, emit) async {
    //   final Dio dio = Dio();
    //   try {
    //     Response response = await dio.get(
    //       "${AppUrl.cmsBlock}"
    //       "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
    //       "&searchCriteria[filter_groups][0][filters][0][value]=mob_how_to_measure_men"
    //       "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
    //       "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
    //       "&searchCriteria[filter_groups][1][filters][0][value]=1"
    //       "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
    //       options: Options(
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Accept': 'application/json',
    //           "Authorization": "Bearer ${event.token}",
    //         },
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       // emit(SuccessColorData(response.data));
    //       // emit(WashColorData(response.data));
    //       Utils.Measurementmen = response.data["items"][0]["content"];
    //     }
    //   } on DioError catch (e) {
    //     if (kDebugMode) {
    //       print(e.error);
    //     }
    //   }
    // });

    on<SalwarKameezStitching>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
          "&searchCriteria[filterGroups][0][filters][0][value]=mob_salwar_kameez_stitching_options"
          "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
          "&searchCriteria[filterGroups][1][filters][0][value]=1"
          "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.salwarstitch = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<LehengaStitching>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
          "&searchCriteria[filterGroups][0][filters][0][value]=mob_lehenga_stitching_options"
          "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
          "&searchCriteria[filterGroups][1][filters][0][value]=1"
          "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.LehengaStitch = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<PetticoatStitching>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
          "&searchCriteria[filterGroups][0][filters][0][value]=mob_petticoat_stitching_options"
          "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
          "&searchCriteria[filterGroups][1][filters][0][value]=1"
          "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.PetticoatStitch = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<BlouseStitchingSec>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
          "&searchCriteria[filterGroups][0][filters][0][value]=mob_blouse_stitching_options_sec"
          "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
          "&searchCriteria[filterGroups][1][filters][0][value]=1"
          "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.BlouseStitchingSec = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<BlouseStitching>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
          "?searchCriteria[filterGroups][0][filters][0][field]=identifier"
          "&searchCriteria[filterGroups][0][filters][0][value]=mob_blouse_stitching_options"
          "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filterGroups][1][filters][0][field]=is_active"
          "&searchCriteria[filterGroups][1][filters][0][value]=1"
          "&searchCriteria[filterGroups][1][filters][0][conditionType]=eq",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "Authorization": "Bearer ${event.token}",
            },
          ),
        );
        if (response.statusCode == 200) {
          // emit(SuccessColorData(response.data));
          // emit(WashColorData(response.data));
          Utils.BlouseStitching = response.data["items"][0]["content"];
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<NostoApiSimilarProduct>((event, emit) async {
      var nostotoken = PrefUtils.getNostoToken();

      developer.log('nostpiseesion>>>>>$nostotoken');

      final headers = {
        'Content-Type': 'application/graphql',
        'Authorization': AppUrl.nostoAutheKey,
       };
       var data = '''mutation {\n  updateSession(by: BY_CID, id: "${nostotoken}",\n   
       params: {\n      event: {\n        type: VIEWED_PRODUCT,\n        ref:"category-similar-product",\n   
            target:"${event.productId}" \n       }\n    }\n  ) {\n    pages {\n      forProductPage(params: {\n     
               isPreview: false, imageVersion:  VERSION_ORIGINAL,\n        variantId:"${Utils.currencyName}"\n      
                }, \n        product: "${event.productId}",) \n       {\n        totalPrimaryCount,\n        divId,\n 
                       resultId,\n        resultTitle,\n        resultToken\n        primary {\n        productId\n 
                              name\n        price\n        listPrice\n        currencyCode\n        imageUrl\n     
                                 url\n        }\n      }\n    }\n  }\n}''';
      developer.log("nostoData>>$data");
      try {
        final Response<dynamic> response = await dio.post(
          AppUrl.api_nosto,
          data: data,
          options: Options(headers: headers),
        );

        if (response.statusCode == 200) {
          emit(ProductSimilarSuccess());

          // developer.log("productSimilarModel>>${response.data}");

          Utils.productSimilarModel = ProductSimilarModel.fromJson(response.data);

          developer.log("productSimilarModel>>${Utils.productSimilarModel}");


          Utils.productSimilarModel!.data.updateSession.pages.forProductPage.forEach((element) {
            if (element.resultTitle == "Similar Products"&& element.totalPrimaryCount != 0){
              element.primary.forEach((primarydata) {
                // developer.log("Similar_Products>>>${primarydata.name}");
                // developer.log("Similar_Products>>>${primarydata.url}");


              });
              Utils.productPrimaryList = element.primary;
            }

            if (element.resultTitle == "New Arrivals"&& element.totalPrimaryCount != 0){
              element.primary.forEach((primarydata) {
                developer.log("New_Arrivals>>>${primarydata.name}");
              });
              Utils.new_ArrivalsList = element.primary;
            }
            if (element.resultTitle == "Recently Viewed"&& element.totalPrimaryCount != 0){
              element.primary.forEach((primarydata) {
                developer.log("Recently_Viewed>>>${primarydata.name}");
              });
              Utils.recently_ViewedList = element.primary;
            }

          });
          // if (Utils.productSimilarModel?.data?.updateSession?.pages?.forProductPage != null) {
          //   for (var element in Utils.productSimilarModel!.data.updateSession.pages.forProductPage) {
          //     if (element.totalPrimaryCount != 0) {
          //       if (element.resultTitle == null) {
          //         // Handle case where resultTitle key doesn't exist
          //         Utils.productPrimary.addAll(element.primary);
          //       } else if (element.resultTitle == "Similar Products") {
          //         Utils.productPrimary.addAll(element.primary);
          //       }
          //     }
          //   }
          // }
          // void processHomePageData(List<dynamic> forFrontPage) {
          //   Map<String, List<dynamic>> groupedItems = {};
          //   for (var item in forFrontPage) {
          //     if (item is Map<String, dynamic>) {
          //       var resultTitle = item['resultTitle'];
          //       if (!groupedItems.containsKey(resultTitle)) {
          //         groupedItems[resultTitle] = [];
          //       }
          //       groupedItems[resultTitle].addAll(item['primary']);
          //     }
          //   }
          //   // Now you can use the grouped items as needed
          //   List<dynamic> recentlyViewed = groupedItems['Recently Viewed'] ?? [];
          //   List<dynamic> trendingMap = groupedItems['Products Selling like Hot Cakes'] ?? [];
          //   // Do something with these lists
          // }

         } else {
          emit(ProductSimilarFailure(response.statusMessage));
          developer.log("error${response.statusMessage}");
        }
      } catch (e) {
        print(e);
        developer.log("error>>>Nosto$e");
      }
    });


    on<UDesignApi>((event, emit) async {


      String checksum = event.itemcode + event.keyword + event.appid;
      List<int> bytes = utf8.encode(checksum);
      Digest md5Hash = md5.convert(bytes);
      final headers = {
        'Content-Type': 'application/graphql',
       };
       var data = {
         'itemcode': event.itemcode,
         'customerid': event.customerid,
         'customeremail': event.customeremail,
         'checksum': md5Hash,
         'appid': event.appid,
         'returnurl': event.returnurl,
         'imageurl': event.imageurl
       };
       try {
        final Response<dynamic> response = await dio.post(
          AppUrl.usqaudesign_utsav,
          data: data,
          options: Options(headers: headers),
        );

        if (response.statusCode == 200) {

             Utils.UdsignHtml=  response.data;



         } else {

          developer.log("error${response.statusMessage}");
        }
      } catch (e) {
        print(e);
        developer.log("error>>>Nosto$e");
      }
    });

    on<GetsizeChart>((event, emit) async {
      final Dio dio = Dio();
      try {
        String data = event.itemcode + event.keyword + event.appid;
        List<int> bytes = utf8.encode(data);
        Digest md5Hash = md5.convert(bytes);
        Response response = await dio.get(
            "${AppUrl.sizeChart}?itemcode=${event.itemcode}&appid=${event.appid}&checksum=${md5Hash.toString()}&returntype=json&unit=${event.mescm}");
        Response response2 = await dio.get(
            "${AppUrl.sizeChart}?itemcode=${event.itemcode}&appid=${event.appid}&checksum=${md5Hash.toString()}&returntype=json&unit=${event.mesinches}");
        if (response.statusCode == 200) {
          developer.log("SizeChartjsonDataResp:-${response.data}");
          developer.log("SizeChartjsonDataResp:-${response.data.runtimeType}");
          final Xml2Json xml2Json = Xml2Json();
          xml2Json.parse(response.data);
          var jsonString = xml2Json.toParker();
          var sizeCharDataCm = jsonDecode(jsonString);
          Sizechartjsoncm = json.decode(sizeCharDataCm["string"]);
        }
        if (response2.statusCode == 200) {
          developer.log("SizeChartjsonDataResp in :-${response2.data}");
          developer
              .log("SizeChartjsonDataResp in :-${response2.data.runtimeType}");
          final Xml2Json xml2Json = Xml2Json();
          xml2Json.parse(response2.data);
          var jsonString2 = xml2Json.toParker();
          var sizeCharDataInch = jsonDecode(jsonString2);
          Sizechartjsoninch = json.decode(sizeCharDataInch["string"]);
          Utils.SizeChartinch = sizeCharDataInch["string"];
          emit(SizeChartDataSuccess(Sizechartjsoncm, Sizechartjsoninch));
        }
      } on DioError catch (e) {
        if (kDebugMode) {

          print(e.error);
        }
      }
    });

    on<BandalProductApi>((event, emit) async {
      print('hello');
      // emit(WelcomeLoading());
      try {

        event.productSkuList.forEach((element) async {


          List<Response> response = await Future.wait([

            dio.get(
              "${AppUrl.products_}"
                  "?searchCriteria[filterGroups][0][filters][0][field]=sku"
                  "&searchCriteria[filterGroups][0][filters][0][value]=${element}"
                  "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
                  "&storeId=2"
                  "&currencyCode=INR",
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  "Authorization": "Bearer ${event.token}",
                },
              ),
            ),

          ]);


          if (response[0].statusCode == 200 &&
              response[1].statusCode == 200 ||
              response[2].statusCode == 200) {
            developer.log('productSku_0>>>${response[0].data.runtimeType}');
            developer.log('productSku_1>>>${response[1].data.runtimeType}');
            developer.log('productSku_2>>>${response[2].data.runtimeType}');


          } else {


          }

        });






      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

  }
}
