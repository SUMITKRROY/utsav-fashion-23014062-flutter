import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/pref_utils.dart';
import 'package:utsav/utils/utils.dart';
import '../../../Model/SimilarItemModel.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final Dio dio = Dio();
    var nostotoken =   PrefUtils.getNostoToken();
    on<HomeCategories>((event, emit) async {

      developer.log('Api HomesDetails ');
      emit(HomeCategoriesLoding());
      try {

        Response response = await dio.get(
          "${AppUrl.categories_list}?searchCriteria[filter_groups][0][filters][0][field]=include_in_menu"
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
              "Authorization": "Bearer ${event.token}",
            },
          ),

        );
        // developer.log('statuscode>>>>${response.statusCode}  ');

        if (response.statusCode == 200) {
          // developer.log('response.data Homedetails---${response.data}');
          emit(HomeCategoriesSuccess(/*HomeModel.fromJson(response.data)*/ response.data ));

        }
        else {
          emit(HomeCategoriesFailure(response.data  ));

        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });
    on<HomeEventUrlKey>((event, emit) async {

      developer.log('Api HomesDetails ');
      emit(HomeUrlKeyLoding( ));
      try {

        Response response = await dio.get(AppUrl.getAllCategoriesWithIdandUrlKey,

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


          // developer.log(' getAllCategoriesWithIdandUrlKey---${response.data}');
          emit(HomeUrlKeySuccess(response.data ));

        } else {
          emit(HomeUrlKeyFailure(response.data  ));

        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<HomeScreenHandler>((event, emit) async {
      emit(homeScreenLoading());


      final Dio dio = Dio();
      try {

        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_home_screen_json"
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
          // print("dashborddata>>${response.data}");

          emit(SuccessHomeData(response.data));
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<NostoApiSimilarProductHome>((event, emit) async {




      developer.log('nostotoken2>>>$nostotoken');
      final headers = {
        'Content-Type': 'application/graphql',
        'Authorization': event.token,
        // 'Cookie': 'NOSTO_SESSION=5ecd49a7a35a6e2710ca58367033162d76ec6d66-___AT=c03adf79fdefddc3951649b886ef5cd8374f1898&___TS=1682973247844; NOSTO_SESSION=05f6fdc557c0b3d838262984c826f79f0e4b01cb-___AT=c03adf79fdefddc3951649b886ef5cd8374f1898&___TS=1682975134085'
      };
      var data = '''mutation {\n  updateSession(by: BY_CID, id: "${nostotoken}",\n    params: {\n      event: {\n   
           type: VIEWED_PAGE\n        target: "/" \n       }\n    }\n  ) {\n    pages {\n      forFrontPage(params: {\n    
              isPreview: false, imageVersion:  VERSION_ORIGINAL,\n        variantId:"${Utils.currencyName}",slotIds: ${AppUrl.HomeNostoSlotIds}\n  
                  }\n        ) \n       {\n        totalPrimaryCount,\n        divId,\n        resultId,\n        resultTitle,\n        
                  resultToken\n        primary {\n        productId\n        name\n     
         price\n        listPrice\n        currencyCode\n        imageUrl\n        url\n        }\n      }\n    }\n  }\n}''';
      // developer.log("nostoData>>$data");
      try {
        final Response<dynamic> response = await dio.post(
          AppUrl.api_nosto,
          data: data,
          options: Options(headers: headers),
        );

        if (response.statusCode == 200) {
          Utils.NostoHomeRecently = SimilarModel.fromJson(response.data);
          developer.log("nosto_session_>>${response.data}");

          // Utils.processHomePageData(Utils.NostoHomeRecently!.data.updateSession.pages.forFrontPage);
          Utils.NostoHomeRecently!.data.updateSession.pages.forFrontPage.forEach((element) {
            if (element.resultTitle == "Recently Viewed"&& element.totalPrimaryCount != 0){
              element.primary.forEach((primarydata) {
                developer.log("primerydata>>>${primarydata.name}");
              });
              Utils.recentlyViewed = element.primary??[];
              Utils.recentlyViewed_tital = element.resultTitle??"Recently Viewed";
            }

            else if(element.resultTitle == "Products Selling like Hot Cakes"&& element.totalPrimaryCount != 0){
              Utils.trendingMap = element.primary??[];
              Utils.trendingMap_tital = element.resultTitle;
            }else{

            }


          });



        } else {
          developer.log("error${response.statusMessage}");
        }
      } catch (e) {
        print(e);
        developer.log("error>>>Nosto$e");
      }
    });

    on<ReadyToShipCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_ready_to_ship"
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

          Utils.readytoshipcms = json.decode(response.data["items"][0]["content"].toString());

          // developer.log('ReadyToShipCMSbloc>>>${Utils.readytoshipcms}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<WhatnowCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_what_now"
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

          Utils.whatsnow = json.decode(response.data["items"][0]["content"].toString());

          // developer.log('ReadyToShipCMSbloc>>>${Utils.readytoshipcms}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<FashionstoryCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_fashion_stories"
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
          print("Whats Now");
          Utils.fashionstory =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('fashionstory>>>${Utils.fashionstory}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<TrendsCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      print("${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_spring_summer"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
          "&searchCriteria[filter_groups][1][filters][0][value]=1"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq");
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_spring_summer"
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
          print("mob_spring_summer");
          Utils.Trends =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('mob_spring_summer>>${Utils.Trends}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<PlusSizeCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      print("${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_plus_size"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
          "&searchCriteria[filter_groups][1][filters][0][value]=1"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq");
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_plus_size"
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
          print("PlusSizeCMSbloc");
          Utils.PlusSize =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('mob_spring_summer>>${Utils.PlusSize}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<WeddinfShopCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      print("${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_wedding_shop"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
          "&searchCriteria[filter_groups][1][filters][0][value]=1"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq");
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_wedding_shop"
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
          print("mob_spring_summer");
          Utils.Weddingshop =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('mob_wedding_shop>>${Utils.Weddingshop}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });


    on<TrendsWeLoveCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      print("${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_trends_we_love"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
          "&searchCriteria[filter_groups][1][filters][0][value]=1"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq");
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_trends_we_love"
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
          print("mob_trends_we_love");
          Utils.TrendsWeLove =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('mob_trends_we_love>>${Utils.TrendsWeLove}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });

    on<MypersonalStoreCMSbloc>((event, emit) async {
      final Dio dio = Dio();
      print("${AppUrl.cmsBlock}"
          "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
          "&searchCriteria[filter_groups][0][filters][0][value]=mob_my_personal_store"
          "&searchCriteria[filter_groups][0][filters][0][conditionType]=eq"
          "&searchCriteria[filter_groups][1][filters][0][field]=is_active"
          "&searchCriteria[filter_groups][1][filters][0][value]=1"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=eq");
      try {
        Response response = await dio.get(
          "${AppUrl.cmsBlock}"
              "?searchCriteria[filter_groups][0][filters][0][field]=identifier"
              "&searchCriteria[filter_groups][0][filters][0][value]=mob_my_personal_store"
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
          print("MyPersonalStore");
          Utils.MyPersonalStore =
              json.decode(response.data["items"][0]["content"].toString());
          developer.log('MyPersonalStore>>${Utils.MyPersonalStore}');
        }
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.error);
        }
      }
    });


  }
}
