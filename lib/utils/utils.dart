import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:html/parser.dart';
import 'package:utsav/Model/ProductSimilarModel.dart';
import 'package:utsav/Model/SideMenuModel.dart';
import 'package:utsav/Model/SimilarItemModel.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'package:utsav/screens/Login/login_screen.dart';
import 'package:utsav/screens/ShopPage/MixCategoryLandingPage.dart';
import 'package:utsav/screens/ShopPage/ShopBloc/shop_bloc.dart';
import 'package:utsav/utils/widgets.dart';
import 'app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;


class Palette {
  static const MaterialColor kTolight = MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      10:   Color(0xffffffff), //10%
      50:   Color(0xffce5641), //10%
      100:   Color(0xffb74c3a), //20%
      200:   Color(0xffa04332), //30%
      300:   Color(0xff89392b), //40%
      400:   Color(0xff733024), //50%
      500:   Color(0xff5c261d), //60%
      600:   Color(0xff451c16), //70%
      700:   Color(0xff2e130e), //80%
      800:   Color(0xff170907), //90%
      900:   Color(0xff000000), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.


class Utils {
  static BuildContext? _loaderContext;
  static BuildContext? _loadingDialoContext;
  static bool _isLoaderShowing = false;
  static bool _isLoadingDialogShowing = false;
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;
  static String authToken = '';
  static String model = '';
  static String osVersion = '';
  static String platform = '';
  static String imei = '';
  static String currentAddress = '';
  static String loaction = '';
  static String cartitems = '';
  static String currencyCode  = '';
  static String currencyName = '';
  static String defCurrencyUSD = ' ';
  static String usercartkey = '';
  static String defcurrencySymbolUSD = '';
  static String currencySymbol = '';
  static String NostosessionId = '';
  static var latitude;
  static var longitude;
  static var checkLogin;
  static var colorWash='';
  static Map BillingData = {};
  static List<dynamic> StateList =[];
  static var ImgUrlKey;
  static var SmallImg;
  static var UdsignHtml;
  static String md5hashkey = 'XDfdUdd213oedY0';
  static List<dynamic> shipinfilter = [];

  static var FallandEdging;
  static var tailoringServices ='';
  static var ProductImgUrl;
  static var BlouseStitching;
  static var SizeChartcm;
  static var SizeChartinch;
  static List<dynamic> custom_stock_status =[];
  static List<dynamic> SizeregularApi =[];
  static List<dynamic> getCountires =[];
  static String MeasurementWomen = '';
  static String Measurementmen = '';
  static String salwarstitch = '';
  static String PetticoatStitch = '';
  static String BlouseStitchingSec = '';
  static String LehengaStitch = '';
  static String userQuoteId = '';

  ///cms bloc
  static Map<String, dynamic> readytoshipcms ={};
  static Map<String, dynamic> whatsnow ={};
  static Map<String, dynamic> fashionstory ={};
  static Map<String, dynamic> Trends ={};
  static Map<String, dynamic> Weddingshop ={};
  static Map<String, dynamic> PlusSize ={};
  static Map<String, dynamic> TrendsWeLove ={};

  static Map<String, dynamic> MyPersonalStore ={};

  static List<dynamic> getpaymentinfo =[];


  static String userpic = '';
  static String userlastlogin = '';
  static String userName = '';
  static String userkey = '';
  static String Devicesid = '';
  static String TOKEN = '';
  static String resetTpin = '';
  static String indexname = '';
  static int product_count = 1;
  static String category_id = '4';

  static Map Accountdata = {};
  static List<dynamic> UrlKeyData =[];
  static List<SideListModel> sidemenu = [];

///cartsection
//   static List<dynamic> CartItems=[];
  static var CartItems;

///
  static  List<SubCategory>  subCategory=[];
  static  SimilarModel? NostoHomeRecently;
  static  ProductSimilarModel? productSimilarModel;
  static List<Primary>? recentlyViewed;
  static  Map<String, dynamic> viewTotalModel ={};
  static var recentlyViewed_tital;
  static List<Primary> trendingMap =[];
  static var trendingMap_tital;
  // static List<dynamic> recentlyViewed = [];
  // static List<dynamic> trendingMap= [];
  static  List<dynamic> categoriesModel =[] ;
  static  List<dynamic> categoriesModelUI =[] ;
  static  List<SideListModel> discover =[] ;
  static  List<ProductPrimary> productPrimaryList =[] ;
  static  List<ProductPrimary> new_ArrivalsList =[] ;
  static  List<ProductPrimary> recently_ViewedList =[] ;
  static List<dynamic> category=[];
  static Map<String, dynamic> currencyModel={};
  static List<Map<String, dynamic>> TailoringModel=[

    {
      "title": "Semi Stitched Blouse",
      "value": "Semi stitched implies either half stitched outfit in which styles are pre-constructed like shown in the image or has pre-defined neck styles, sleeve style on fabric with pre-defined sleeve length, neck depths & outfit length. In these type of apparels, either only side seams are left open which can be adjusted as per the bust size chosen"
          "Or it may have an unstitched fabric with pre-constructed back and neck design and sleeve border."
          "In rare scenario, the length of the blouse and sleeves can be altered, if the design permits.",
    },
    {
      "title": "Ready to Wear Size Blouse:",
      "value": "Measure your Garment bust and choose the corresponding size option from the dropdown. If neck style shown in the image is clearly visible, we’ll design it the same way. If not, we'll stitch our standard yet popular round neck design.",
    },
    {
      "title": "Made to Measure Blouse:",
      "value": "Made to Measure (UDesign) is our Bespoke Tailoring Service - you can customize the exact fit of the garment, its styling and add adornments, all to suit your taste and body type. The measurements can be added right away or post ordering at a convenient time from My account. You need to log-in to avail this service.",
    },
  ];
  static List<Map<String, dynamic>> SizeModel=[

    {
      "id": 25,
      "parent_id": 3,
      "name": "Size",
      "name": "size_plus",
      "is_active": false,
      "position": 10,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 880,
          "parent_id": 185,
          "name": "44",
          "is_active": false,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 878,
          "parent_id": 185,
          "name": "46",
          "is_active": false,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 876,
          "parent_id": 185,
          "name": "48",
          "is_active": false,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 874,
          "parent_id": 185,
          "name": "50",
          "is_active": false,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 180,
          "parent_id": 185,
          "name": "All Sizes...",
          "is_active": false,
          "position": 5,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        }
      ]
    },
  ];
  static List<Map<String, dynamic>> SideModel=
       [
    {
      "id": 4,
      "parent_id": 3,
      "name": "Saree",
      "is_active": true,
      "position": 4,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 148,
          "parent_id": 27,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 201,
              "parent_id": 92,
              "name": "Wedding Wear",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "product_id": 0,
              "children_data": [

              ]
            },
            {
              "id": 202,
              "parent_id": 92,
              "name": "Party Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 200,
              "parent_id": 92,
              "name": "Bridal Wear",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 92,
              "name": "Festive Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 204,
              "parent_id": 92,
              "name": "Casual Wear",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 205,
              "parent_id": 92,
              "name": "Bollywood Wear",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 148,
              "parent_id": 92,
              "name": "All Occasions...",
              "is_active": true,
              "position": 7,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 180,
          "parent_id": 27,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 584,
              "parent_id": 180,
              "name": "Embroidered Saree",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 591,
              "parent_id": 180,
              "name": "Printed Saree",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 594,
              "parent_id": 180,
              "name": "South Saree",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 606,
              "parent_id": 180,
              "name": "Woven Saree",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 593,
              "parent_id": 180,
              "name": "Regional Saree",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 584,
              "parent_id": 180,
              "name": "Half & Half Saree",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 180,
              "parent_id": 180,
              "name": "All Styles...",
              "is_active": true,
              "position": 7,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 588,
              "parent_id": 180,
              "name": "Ombre Sarees",
              "is_active": false,
              "position": 8,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 590,
              "parent_id": 180,
              "name": "Pre-stitched Sarees",
              "is_active": false,
              "position": 9,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 586,
              "parent_id": 180,
              "name": "Handloom Saree",
              "is_active": false,
              "position": 10,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 149,
          "parent_id": 27,
          "name": "Fabric",
          "atribute_name": "fabric",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 219,
              "parent_id": 149,
              "name": "Cotton Saree",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 218,
              "parent_id": 149,
              "name": "Silk Saree",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 247,
              "parent_id": 149,
              "name": "Art Silk Saree",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 206,
              "parent_id": 149,
              "name": "Georgette Saree",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 208,
              "parent_id": 149,
              "name": "Chiffon Saree",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 207,
              "parent_id": 149,
              "name": "Crepe Saree",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 149,
              "parent_id": 149,
              "name": "All Fabrics...",
              "is_active": true,
              "position": 7,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 95,
          "parent_id": 27,
          "name": "More",
          "atribute_name": "More",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 12,
              "parent_id": 95,
              "name": "Blouse",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 11,
              "parent_id": 95,
              "name": "Petticoat",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 16,
              "parent_id": 95,
              "name": "Handbags",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 5,
      "parent_id": 3,
      "name": "Salwar Kameez",
      "is_active": true,
      "position": 5,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 148,
          "parent_id": 5,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 203,
              "parent_id": 148,
              "name": "Festive Wear",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 202,
              "parent_id": 148,
              "name": "Party Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 201,
              "parent_id": 148,
              "name": "Wedding Wear",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 204,
              "parent_id": 148,
              "name": "Casual Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 205,
              "parent_id": 148,
              "name": "Bollywood Wear",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 148,
              "parent_id": 148,
              "name": "All Occasions...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 180,
          "parent_id": 28,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 597,
              "parent_id": 180,
              "name": "Anarkali Style",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Straight Style",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 596,
              "parent_id": 180,
              "name": "Abaya Style",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 598,
              "parent_id": 180,
              "name": "Pakistani Style",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 599,
              "parent_id": 180,
              "name": "Punjabi Style",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 180,
              "parent_id": 180,
              "name": "All Styles...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 103,
          "parent_id": 28,
          "name": "Fabric",
          "atribute_name": "fabric",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 677,
              "parent_id": 181,
              "name": "Chanderi Suits",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 677,
              "parent_id": 181,
              "name": "Georgette Suits",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 677,
              "parent_id": 181,
              "name": "Cotton Suits",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 677,
              "parent_id": 181,
              "name": "Net Suits",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 677,
              "parent_id": 181,
              "name": "Art Silk Suits",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 677,
              "parent_id": 181,
              "name": "All Fabrics...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 104,
          "parent_id": 28,
          "name": "Alternates",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 0,
              "parent_id": 180,
              "name": "Long Kurtas",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 608,
              "parent_id": 180,
              "name": "Tunics",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 346,
              "parent_id": 180,
              "name": "Bottoms",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 613,
              "parent_id": 180,
              "name": "Dupattas",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 615,
              "parent_id": 180,
              "name": "Gowns",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 611,
              "parent_id": 180,
              "name": "Patialas with Dupattas",
              "is_active": false,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 6,
      "parent_id": 3,
      "name": "Lehenga",
      "is_active": true,
      "position": 6,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 110,
          "parent_id": 29,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 200,
              "parent_id": 148,
              "name": "Bridal Wear",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 148,
              "name": "Festival Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 202,
              "parent_id": 148,
              "name": "Party Wear",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 201,
              "parent_id": 148,
              "name": "Wedding Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 200,
              "parent_id": 148,
              "name": "All Occasions...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 180,
          "parent_id": 29,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 602,
              "parent_id": 180,
              "name": "Circular Style",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 601,
              "parent_id": 180,
              "name": "A-Line Lehenga",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Mermaid Style",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Indowestern Lehenga",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "All Styles...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 111,
          "parent_id": 29,
          "name": "Fabric",
          "atribute_name": "fabric",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 0,
              "parent_id": 0,
              "name": "Art Silk Lehenga",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 0,
              "name": "Net Lehenga",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 0,
              "name": "Georgette Lehenga",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 0,
              "name": "Velvet Lehenga",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 0,
              "name": "Silk Lehenga",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 0,
              "name": "All Fabrics...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 112,
          "parent_id": 29,
          "name": "Alternates",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 615,
              "parent_id": 180,
              "name": "Gowns",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 596,
              "parent_id": 180,
              "name": "Abaya Style Suit",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 587,
              "parent_id": 180,
              "name": "Lehenga Style Saree",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 9,
      "parent_id": 3,
      "name": "Men",
      "is_active": true,
      "position": 7,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 278,
          "parent_id": 21,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 618,
              "parent_id": 180,
              "name": "Kurta",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 634,
              "parent_id": 180,
              "name": "Sherwani",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Bandhgala",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 618,
              "parent_id": 180,
              "name": "Kurta Pajama",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 623,
              "parent_id": 180,
              "name": "Nehru Jackets",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 279,
          "parent_id": 21,
          "name": "More Styles",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 622,
              "parent_id": 180,
              "name": "Pathani Suit",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 633,
              "parent_id": 180,
              "name": "Dhoti Kurta",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Mens Accessories",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Mens Lower",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Blazer / Suits / Jackets",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 148,
          "parent_id": 148,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 202,
              "parent_id": 148,
              "name": "Party Wear For Mens",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 201,
              "parent_id": 148,
              "name": "Mens Wedding Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 204,
              "parent_id": 148,
              "name": "Casual Wear For Mens",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 148,
              "name": "Mens Festival Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 281,
          "parent_id": 21,
          "name": "Accessories",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 719,
              "parent_id": 181,
              "name": "Turban / Pagri",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 681,
              "parent_id": 181,
              "name": "Kantha",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 718,
              "parent_id": 181,
              "name": "Kilangi",
              "is_active": false,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 166,
          "parent_id": 21,
          "name": "Mens Wear",
          "atribute_name": "type_new",
          "is_active": false,
          "position": 5,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 272,
          "parent_id": 21,
          "name": "Menswear Menu2",
          "atribute_name": "type_new",
          "is_active": false,
          "position": 6,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 716,
              "parent_id": 181,
              "name": "Dhoti",
              "is_active": false,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 716,
              "parent_id": 181,
              "name": "All Mens Wear...",
              "is_active": false,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 7,
      "parent_id": 3,
      "name": "Indowestern",
      "is_active": true,
      "position": 8,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 97,
          "parent_id": 148,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 204,
              "parent_id": 148,
              "name": "Casual Wear",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 148,
              "name": "Festive Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 202,
              "parent_id": 148,
              "name": "Party Wear",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 201,
              "parent_id": 148,
              "name": "Wedding Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 200,
              "parent_id": 97,
              "name": "All Occasions...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 180,
          "parent_id": 30,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 609,
              "parent_id": 180,
              "name": "Kurtis",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 630,
              "parent_id": 180,
              "name": "Dresses",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 610,
              "parent_id": 180,
              "name": "Long Kurtas",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 616,
              "parent_id": 180,
              "name": "Top & Bottom Sets",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 603,
              "parent_id": 180,
              "name": "Gowns",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 609,
              "parent_id": 180,
              "name": "All Styles...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 180,
          "parent_id": 30,
          "name": "Bottoms",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 611,
              "parent_id": 180,
              "name": "Skirts",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Palazzo Pants",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 611,
              "parent_id": 180,
              "name": "Patialas",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 611,
              "parent_id": 180,
              "name": "Leggings",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 611,
              "parent_id": 180,
              "name": "Pants & Trousers",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 100,
          "parent_id": 30,
          "name": "More",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 614,
              "parent_id": 180,
              "name": "Stoles & Scarves",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 613,
              "parent_id": 180,
              "name": "Dupattas",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 612,
              "parent_id": 180,
              "name": "Jackets",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 607,
              "parent_id": 180,
              "name": "Tops",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 582,
              "parent_id": 100,
              "name": "Indowestern Lehenga",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 24,
      "parent_id": 3,
      "name": "Plus",
      "is_active": true,
      "position": 9,
      "level": 2,
      "product_count": 486,
      "children_data": [
        {
          "id": 173,
          "parent_id": 24,
          "name": "Occasion",
          "atribute_name": "occasion",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 201,
              "parent_id": 148,
              "name": "Wedding",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 148,
              "name": "Party Wear",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 203,
              "parent_id": 148,
              "name": "Festival Wear",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 204,
              "parent_id": 148,
              "name": "Casual Wear",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 200,
              "parent_id": 148,
              "name": "All Occasions...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 174,
          "parent_id": 24,
          "name": "Styles",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 5,
              "parent_id": 174,
              "name": "Salwar Kameez",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 7,
              "parent_id": 174,
              "name": "Indowestern",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 5,
              "parent_id": 174,
              "name": "Sarees",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 12,
              "parent_id": 174,
              "name": "Blouses",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 174,
              "name": "More Styles...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 175,
          "parent_id": 24,
          "name": "Fabric",
          "atribute_name": "fabric",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 496,
              "parent_id": 175,
              "name": "Georgette",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 497,
              "parent_id": 175,
              "name": "Net",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 498,
              "parent_id": 175,
              "name": "Art Silk",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 499,
              "parent_id": 175,
              "name": "Velvet",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 500,
              "parent_id": 175,
              "name": "All Fabrics...",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 181,
          "parent_id": 24,
          "name": "Favorites",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 596,
              "parent_id": 180,
              "name": "Abaya Style Suits",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 610,
              "parent_id": 180,
              "name": "Kurtas",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Bottoms",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 504,
              "parent_id": 180,
              "name": "Straight Cut Suits",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 6,
              "parent_id": 180,
              "name": "Lehenga",
              "is_active": false,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 9,
              "parent_id": 180,
              "name": "Menswear",
              "is_active": false,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
    {
      "id": 14,
      "parent_id": 3,
      "name": "Jewelry",
      "is_active": true,
      "position": 11,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 162,
          "parent_id": 31,
          "name": "Style",
          "atribute_name": "subtype",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 636,
              "parent_id": 180,
              "name": "Earrings",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 635,
              "parent_id": 180,
              "name": "Necklaces",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 637,
              "parent_id": 180,
              "name": "Bangle & Sets",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 640,
              "parent_id": 180,
              "name": "Rings",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 641,
              "parent_id": 180,
              "name": "Anklets",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 421,
              "parent_id": 180,
              "name": "More Styles...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 163,
          "parent_id": 31,
          "name": "Work",
          "atribute_name": "work",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 779,
              "parent_id": 182,
              "name": "American Diamonds",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 778,
              "parent_id": 182,
              "name": "Stone Studded",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 754,
              "parent_id": 182,
              "name": "Pearls",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 751,
              "parent_id": 182,
              "name": "Kundan",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 785,
              "parent_id": 182,
              "name": "Meenakari",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 475,
              "parent_id": 182,
              "name": "All Works...",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 164,
          "parent_id": 180,
          "name": "Wedding Box",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 644,
              "parent_id": 180,
              "name": "Maang Tikka",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 647,
              "parent_id": 180,
              "name": "Nose Rings",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 642,
              "parent_id": 180,
              "name": "Bridal Sets",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Hand Jewelry",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 645,
              "parent_id": 180,
              "name": "Mangalsutra",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 165,
          "parent_id": 31,
          "name": "Trending",
          "atribute_name": "type_new",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 635,
              "parent_id": 180,
              "name": "Chokers",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 727,
              "parent_id": 180,
              "name": "Chandbalis",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 0,
              "parent_id": 180,
              "name": "Jhumkas",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 726,
              "parent_id": 180,
              "name": "Ear Cuffs",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 735,
              "parent_id": 180,
              "name": "Bracelets",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    },
         {
           "id": 18,
           "parent_id": 3,
           "name": "Concepts",
           "is_active": true,
           "position": 12,
           "level": 2,
           "product_count": 0,
           "children_data": [
             {
               "id": 244,
               "parent_id": 26,
               "name": "New Curations",
               "atribute_name": "category_id",
               "is_active": true,
               "position": 1,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 238,
                   "parent_id": 244,
                   "name": "Royal Heritage",
                   "is_active": true,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 239,
                   "parent_id": 244,
                   "name": "Embroidered Blouses",
                   "is_active": true,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 240,
                   "parent_id": 244,
                   "name": "Geometric Designs",
                   "is_active": true,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 241,
                   "parent_id": 244,
                   "name": "Ultra Violet",
                   "is_active": true,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 242,
                   "parent_id": 244,
                   "name": "Flared Silhouettes",
                   "is_active": true,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 513,
                   "parent_id": 244,
                   "name": "Beautiful Bottoms",
                   "is_active": true,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 551,
                   "parent_id": 244,
                   "name": "View All...",
                   "is_active": true,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             },
             {
               "id": 245,
               "parent_id": 26,
               "name": "Our Best Ever",
               "atribute_name": "category_id",
               "is_active": true,
               "position": 2,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 0,
                   "parent_id": 245,
                   "name": "Bollywood Special",
                   "is_active": true,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 182,
                   "parent_id": 245,
                   "name": "Metallic Shades",
                   "is_active": true,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 207,
                   "parent_id": 245,
                   "name": "Slits",
                   "is_active": true,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 208,
                   "parent_id": 245,
                   "name": "Layered Attires",
                   "is_active": true,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 185,
                   "parent_id": 245,
                   "name": "Unusual Designs",
                   "is_active": true,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 519,
                   "parent_id": 245,
                   "name": "Pastel Hues",
                   "is_active": true,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 552,
                   "parent_id": 245,
                   "name": "View All...",
                   "is_active": true,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             },
             {
               "id": 246,
               "parent_id": 26,
               "name": "Wedding Stories",
               "atribute_name": "category_id",
               "is_active": true,
               "position": 3,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 191,
                   "parent_id": 246,
                   "name": "Ring Ceremony",
                   "is_active": true,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 192,
                   "parent_id": 246,
                   "name": "Cocktail Party",
                   "is_active": true,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 193,
                   "parent_id": 246,
                   "name": "Haldi Ceremony",
                   "is_active": true,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 194,
                   "parent_id": 246,
                   "name": "Mehendi",
                   "is_active": true,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 195,
                   "parent_id": 246,
                   "name": "Sangeet Bash",
                   "is_active": true,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 197,
                   "parent_id": 246,
                   "name": "Bridal Shower",
                   "is_active": true,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 553,
                   "parent_id": 246,
                   "name": "View All...",
                   "is_active": true,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             },
             {
               "id": 248,
               "parent_id": 26,
               "atribute_name": "category_id",
               "atribute_name": "type_new",
               "is_active": true,
               "position": 4,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 237,
                   "parent_id": 248,
                   "name": "Classic Weaves",
                   "is_active": true,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 189,
                   "parent_id": 248,
                   "name": "Garden Party",
                   "is_active": true,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 198,
                   "parent_id": 248,
                   "name": "Earthy Tones",
                   "is_active": true,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 535,
                   "parent_id": 248,
                   "name": "Monotones",
                   "is_active": true,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 536,
                   "parent_id": 248,
                   "name": "Rich Embroideries",
                   "is_active": true,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 537,
                   "parent_id": 248,
                   "name": "Sheer Looks",
                   "is_active": true,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 554,
                   "parent_id": 248,
                   "name": "View All...",
                   "is_active": true,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             },
             {
               "id": 247,
               "parent_id": 26,
               "name": "Fashion Perfect",
               "atribute_name": "category_id",
               "is_active": true,
               "position": 5,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 0,
                   "parent_id": 247,
                   "name": "Asymmetricals",
                   "is_active": true,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 527,
                   "parent_id": 247,
                   "name": "Collared Necklines",
                   "is_active": true,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 528,
                   "parent_id": 247,
                   "name": "Flower Show",
                   "is_active": true,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 212,
                   "parent_id": 247,
                   "name": "Jewel Tones",
                   "is_active": true,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 213,
                   "parent_id": 247,
                   "name": "Bright Hues",
                   "is_active": true,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 204,
                   "parent_id": 247,
                   "name": "Monochrome Styles",
                   "is_active": true,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 555,
                   "parent_id": 247,
                   "name": "View All...",
                   "is_active": true,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             },
             {
               "id": 249,
               "parent_id": 26,
               "name": "Other Highlights",
               "atribute_name": "category_id",
               "is_active": false,
               "position": 6,
               "level": 3,
               "product_count": 0,
               "children_data": [
                 {
                   "id": 205,
                   "parent_id": 249,
                   "name": "Color Blocking",
                   "is_active": false,
                   "position": 1,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 221,
                   "parent_id": 249,
                   "name": "Patch Work",
                   "is_active": false,
                   "position": 2,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 223,
                   "parent_id": 249,
                   "name": "Full Sleeves",
                   "is_active": false,
                   "position": 3,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 541,
                   "parent_id": 249,
                   "name": "Border Tales",
                   "is_active": false,
                   "position": 4,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 542,
                   "parent_id": 249,
                   "name": "Retro Trends",
                   "is_active": false,
                   "position": 5,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 543,
                   "parent_id": 249,
                   "name": "Printed Trends",
                   "is_active": false,
                   "position": 6,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 },
                 {
                   "id": 556,
                   "parent_id": 249,
                   "name": "View All...",
                   "is_active": false,
                   "position": 7,
                   "level": 4,
                   "product_count": 0,
                   "children_data": [

                   ]
                 }
               ]
             }
           ]
         },
    {
      "id": 22,
      "parent_id": 3,
      "name": "Kids",
      "is_active": true,
      "position": 13,
      "level": 2,
      "product_count": 0,
      "children_data": [
        {
          "id": 283,
          "parent_id": 22,
          "name": "For Girls",
          "atribute_name": "category_id",
          "is_active": true,
          "position": 1,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 629,
              "parent_id": 180,
              "name": "Lehenga Sets",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 603,
              "parent_id": 283,
              "name": "Salwar Kameez",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 564,
              "parent_id": 283,
              "name": "Saree Sets",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 604,
              "parent_id": 283,
              "name": "Ethnic Dresses",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 605,
              "parent_id": 283,
              "name": "View All",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 284,
          "parent_id": 22,
          "name": "For Boys",
          "atribute_name": "category_id",
          "is_active": true,
          "position": 2,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 591,
              "parent_id": 284,
              "name": "Kurta Pyjama Sets",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 600,
              "parent_id": 284,
              "name": "Kids Sherwani",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 601,
              "parent_id": 284,
              "name": "Kurta Dhoti Sets",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 602,
              "parent_id": 284,
              "name": "View All",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 285,
          "parent_id": 22,
          "name": "By Colors",
          "atribute_name": "category_id",
          "is_active": true,
          "position": 3,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 367,
              "parent_id": 285,
              "name": "Purple Dresses",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 365,
              "parent_id": 285,
              "name": "Orange Dresses",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 370,
              "parent_id": 285,
              "name": "White Dresses",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 362,
              "parent_id": 285,
              "name": "Green Dresses",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 371,
              "parent_id": 285,
              "name": "Yellow Dresses",
              "is_active": true,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 368,
              "parent_id": 285,
              "name": "Red Dresses",
              "is_active": true,
              "position": 6,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 598,
              "parent_id": 285,
              "name": "Blue Dresses",
              "is_active": true,
              "position": 7,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 599,
              "parent_id": 285,
              "name": "View All",
              "is_active": true,
              "position": 8,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 125,
          "parent_id": 22,
          "name": "By Occasion",
          "is_active": true,
          "position": 4,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 436,
              "parent_id": 125,
              "name": "Wedding Dresses",
              "is_active": true,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 437,
              "parent_id": 125,
              "name": "Party Dresses",
              "is_active": true,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 435,
              "parent_id": 125,
              "name": "Festival Dresses",
              "is_active": true,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 438,
              "parent_id": 125,
              "name": "View All",
              "is_active": true,
              "position": 4,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 463,
              "parent_id": 125,
              "name": "Casual Wear",
              "is_active": false,
              "position": 5,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 137,
          "parent_id": 22,
          "name": "Lehenga",
          "is_active": false,
          "position": 5,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 138,
          "parent_id": 22,
          "name": "Salwar Sets",
          "is_active": false,
          "position": 6,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 139,
          "parent_id": 22,
          "name": "Dresses",
          "is_active": false,
          "position": 7,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 141,
          "parent_id": 22,
          "name": "Kurta Pyjama",
          "is_active": false,
          "position": 8,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 167,
          "parent_id": 22,
          "name": "All Kids Wear...",
          "is_active": false,
          "position": 9,
          "level": 3,
          "product_count": 0,
          "children_data": [

          ]
        },
        {
          "id": 273,
          "parent_id": 22,
          "name": "Kids Menu1",
          "is_active": false,
          "position": 10,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 567,
              "parent_id": 273,
              "name": "Pavada Sets for Girls",
              "is_active": false,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        },
        {
          "id": 274,
          "parent_id": 22,
          "name": "Kids Menu2",
          "is_active": false,
          "position": 11,
          "level": 3,
          "product_count": 0,
          "children_data": [
            {
              "id": 565,
              "parent_id": 274,
              "name": "Sherwani for Boys",
              "is_active": false,
              "position": 1,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 566,
              "parent_id": 274,
              "name": "Dhoti Kurta for Boys",
              "is_active": false,
              "position": 2,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            },
            {
              "id": 568,
              "parent_id": 274,
              "name": "Wedding Kidswear",
              "is_active": false,
              "position": 3,
              "level": 4,
              "product_count": 0,
              "children_data": [

              ]
            }
          ]
        }
      ]
    }
  ];

  static List<Map<String, dynamic>> menu = [
    {
      "name": "Saree",
      "Menu": [
        {
          "subname": "Occasion",
          "submenu": [
            {
              "name": "Wedding wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-pure-silk-handloom-saree-in-red-v1-smua137.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-light-purple-v1-ssf16661.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-sbha1722.jpg",
              ],
            },
            {
              "name": "Party wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-wine-and-golden-v1-spta11673.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-navy-blue-v1-syc11268.jpg",
              ],
            },
            {
              "name": "Bridal wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-silk-saree-in-red-v1-scba1755.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-silk-saree-in-red-v1-scba1755.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-art-silk-saree-in-off-white-v1-spta11616.jpg"
              ],
            },
            {
              "name": "Festive wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Bollywood wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Embroidered Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-teal-green-v1-spta11611.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Printed Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-saree-in-light-beige-v1-sew13160.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/i/k/ikat-printed-art-silk-saree-in-teal-blue-v1-sfba623.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "South Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-black-v1-smua151.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Woven Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-multicolor-v1-syc10306.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Regional Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/a/patola-woven-art-silk-saree-in-multicolor-v1-ssf18151.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/a/patola-art-silk-saree-in-purple-v1-spta11647.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Half & Half Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/h/a/half-n-half-art-silk-saree-in-mustard-and-red-v1-swna104.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/e/sequinned-crepe-half-n-half-saree-in-wine-and-black-v1-sfla531.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/e/sequinned-crepe-half-n-half-saree-in-wine-and-black-v1-sfla531.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "All Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-yellow-v1-spta11671.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Fabric",
          "submenu": [
            {
              "name": "Cotton wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Silk Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-cotton-silk-saree-in-peach-v1-sma7587.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Art Silk Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Georgette Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-navy-blue-v1-scba4430.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-navy-blue-v1-scba4430.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-navy-blue-v1-scba4430.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Chiffon Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "All Fabrics",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
          ],
        },
        {
          "subname": "More",
          "submenu": [
            {
              "name": "Blouse",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-back-cut-out-blouse-in-sky-blue-v2-uac161.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embellished-art-silk-blouse-in-black-v1-uxc708.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Petticoats",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/u/uub44.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/u/uub138.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/u/uub138.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/u/uub138.jpg",
              ],
            },
            {
              "name": "HandBags",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/k/dkj2389.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/k/dkj2389.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/k/dkj2389.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/k/dkj2389.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/k/dkj2389.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Salwar Kameez",
      "Menu": [
        {
          "subname": "Occasion",
          "submenu": [
            {
              "name": "Festive wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-navy-blue-v1-kch10655.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-rayon-a-line-suit-in-yellow-v1-kaf353.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-navy-blue-v1-kch10655.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-rayon-a-line-suit-in-yellow-v1-kaf353.jpg",
              ],
            },
            {
              "name": "Party wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-abaya-style-suit-in-royal-blue-v1-kch10673.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/c/kch919.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/c/kch919.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/c/kch919.jpg",
              ],
            },
            {
              "name": "Weding wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-maroon-v3-kch2920.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-dusty-pink-v1-kch2618.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-dusty-pink-v1-kch2618.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-dusty-pink-v1-kch2618.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-dusty-pink-v1-kch2618.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-rayon-anarkali-suit-in-black-v1-kmm97.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-pakistani-suit-in-grey-v1-kcv1816.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-pakistani-suit-in-grey-v1-kcv1816.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-pakistani-suit-in-grey-v1-kcv1816.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-pakistani-suit-in-grey-v1-kcv1816.jpg",
              ],
            },
            {
              "name": "Bollywood wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-crepe-pakistani-suit-in-grey-v1-kcv1816.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
              ],
            },
            {
              "name": "All Occasions",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-old-rose-v2-kch1009.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Anarkali Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embellished-cotton-anarkali-suit-in-off-white-v1-krx102.jpg",
              ],
            },
            {
              "name": "Straight Cut Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-straight-suit-in-dark-teal-green-v1-kch1337_4.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-straight-suit-in-dark-green-v1-kch3252.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-straight-suit-in-dark-green-v1-kch3252.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-straight-suit-in-dark-green-v1-kch3252.jpg",
              ],
            },
            {
              "name": "Abaya Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-beige-v1-kej1127.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-faux-georgette-abaya-style-suit-in-dark-purple-v1-kch2454.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-faux-georgette-abaya-style-suit-in-dark-purple-v1-kch2454.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-faux-georgette-abaya-style-suit-in-dark-purple-v1-kch2454.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-faux-georgette-abaya-style-suit-in-dark-purple-v1-kch2454.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-faux-georgette-abaya-style-suit-in-dark-purple-v1-kch2454.jpg",
              ],
            },
            {
              "name": "Pakistani Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-navy-blue-v1-kch10655.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
              ],
            },
            {
              "name": "Punjabi Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-punjabi-suit-in-mustard-v1-kch10790.jpg",
              ],
            },
            {
              "name": "All Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-navy-blue-v1-kch10655.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-beige-v1-kch10653.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Fabric",
          "submenu": [
            {
              "name": "Chanderi Silk",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/o/gota-work-art-chanderi-cotton-pakistani-suit-in-off-white-v1-kmv83.jpg",
              ],
            },
            {
              "name": "Georgette Suits",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-magenta-v1-kch10645.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-magenta-v1-kch10645.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-magenta-v1-kch10645.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-magenta-v1-kch10645.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-magenta-v1-kch10645.jpg",
              ],
            },
            {
              "name": "Cotton Suits",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-flex-anarkali-suit-in-white-v1-kmm102.jpg",
              ]
            },
            {
              "name": " Net Salwar Suit",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-abaya-style-suit-in-light-beige-and-white-v1-kch1150.jpg",
              ],
            },
            {
              "name": " Art Silk Salwar Kameez",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
              ]
            },
            {
              "name": "All Fabric",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-abaya-style-suit-in-fuchsia-v1-kch3711.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Alternates",
          "submenu": [
            {
              "name": "Kurtas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/f/o/foil-printed-rayon-cowl-style-kurta-in-fuchsia-v1-tew102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/f/o/foil-printed-rayon-cowl-style-kurta-in-fuchsia-v1-tew102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/f/o/foil-printed-rayon-cowl-style-kurta-in-fuchsia-v1-tew102.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/f/o/foil-printed-rayon-cowl-style-kurta-in-fuchsia-v1-tew102.jpg",
              ],
            },
            {
              "name": "Tunics",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-satin-silk-a-line-skirt-in-green-v1-bsm74.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-anarkali-kurta-in-sky-blue-v1-tgw2737.jpg",
              ],
            },
            {
              "name": "Dupattasr",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-cotton-jacquard-dupatta-from-banaras-in-sky-blue-v1-btz341.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/a/banarasi-dupatta-in-navy-blue-v1-btz364.jpg",
              ],
            },
            {
              "name": "Gowns",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-gown-in-navy-blue-v1-tve528.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/c/o/color-blocked-rayon-asymmetric-kurta-in-mustard-v1-tve527.jpg",
              ],
            },
            {
              "name": "Bottoms",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-cotton-jacquard-dupatta-from-banaras-in-sky-blue-v1-btz341.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/a/banarasi-dupatta-in-navy-blue-v1-btz364.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-cotton-jacquard-dupatta-from-banaras-in-sky-blue-v1-btz341.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/a/banarasi-dupatta-in-navy-blue-v1-btz364.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Lehenga",
      "Menu": [
        {
          "subname": "Occasion",
          "submenu": [
            {
              "name": "wedding wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-wine-v1-lcs410.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
              ],
            },
            {
              "name": "Party wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-and-satin-lehenga-in-teal-blue-v1-lsw38.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-teal-blue-v1-lcc2167.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-and-satin-lehenga-in-teal-blue-v1-lsw38.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-teal-blue-v1-lcc2167.jpg",
              ],
            },
            {
              "name": "Bridal wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-beige-v1-lyc1369.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-beige-v1-lyc1369.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
              ],
            },
            {
              "name": "Festive wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Bollywood wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-lehenga-in-brown-v1-lcs411.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/r/u/ruffled-georgette-lehenga-in-wine-v1-lcc1267.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Circular Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-dark-green-v1-lyc1120.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-dark-blue-v1-lyc1111.jpg",
              ]
            },
            {
              "name": "A-Line Lehenga",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-yellow-v1-lyc1613.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-beige-v1-lyc1618.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-yellow-v1-lyc1613.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-beige-v1-lyc1618.jpg",
              ],
            },
            {
              "name": "Mermaid Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/u/luf501.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/j/ljn837.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/j/ljn837.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/j/ljn837.jpg",
              ],
            },
            {
              "name": "Indo Western",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-navy-blue-v1-lcc458.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-lcc955.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-lcc955.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-lcc955.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-lcc955.jpg",
              ],
            },
            {
              "name": "All Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/u/luf501.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/j/ljn837.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/l/j/ljn837.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-navy-blue-v1-lcc458.jpg",
              ]
            },
          ],
        },
        {
          "subname": "Fabric",
          "submenu": [
            {
              "name": "Art Silk Lehenga",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-taffeta-silk-lehenga-in-navy-blue-v1-lyc927.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-dark-green-v2-lyc933.jpg",
              ],
            },
            {
              "name": "Net Lehenga",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-blue-v1-lxw865.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-grey-v1-lcc1212.jpg",
              ],
            },
            {
              "name": "Georgette Lehen",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-blue-v1-lxw865.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-net-lehenga-in-grey-v1-lcc1212.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Alternates",
          "submenu": [
            {
              "name": "Grown ",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Abaya Style Suit",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Lehenga Style Saree",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Men",
      "Menu": [
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Kurta",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-kurta-in-blue-v1-mht350.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-navy-blue-v1-muy424.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-navy-blue-v1-muy424.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-navy-blue-v1-muy424.jpg",
              ],
            },
            {
              "name": "Sherwani",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-collar-velvet-sherwani-in-black-v1-mte1450.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-layered-sherwani-in-black-v1-muy472.jpg",
              ],
            },
            {
              "name": "Bandhgala",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-terry-rayon-jodhpuri-suit-in-black-v1-mhg968.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-terry-rayon-jodhpuri-suit-in-black-v1-mhg968.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-terry-rayon-jodhpuri-suit-in-black-v1-mhg968.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-terry-rayon-jodhpuri-suit-in-navy-blue-v1-mhg972.jpg",
              ],
            },
            {
              "name": "Kurta Pajama",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-cotton-kurta-set-in-pink-v1-mly219.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-pink-v1-muy512.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-pink-v1-muy512.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-sherwani-in-pink-v1-muy512.jpg",
              ],
            },
            {
              "name": "Nehru jackets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-nehru-jacket-in-green-v1-mte1455.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-nehru-jacket-in-green-v1-mte1455.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-nehru-jacket-in-green-v1-mte1455.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-matka-silk-nehru-jacket-in-maroon-v4-mzj21.jpg",
              ],
            },
          ],
        },
        {
          "subname": "More Styles",
          "submenu": [
            {
              "name": "Pathani Suit",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-cotton-pathani-suit-in-yellow-v3-mtr2319.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-cotton-kurta-set-in-light-yellow-v1-mjy162.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-cotton-kurta-set-in-light-yellow-v1-mjy162.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-cotton-kurta-set-in-light-yellow-v1-mjy162.jpg",
              ],
            },
            {
              "name": "Dhoti Kurta",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-dhoti-kurta-in-pink-v1-mly597.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-dhoti-kurta-in-pink-v1-mly597.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/r/printed-cotton-dhoti-kurta-in-pink-v1-mly597.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-cotton-kurta-set-in-blue-v1-mly611.jpg",
              ],
            },
            {
              "name": "Mens Lower",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-turban-in-maroon-and-beige-v1-mgm44.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
              ],
            },
            {
              "name": "Blazer/ Suits/ Jackets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-blazer-in-black-v1-mte1485.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-dupion-silk-dhoti-in-maroon-v1-mte1497.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-dupion-silk-dhoti-in-maroon-v1-mte1497.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-dupion-silk-dhoti-in-maroon-v1-mte1497.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-dupion-silk-dhoti-in-light-beige-v1-mte1504.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Occasions",
          "submenu": [
            {
              "name": "Party Wear For Mens",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-asymmetric-sherwani-in-light-green-v1-mgv1373.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-asymmetric-sherwani-in-light-green-v1-mgv1373.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-jacquard-asymmetric-sherwani-in-light-green-v1-mgv1373.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/a/patola-printed-art-silk-nehru-jacket-in-sea-green-v1-mte1015.jpg",
              ],
            },
            {
              "name": "Mens Wedding Wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-nehru-jacket-in-black-v1-mxx131.jpg",
              ],
            },
            {
              "name": "Casual Wear For Mens",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/l/block-printed-pure-cotton-kurta-set-in-light-beige-v1-mee1225.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/l/block-printed-pure-cotton-kurta-set-in-light-beige-v1-mee1231.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/l/block-printed-pure-cotton-kurta-set-in-light-beige-v1-mee1231.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/l/block-printed-pure-cotton-kurta-set-in-light-beige-v1-mee1231.jpg",
              ],
            },
            {
              "name": " Mens Festival Wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/m/g/mgv138.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-sherwani-in-black-v1-muy431.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-sherwani-in-black-v1-muy431.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-sherwani-in-black-v1-muy431.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Accessories",
          "submenu": [
            {
              "name": "Turban / Pagri",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-turban-in-off-white-v1-mgm216.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-turban-in-off-white-v1-mgm216.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-turban-in-off-white-v1-mgm216.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-turban-in-off-white-v1-mgm216.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-dupion-silk-turban-in-off-white-v1-mgm216.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/f/o/foil-printed-art-silk-turban-in-red-v1-mgm236.jpg",
              ],
            },
            {
              "name": "Kantha",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/p/e/pearl-layered-kanthimala-v1-mte1200.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "IndoWestern",
      "Menu": [
        {
          "subname": "Occasion",
          "submenu": [
            {
              "name": "wedding wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Party wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Bridal wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Festive wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Bollywood wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Kurtis",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": " Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Long Kurtas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Top & Bottom Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Growns",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "All Styles",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Bottoms",
          "submenu": [
            {
              "name": "Skirts",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Palazzo pants",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Patialas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Laggings",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Pants & Trousers",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
          ],
        },
        {
          "subname": "More",
          "submenu": [
            {
              "name": "Stoles & Scarves",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Dupattas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Jackets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Tops",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": " Indowestern Lehenga",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Plus",
      "Menu": [
        {
          "subname": "Occasion",
          "submenu": [
            {
              "name": "wedding wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Party wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Bridal wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Festive wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Bollywood wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "All wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Salwar kameez",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Indowestern",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Sarees",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "More Styles",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Casual wear",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Fabric",
          "submenu": [
            {
              "name": "Georgette  ",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Net",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Art Silk",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Velvet",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "All Fabrics",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Favorites",
          "submenu": [
            {
              "name": "Abaya Style Suits",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Kurtas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Bottoms",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Straight Cut Suits",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Jewelry",
      "Menu": [
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Earrings",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
              ],
            },
            {
              "name": "Neckleaces",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-peacock-style-brahmi-nath-v1-jpm5901.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-peacock-style-brahmi-nath-v1-jpm5901.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-peacock-style-brahmi-nath-v1-jpm5901.jpg",
              ],
            },
            {
              "name": "Bangle & Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Rings",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Anklets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "More Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Work",
          "submenu": [
            {
              "name": "American Diamonds",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Stone Studded",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Pearls",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Kundan",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Meenakari",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "All Works",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Wedding Box",
          "submenu": [
            {
              "name": "Maang Tikka",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Nose Rings",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Bridal Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Hand Jewelry",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Mangalsutra",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Style",
          "submenu": [
            {
              "name": "Chokers",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Chandbalis",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Jhumkas",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Ear Cuffs",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
            {
              "name": "Bracelets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/u/kundan-bridal-set-v1-jmy1697.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Concepts",
      "Menu": [
        {
          "subname": "New Curations",
          "submenu": [
            {
              "name": "Royal Heritage",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Embroidered Blouses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Geometric Designs",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Ultra Violet",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Flared Silhouettes",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Beautiful Bottoms",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Our Best Ever",
          "submenu": [
            {
              "name": "Bollywood Special",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Metallic Shades",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Slits",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Layered Attires",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Unusual Designs",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Patel Hues",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Wedding Stories",
          "submenu": [
            {
              "name": "Ring Ceremony",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Cocktail Party",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Haldi Ceremony",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Mehendi",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Sangeet Bash",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Bridal Shower",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Worth a Glance",
          "submenu": [
            {
              "name": "Classic Weaves",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Garden Party",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Earthy Tones",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Monotones",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Rich Embroideries",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Sheer Looks",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "Fashion Pefect",
          "submenu": [
            {
              "name": "Asymmetricals",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Collared Necklines",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Flower Show",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Jewel Tones",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Bright Hues",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Monochrome Style",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
      ],
    },
    {
      "name": "Kids",
      "Menu": [
        {
          "subname": "For Girls",
          "submenu": [
            {
              "name": "Lehenga Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
              ],
            },
            {
              "name": "Salwar Kameez",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
              ],
            },
            {
              "name": "Saree Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
              ],
            },
            {
              "name": "Ethnic Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-lehenga-in-mustard-v1-ukr482.jpg",
              ],
            },
          ],
        },
        {
          "subname": "For Boys",
          "submenu": [
            {
              "name": "Kurta Pyjama Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
              ],
            },
            {
              "name": "Kids Sherwani",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
              ],
            },
            {
              "name": "Kurta Dhoti Sets",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/u/n/und297.jpg",
              ],
            },
          ],
        },
        {
          "subname": "By Colors",
          "submenu": [
            {
              "name": "Purple Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Orange Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "White Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "Green Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
            {
              "name": "Yellow Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-saree-in-off-white-and-pink-v1-sbha1427.jpg",
              ],
            },
            {
              "name": "Red Dress",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-teal-blue-v1-ssf20340.jpg",
              ],
            },
            {
              "name": "Blue Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-dark-green-v1-scba719.jpg",
              ],
            },
          ],
        },
        {
          "subname": "By Occasion",
          "submenu": [
            {
              "name": "Wedding Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-handloom-saree-in-coral-pink-v1-smua150.jpg",
              ],
            },
            {
              "name": "Party Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-syc11272.jpg",
              ],
            },
            {
              "name": "Festival Dresses",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-saree-in-red-v1-spf2506.jpg",
              ],
            },
            {
              "name": "View All",
              "imglist": [
                "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/a/kanchipuram-saree-in-off-white-v1-she4217.jpg",
              ],
            },
          ],
        },
      ],
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late BuildContext scaffoldContext;



  // static Future<String?> networkImageToBase64(dynamic imageUrl) async {
  //   http.Response response = await http.get(imageUrl);
  //   final bytes = response?.bodyBytes;
  //   return (bytes != null ? base64Encode(bytes) : null);
  // }

//  Checks
  static bool isNotEmpty(String s) {
    return s != null && s.trim().isNotEmpty;
  }

  static bool isEmpty(String s) {
    return !isNotEmpty(s);
  }

  static bool isListNotEmpty(List<dynamic> list) {
    return list != null && list.isNotEmpty;
  }

  static Future<List<int>> readImageData(String name) async {
    final ByteData data = await rootBundle.load('$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }


  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

/*  static void processHomePageData(List<dynamic> forFrontPage) {
    Map<String, List<dynamic>> groupedItems = {};
    for (var item in forFrontPage) {
      if (item is Map<String, dynamic>) {
        var resultTitle = item['resultTitle'];
        if (!groupedItems.containsKey(resultTitle)) {
          groupedItems[resultTitle] = [];
        }
        groupedItems[resultTitle]!.addAll(item['primary']);
      }
    }
    // Now you can use the grouped items as needed
    recentlyViewed = groupedItems['Recently Viewed'] ?? [];
    trendingMap = groupedItems['Products Selling like Hot Cakes'] ?? [];
    // Do something with these lists


  }*/
    static void navigateToMixCategoryLandingPage(BuildContext context, String titleLink,String urlLink) {
    var urlkey = urlLink;
    var Subfield;
    var Subvalue;
    var kcategory_id;
    developer.log("urlkey>>>>$urlkey");
    List<String> url = urlkey.split('/');
    developer.log("urllist>>>>$url");
    for (var ds in Utils.UrlKeyData) {
      if (url[0] == ds["url_key"]) {
        kcategory_id = ds["entity_id"];
      }
      if (url[1] == ds["url_key"]) {
        Subfield = ds["attribute_code"];
        Subvalue = ds["entity_id"];
      }
    }
    developer.log("Utils.category_id>>>>$kcategory_id");
    developer.log("2_Subfield2>>>>${Subfield ?? ''}");
    developer.log("2_Subvalue2>>>>${Subvalue ?? ''}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ShopBloc()),
            BlocProvider(create: (context) => ProductBloc()),
            BlocProvider(create: (context) => ShopBloc()),
          ],
          child: MixCategoryLandigPage(
            heding: titleLink,
            Subattribute_Id: '20',
            field: 'category_id',
            value: kcategory_id,
            Subfield: Subfield ?? '',
            Subvalue: Subvalue ?? '',
            Count: Utils.product_count,
            Sunatrribute_code: '',
            pageSize: '',
            condition_type: 'eq',
            SubCondition_type: 'finset',
            filterdata: [],
          ),
        ),
      ),
    );
  }


  static Future<List<int>> readImageDataFromServer(ByteData data) async {
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  // static void showCustomToast(BuildContext context, String message,int duration){
  //   showToast(
  //     message,
  //     context: context,
  //     textPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  //     textStyle: const TextStyle(fontSize: 13,color: Colors.white),
  //     backgroundColor: Colors.grey.shade900.withOpacity(0.75),
  //     animation: StyledToastAnimation.scale,
  //     reverseAnimation: StyledToastAnimation.fade,
  //     position: StyledToastPosition.top,
  //     animDuration: const Duration(milliseconds: 1500),
  //     duration:  Duration(seconds: duration),
  //     curve: Curves.elasticOut,
  //     reverseCurve: Curves.linear,
  //   );
  // }
  // static void showCustomToastCenter(BuildContext context, String message,int duration){
  //   showToast(
  //     message,
  //     context: context,
  //     textPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  //     textStyle: const TextStyle(fontSize: 13,color: Colors.white),
  //     backgroundColor: Colors.grey.shade900.withOpacity(0.9),
  //     animation: StyledToastAnimation.scale,
  //     reverseAnimation: StyledToastAnimation.fade,
  //     position: StyledToastPosition.center,
  //     animDuration: const Duration(milliseconds: 1500),
  //     duration:  Duration(seconds: duration),
  //     curve: Curves.elasticOut,
  //     reverseCurve: Curves.linear,
  //   );
  // }

  static void showPicker(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 50,
                          child: Divider(
                            thickness: 5,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Blouse Size',
                          textScaleFactor: 1.0,
                          // style: FTextStyle.loginuserblack16,
                          textAlign: TextAlign.start),
                      Expanded(
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Divider(
                                    thickness: 1,
                                  ),
                                  InkWell(
                                    child: Text('28” blouse size',
                                        textScaleFactor: 1.0,
                                        style: FTextStyle.shareItStyle,
                                        textAlign: TextAlign.start),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }

  static void showPickerShipin(context,) {
    const dataItems = [
      'Ready to Ship',
      'Within 2 days',
      'Within 7 days',
      'Within 10 days',
      'Within 15 days',
      'More than 15 days',
    ];
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (BuildContext bc) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: 40,
                      child: Divider(
                        thickness: 3,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text("SHIPS IN",
                      textScaleFactor: 1.0,
                      style: FTextStyle.H1Headings15,
                      textAlign: TextAlign.start),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(
                              height: 1,
                            ),
                            InkWell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Container(
                                  child: Text(
                                      // 'Within 2 days',
                                      dataItems[index],
                                      textScaleFactor: 1.0,
                                      style: FTextStyle.decStyle,
                                      textAlign: TextAlign.start),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showPickershort(context,) {
    const dataItemssort = [
      'Price Low to High',
      'Price High to Low',
      'New Arrivals',
      'Biggest Saving',
      'Best Sellers',
      'Most Viewed',
      'Now in Wishlists',
    ];
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: 40,
                          child: Divider(
                            thickness: 3,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text("SORT",
                          textScaleFactor: 1.0,
                          style: FTextStyle.H1Headings15,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.pink,
                          // height: 10,
                          child: ListView.builder(
                            itemCount: dataItemssort.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  const Divider(
                                    height: 1,
                                  ),
                                  InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Container(
                                        child: Text(
                                            // 'Within 2 days',
                                            dataItemssort[index],
                                            textScaleFactor: 1.0,
                                            style: FTextStyle.decStyle,
                                            textAlign: TextAlign.start),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }

  static void ShowDialog(BuildContext context, String message) {
    Timer? timer = Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                // Bottom rectangular box
                margin: EdgeInsets.only(
                    top: 40), // to push the box half way below circle
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(
                    top: 60, left: 20, right: 20), // spacing inside the box
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                child: CircleAvatar(
                  // Top Circle with icon
                  maxRadius: 40.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('images/japanlogo.png'),
                ),
              ),
            ],
          ),
        ],
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      context: context,
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialoglogin(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: FTextStyle.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const loginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogAssitens(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "I am Yet",
                    style: FTextStyle.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const loginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void ShowDialogoption(BuildContext context, String message) {
    // Timer? timer = Timer(const Duration(milliseconds: 3000), (){
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: Container(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Utsav Fashion",
                    style: FTextStyle.headingStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    message,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const loginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 12,
// color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
// (Route<dynamic> route) => false);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColorpink, // background
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(  // Bottom rectangular box
                    margin: EdgeInsets.only(top: 40), // to push the box half way below circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.only(top: 60, left: 20, right: 20), // spacing inside the box
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: CircleAvatar( // Top Circle with icon
                      maxRadius: 40.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('images/japanlogo.png'),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
           ).then((value){
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });*/
  }

  static void showZoom(context, img) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: height - 200,
                child: Column(
                  children: [
                    Align(
                      child: Container(
                        height: 5,
                        width: 30,
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          // border: Border.all(color: Colors.grey, width: 0.0),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(100, 50)),
                        ),
                        child: const Text('     '),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              // left: 20.0, right: 20, bottom: 50, top: 20),
                              left: 0,
                              right: 0,
                              bottom: 10,
                              top: 0),
                          child: InteractiveViewer(
                            minScale: 0.1,
                            child: img.contains("https")
                                ? Image.network(
                                    img,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    img,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showPickerBottom(context, img) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Align(
                            child: Container(
                              height: 5,
                              width: 30,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                // border: Border.all(color: Colors.grey, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(100, 50)),
                              ),
                              child: const Text(''),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const Text('SIMILAR PRODUCT',
                          textScaleFactor: 1.0,
                          style: FTextStyle.decStyle,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.300,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         // builder: (context) => ConceptPage( )));
                                  //         builder: (context) =>
                                  //             ProductDetailsScreen(img: img)));
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      // borderRadius: BorderRadius.circular(10.0),
                                      ),
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      img.contains("https")
                                          ? Image.network(
                                              img,
                                              fit: BoxFit.fill,
                                              height: height / 3.1,
                                              width: width / 2,
                                            )
                                          : Image.asset(
                                              img,
                                              fit: BoxFit.fill,
                                              height: height / 3.1,
                                              width: width / 2,
                                            ),
                                      // Image.asset(
                                      //
                                      //   img,
                                      //   fit: BoxFit.cover,
                                      //   height: height / 3.1,
                                      //   width: width / 2,
                                      // ),
                                      Container(
                                        // color: Colors.red,
                                        width: width / 2,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Embroidered Net Scalloped Saree in Red",
                                              textAlign: TextAlign.start,
                                              style: FTextStyle.decStyle,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '₹5000.00',
                                                    style:
                                                        FTextStyle.prizeStyle5,
                                                  ),
                                                  TextSpan(
                                                    text: ' ${Utils.currencySymbol}3000.00',
                                                    style:
                                                        FTextStyle.prizeStyle3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }

  static void showCustomToast(BuildContext context, String message,int duration){
    showToast(
      message,
      context: context,
      textPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      textStyle: const TextStyle(fontSize: 13,color: Colors.white),
      backgroundColor: Colors.grey.shade900.withOpacity(0.75),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 1500),
      duration:  Duration(seconds: duration),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
  Future<Object?> _buildDialogContent(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) => AlertDialog(
        title: Text('blured background'),
        content: Text('background should be blured and little bit darker '),
        elevation: 2,
        actions: [],
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          child: child,
          opacity: anim1,
        ),
      ),
      context: context,
    );
  }

  static void showLoader(BuildContext context) {
    if (!_isLoaderShowing) {
      _isLoaderShowing = true;
      _loaderContext = context;
      showDialog(
          context: _loaderContext!,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Center(
                child: Platform.isAndroid
                    ?   CircularProgressIndicator()
                /* ? CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 5.0,
          percent: 1.0,
          center:   Text("100%"),
          progressColor: Colors.green,
        )*/
                    : CupertinoActivityIndicator(
                  color: AppColors.primaryColorpink,
                  radius: 20,
                  animating: true,
                ),
              ),
            );
          }).then((value) => {_isLoaderShowing = false,/* Log.info('Loader hidden!')*/});
    }
  }

  static Widget image(String thumbnail) {
    try {
      String placeholder =
          "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==";
      if (thumbnail.isEmpty ?? true)
        thumbnail = placeholder;
      else {
        if (thumbnail.length % 4 > 0) {
          thumbnail +=
              '=' * (4 - thumbnail.length % 4); // as suggested by Albert221
        }
      }
      final _byteImage = Base64Decoder().convert(thumbnail);
      Widget image = Image.memory(_byteImage);
      return image;
    } catch (e) {
      String placeholder =
          "iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==";
      final _byteImage = Base64Decoder().convert(placeholder);
      Widget image = Image.memory(_byteImage);
      return image;
    }
  }
  static  String imageConverter(String img) {

    var arr = img.split('/');
    var ind = arr.indexOf("small_image");
    arr[ind] = "image";
    arr[ind + 1] = "1000x";
    var repImag =
    arr.toString().replaceAll(",", "/");
    repImag = repImag.replaceAll(" ", "");
    repImag = repImag.replaceAll("[", "");
    repImag = repImag.replaceAll("]", "");
    return  repImag;
  }
  // static  String Urlparser(String producturl) {
  //
  //   var productarr = producturl.split('/');
  //   var productindx = productarr.indexOf(element);
  //   var productdata =  productarr[productindx + 1];
  //   return  productdata;
  // }
  static String Urlparser(String producturl) {
    var productarr = producturl.split('/');
    var lastProductIndex = productarr.length - 1;
    var productdata = productarr[lastProductIndex];
    return productdata;
  }
  static void hideLoader() {
    if (_isLoaderShowing && _loaderContext != null) {
      Navigator.pop(_loaderContext!);
      _loaderContext = null;
    }
  }

  static void hideLoadingDialog() {
    if (_isLoadingDialogShowing && _loadingDialoContext != null) {
      Navigator.pop(_loadingDialoContext!);
      _loadingDialoContext = null;
    }
  }

  static void hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static ThemeData getAppThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      canvasColor: Colors.transparent,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    );
  }

  static DateTime convertDateFromString(String strDate) {
    DateTime date = DateTime.parse(strDate);
    // var formatter = new DateFormat('yyyy-MM-dd');
    return date;
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    final String string =
        '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
    String mvalue = '';
    if (string[0] == '-') {
      mvalue = '';
    } else {
      mvalue = string;
    }
    return '${mvalue}';
  }
}


class Util {
  static double remap(
      double value,
      double originalMinValue,
      double originalMaxValue,
      double translatedMinValue,
      double translatedMaxValue) {
    if (originalMaxValue - originalMinValue == 0) return 0;

    return (value - originalMinValue) /
            (originalMaxValue - originalMinValue) *
            (translatedMaxValue - translatedMinValue) +
        translatedMinValue;
  }
}

class ValidationUtils {
  static final RegExp _alphabetRegex = RegExp(r'^[a-zA-Z]+$');
  static final RegExp _emailRegex =
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  static bool isValidPhoneNumber(String number) {
    if (number.isEmpty || number.length < 10)
      return false;
    else
      return true;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty)
      return 'Phone number is required.';
    else if (value.length < 10 && value.length > 10)
      return 'Enter valid 10 digit phone number';
    else
      return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Please enter email address';
    return null;
  }

  static String? validatePassword(String value) {
    if (value != null && value.isEmpty) return 'Password is required.';
    return null;
  }

  static bool isValidName(String s) {
    return _alphabetRegex.hasMatch(s);
  }

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password != null && password.length >= 6;
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierColor: Colors.black38,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator()
            /* ? CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 5.0,
          percent: 1.0,
          center:   Text("100%"),
          progressColor: Colors.green,
        )*/
            : CupertinoActivityIndicator(
                color: AppColors.primary_color,
                radius: 20,
                animating: true,
              ),
      ),
    );
  }
}
