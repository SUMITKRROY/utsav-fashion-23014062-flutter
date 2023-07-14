import 'dart:convert';
import 'dart:io';

/*
import 'package:country_provider2/country_provider2.dart';
*/
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:utsav/screens/Home/HomeBloc/home_bloc.dart';

import 'package:utsav/screens/welcome/welcome_screen.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/pref_utils.dart';

import 'package:utsav/utils/utils.dart';
import 'package:intl/intl.dart';

import '../../Model/SideMenuModel.dart';
import '../Welcome/WelcomeBloc/welcome_bloc.dart';
import 'dart:developer' as developer;
import 'dart:ui' as ui;
import 'OnboardBloc/onboard_bloc.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var latitude, longitude, nostotoken='' ;
  // final CountryProvider _countryProvider = CountryProvider();
  List<SideListModel> mainData = [];
  Locale myLocale = ui.window.locale;

  @override
  void initState() {
    // BlocProvider.of<HomeBloc>(context).add(HomeEventhandler( , Utils.userkey) );
    getLocation();
    gettokenAuth();
    // NostoAutheApi();
    // sendGraphQlMutation();
    init();
    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEventHandler());
    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEventgetAllCountires());

    if(PrefUtils.getNostoToken()==''){
      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEventNostoApi());
    }


    super.initState();
  }

init() async {
   nostotoken =   await PrefUtils.getNostoToken();
   developer.log('nostotoken>>>$nostotoken');
   developer.log('nostotoken1>>>${PrefUtils.getNostoToken()}');
}


  getLocation() async {
    // _getUserLocation();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
    Utils.latitude = position.latitude;
    Utils.longitude = position.longitude;

    developer.log('latitude :: ${position.latitude}');
    developer.log("longitude :: ${position.longitude}");
    _getAddress();
  }

  _getAddress() async {
    try {
      List<Placemark> p = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];
      setState(() {
        var currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        var currentAdd = currentAddress;
        Utils.loaction = place.country!;
        print(currentAddress);
        var isoCountryCode = place.isoCountryCode!;
        print('Current locale: ${myLocale.languageCode}_$isoCountryCode');

        var localscode = "${myLocale.languageCode}_$isoCountryCode";
        getCurrency(localscode);
        // getCurrency(Utils.loaction,isoCountryCode);
      });
    } catch (e) {
      print(e);
    }
  }

  gettokenAuth() async {
    final Dio dio = Dio();

    try {
      Response response = await dio.get(
        AppUrl.AuthToken,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        PrefUtils.setUserkey(response.data);
        // WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
        developer.log('response.data ---${response.data}');

        Utils.userkey = response.data;
        BlocProvider.of<HomeBloc>(context).add(HomeEventUrlKey(response.data));
        BlocProvider.of<OnboardBloc>(context).add(OnboardEventHandler(response.data));
        BlocProvider.of<HomeBloc>(context).add(HomeCategories(response.data));

        BlocProvider.of<HomeBloc>(context).add(ReadyToShipCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(WhatnowCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(FashionstoryCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(TrendsCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(PlusSizeCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(WeddinfShopCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(TrendsWeLoveCMSbloc(response.data));
        BlocProvider.of<HomeBloc>(context).add(MypersonalStoreCMSbloc(response.data));

        // getSidemenuApi(response.data);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }

  String getCurrency(countryName) {
    var format = NumberFormat.simpleCurrency(
      locale: countryName,
    );
    print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    print("CURRENCY NAME ${format.currencyName}");

    Utils.currencyName = format.currencyName!;
    Utils.currencySymbol = format.currencySymbol;
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          height: height,
          width: width,
          child: MultiBlocListener(
            listeners: [
              BlocListener<OnboardBloc, OnboardState>(
                listener: (context, state) {
                  developer.log("$state");

                  if (state is OnboardSuccess) {
                    print("OnboardSuccess");





                  } else if (state is OnboardFailure) {
                    developer.log("OnboardFailure");

                    Utils.showCustomToast(context, state.error.toString(), 3);
                  } else {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Utils.showLoader(context));
                  }
                },
              ),
              BlocListener<WelcomeBloc, WelcomeState>(
                listener: (context, state) {
                  if (state is WelcomeSuccess) {
                    print("OnboardSuccess");
                  } else if (state is WelcomeFailure) {
                    developer.log("OnboardFailure");
                  } else {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Utils.showLoader(context));
                  }
                },
              ),
              BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeCategoriesSuccess) {
                    developer.log("HomeSuccess");

                    state.Home.length;




                    for (int i = 0; i < state.Home['items'].length; i++) {
                      if (state.Home['items'][i]['level'] == 2) {
                        mainData.add(SideListModel(
                            id: state.Home['items'][i]['id'],
                            categoryName: state.Home['items'][i]['name'],
                            children: state.Home['items'][i]['children'],
                            subCategory: []));
                      }
                    }

                    for (int J = 0; J < mainData.length; J++) {
                      var idArray = mainData[J].children.split(',');
                      if (idArray.isNotEmpty) {
                        for (var element in idArray) {
                          for (int i = 0; i < state.Home['items'].length; i++) {
                            if (element == state.Home['items'][i]['id'].toString()) {

                              mainData[J].subCategory.add(SubCategory(
                                  id: state.Home['items'][i]['id'],
                                  subCategoryName: state.Home['items'][i]['name'],
                                  children: state.Home['items'][i]['children'],
                                  subCategoryData: []));
                            }
                          }
                        }
                      }
                    }

                    for (int J = 0; J < mainData.length; J++) {
                      for (int k = 0; k < mainData[J].subCategory.length; k++) {
                        var idArray = mainData[J].subCategory[k].children.split(',');
                        if (idArray.isNotEmpty) {
                          for (var element in idArray) {
                            for (int i = 0; i < state.Home['items'].length; i++) {
                              if (element == state.Home['items'][i]['id'].toString()) {
                                List<CustomAttribute> customAttributes=[];
                                for (int p = 0; p < state.Home['items'][i]['custom_attributes'].length; p++ ) {
                                  customAttributes.add(CustomAttribute(attributeCode: state.Home['items'][i]['custom_attributes'][p]['attribute_code'], value: state.Home['items'][i]['custom_attributes'][p]['value']));
                                }
                                mainData[J].subCategory[k].subCategoryData.add(SubCategoryDatum(id: state.Home['items'][i]['id'], subClidName: state.Home['items'][i]['name'], customAttributes: customAttributes));
                              }
                            }
                          }
                        }
                      }

                    }


                     Utils.sidemenu = mainData;

                    developer.log("mainData>>>>$mainData");

                    for (int i = 0; i < Utils.sidemenu.length; i++) {
                      if (Utils.sidemenu[i].categoryName == 'Discover') {
                        developer.log("Discover>>>>${Utils.sidemenu[i].subCategory[i].subCategoryName}");

                        Utils.discover.add(Utils.sidemenu[i]);
                      }
                    }


                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Utils.hideLoader());
                  }
                  else if (state is HomeCategoriesFailure) {
                    developer.log("HomeFailure");
                  }
                  else if (state is HomeUrlKeySuccess) {
                    developer.log("HomeUrlKeySuccess");

                     Utils.UrlKeyData =  state.urlKeyModel;


                  }
                  else {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Utils.showLoader(context));
                  }
                },
              ),

            ],
            child: Padding(
              // padding: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: height * 0.030,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 7,
                              child: Image.asset(
                                "images/SplashScreenLogo.png",
                                height: height * 0.080,
                                width: width * 0.080,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: TextButton(
                                onPressed: () {
                                  // print("Height:-$height , Weight$width");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WelcomeScreen()));
                                },
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(30, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height * 0.080,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "images/Spasc.png",
                          height: height * 0.200,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.040,
                      ),
                      Text(
                        "Don’t miss out".toUpperCase(),
                        style: const TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: AppColors.primaryColorpink,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: height * 0.005,
                      ),
                      const Text(
                        "Register and start your fashion \n journey to get -",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w400),
                      ),
                      // SizedBox(
                      //   height: height*0.10,
                      // ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Get extra 500 Off* on your first order when you log in. Offers & updates on fresh Indian fashion trends. Seamless sync of wishlist on all devices. Faster browsing and checkout while you shop. All your orders & status updates in one place..",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 15,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.100,
                      ),
                      InkWell(
                          child: Container(
                            width: width / 2,
                            // width: width*0.60,
                            // height: height*0.060,
                            height: height / 12,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.bordergrey, width: 1),
                                shape: BoxShape.circle,
                                color: Colors.white),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: AppColors.primaryColorpink,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider(
                                              create: (context) =>
                                                  WelcomeBloc(),
                                            ),
                                          ],
                                          child: const WelcomeScreen(),
                                        )),
                                (route) => false);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
