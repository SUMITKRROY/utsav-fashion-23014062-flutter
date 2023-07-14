import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:utsav/Model/ProductSimilarModel.dart';
import 'package:utsav/Model/SizeRegularModel.dart';

import 'package:utsav/screens/Home/Webview.dart';
import 'package:utsav/screens/Home/howToMeasure.dart';
import 'package:utsav/screens/Home/sizeChartCm.dart';
import 'package:utsav/screens/Login/login_screen.dart';
import 'package:utsav/screens/ShopPage/MixCategoryLandingPage.dart';
import 'package:utsav/screens/ShoppingBag/ShoppingBloc/shopping_bloc.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
 import 'package:utsav/utils/utils.dart';
import 'package:xml2json/xml2json.dart';
import '../../../utils/widgets.dart';
import '../../Explore_more/Testimmonials.dart';

import '../../ShopPage/ShopBloc/shop_bloc.dart';
import '../ZoomPage.dart';
import '../returnScreen.dart';
import '../shipping.dart';
 import 'dart:developer' as developer;

import 'ProductBloc/product_bloc.dart';

class ProductsDetails extends StatefulWidget {
  String img;
  String smallimg;
  String subImgUrl;
  String label;
  String regPrice;
  String minPrice;
  String productId;

  ProductsDetails(
      {Key? key,
      required this.img,
      required this.smallimg,
      required this.subImgUrl,
      required this.label,
      required this.regPrice,
      required this.minPrice,
      required this.productId})
      : super(key: key);



  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails>
    with SingleTickerProviderStateMixin {
  List<String> images = [
    "images/SimPod/simgolg.png",
    "images/SimPod/simring.png",
  ];
  int activeIndexpd = 0;
  bool isCheck = false;
  bool _value = false;
  var dio = Dio();

  /// bundle product
  bool checkid = false;
  bool redio1 = true;
  bool redio2 = false;
  bool redio3 = false;
  bool redio4 = true;
  bool redio5 = false;
  bool redio6 = false;

  ///

  TabController? _controller;
  int _selectedIndex = 0;
  List<Widget> list = [
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'SIMILAR ITEMS',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text('YOU MAY ALSO LIKE', style: TextStyle(color: Colors.black)),
      ),
    ),
  ];

  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded5 = false;
  bool isExpanded4 = false;

  bool wishvalue = true;

  List<dynamic> CrousalImg = [];
  var zoomimg ;
  Map<String, dynamic> additionalinfo = {};
  Map<String, dynamic> highlights = {};
  var attributeId ;
  var colorfam ;
  var url_key ;
  var custom_stock_status ;
  var discount_percent ;
  var size_regular,regularsize,Sizevalue ;
  var type_new ;
    List<SizeRegular> SizedropDownList = [SizeRegular(sizeName: '', value: '', type: '')];
  Map<String, dynamic> valuedata = {};

  late List productheadingList;

  List<dynamic> gallery = [];

  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.4);

  Map<String, Map<String, dynamic>> ConfigureData = {};
  Map<String, Map<String, dynamic>> customdata = {};
  Map<String, Map<String, dynamic>> BundalData = {};
  Map<String, Map<String, dynamic>> SimpleData = {};

  var option_id;
  var dicountValue ='';

  var option_value;

  ///Bundal Product
  var Bundal_sku,Bundal_optionId,Bundal_qty,Bundal_selections,Bundal_tital;


  var sku;
  var type;

  var productId;
  var wholedata;
  var addToCartData;

  var type2 = 'Choose size...';

    Map<String, dynamic> StandSizejsonData ={};

  var addcartloding = true;
    List<dynamic> bundleproductoptions=[];
    List<dynamic> productlinks=[];
    List<dynamic> ProductSkuList=[];
  var  lable;

  var Ships;
  var Shipsvalue;

  var ProductType;
  // late Map<String, Map<String, dynamic>> cartItemdata;
  Future refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    getSizedChart("UNJ985", "XDfdUdd213oedY0", "10005", "cm");
    // UNJ985
    // getSidemenuApi(Utils.userkey, widget.productId);
    developer.log('id>>>>${widget.productId.toString()} ');
    getStandardSized("SEW12474", Utils.md5hashkey, "10005");
    getSizedChart("UNJ985", Utils.md5hashkey, "10005", "cm");
    BlocProvider.of<ProductBloc>(context).add(ProductEventhandler(widget.productId, Utils.userkey));
    BlocProvider.of<ProductBloc>(context).add(TailoringServices(Utils.userkey));
    BlocProvider.of<ProductBloc>(context).add(FallandEdging(Utils.userkey));
    BlocProvider.of<ProductBloc>(context).add(BlouseStitching(Utils.userkey));
    BlocProvider.of<ProductBloc>(context).add(PetticoatStitching(Utils.userkey));
    BlocProvider.of<ProductBloc>(context).add(NostoApiSimilarProduct(widget.productId));
    BlocProvider.of<ProductBloc>(context).add(GetsizeChart("STKA334", Utils.md5hashkey, "10005", "cm",'inchs'));
    BlocProvider.of<ProductBloc>(context).add(ColorWashEventhandler(Utils.userkey, '',));
    BlocProvider.of<ProductBloc>(context).add(CustomstockStatus(Utils.userkey, 'custom_stock_status',));
    BlocProvider.of<ProductBloc>(context).add(SizeregularApi(Utils.userkey, 'size_regular',));


    BlocProvider.of<ProductBloc>(context).add(UDesignApi("STKA334", "XDfdUdd213oedY0", "10005",'921334','sumit.roy@indicchain.com','','https://utsavfashion.mobiloitte.io/media/catalog/product/cache/1/image'
        '/1000x/040ec09b1e35df139433887a97daa66f/h/a/half-n-half-chiffon-brasso-saree-in-olive-green-and-fuchsia-v1-suf9844.jpg',));
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
    });

  }

  Map<String, String> keyValuePairs = {};

  addToCart(productData) async {
    setState(() {
      addcartloding = false;
    });

    var dio = Dio();
    print("Add Cart Api:-${AppUrl.guest_cartId}${Utils.usercartkey}/items");
    print("Add Cart Api:-http://172.16.1.247:9020/rest/default/V1/utsav/cartApi${Utils.usercartkey}/items");
    print("Add Cart productData:-${productData}");
    Response response = await dio.post(
      "${AppUrl.guest_cartId}${Utils.usercartkey}/items",
      // "http://172.16.1.247:9020/rest/default/V1/utsav/cartApi/${Utils.usercartkey}/items",
      options: Options(headers: {"Content-Type": "application/json"}),
      data: productData,
    );
    if (response.statusCode == 200) {
      print("RespByAbbToCart:-${response.data}");
      setState(() {
        addcartloding = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
        create: (context) => ShoppingBloc(),
       child: ShoppingBag(addToCartData1: response.data),
)));
      // print(response.data);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

    /*checkAndHandleNullIndex3(label) {
    var lable = label.split(' ');

    if (lable.length >= 4) {
      // Index 3 exists
      var index3Value = lable[3];

      if (index3Value != null) {

        developer.log("Value at index 3 is not null:", $index3Value);
      } else {

        developer.log("Value at index 3 is null");
      }
    } else {

      developer.log("Index 3 doesn't exist in the array");
    }
  }*/



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "images/Arrow_Back.png",
                height: 20,
                width: 22,
                // color: Colors.grey,
              ),
            ),
            title: NWidgets.kappbarheading(context, "Product Details")),
        backgroundColor: AppColors.white,
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductSuccess) {


              if (state.product != null && state.product['items'] != null && state.product['items'].isNotEmpty) {


                ProductType= state.product['items'][0]['type_id'];
                
                developer.log('ProductType>>>${ProductType}');
                final extensionAttributes = state.product['items'][0]['extension_attributes'];

                /// configurable_product_options
                if (extensionAttributes != null && extensionAttributes['configurable_product_options'] != null) {
                  final configurableProductOptions = extensionAttributes['configurable_product_options'][0];
                  if (configurableProductOptions != null) {
                    option_id = configurableProductOptions['attribute_id'];
                    final values = configurableProductOptions['values'];
                    if (values != null && values.isNotEmpty && values[0] != null) {
                      option_value = values[0]['value_index'];
                    }
                  }
                }
                /// bundle_product_options
                if (extensionAttributes != null && extensionAttributes['bundle_product_options'] != null) {
                    bundleproductoptions = extensionAttributes['bundle_product_options'];
                  final bundleproductoptionsApi = bundleproductoptions[0];
                  final bundleproductoptionsUi = bundleproductoptions[1];

                  if (bundleproductoptionsApi != null) {

                    final productlinks = bundleproductoptionsApi['product_links'];
                    if (productlinks != null && productlinks.isNotEmpty && productlinks[0] != null) {
                      Bundal_sku = productlinks[0]['sku'];
                      Bundal_optionId = productlinks[0]['option_id'];
                    }
                  }
                  if (bundleproductoptionsUi != null) {
                    Bundal_tital = bundleproductoptionsUi['title'];
                    productlinks = bundleproductoptionsUi['product_links'];
                    ProductSkuList.clear();
                    productlinks.forEach((skuName) {
                      // developer.log('skuName>>>>${skuName['sku']}');
                       ProductSkuList.add(skuName['sku']);
                    });

                    developer.log('skuName>>>>$ProductSkuList');
                  


                  }
                }
              }
              if(state.product['items'].isNotEmpty) {
                final items = state.product['items'] as List<dynamic>;
                if (items != null && items.isNotEmpty) {
                  final customAttributes = items[0]['custom_attributes'] as List<
                      dynamic>;
                  if (customAttributes != null && customAttributes.isNotEmpty) {
                    for (final attribute in customAttributes) {
                      final attributeCode = attribute['attribute_code'] as String;
                      if (attributeCode == 'meta_description') {
                        additionalinfo = attribute;
                      }
                      else if (attributeCode == 'description') {
                        highlights = attribute;
                      } else if (attributeCode == 'category_ids') {
                        attributeId = attribute;
                      } else if (attributeCode == 'colorfam') {
                        colorfam = attribute;
                      } else if (attributeCode == 'type_new') {
                        type_new = attribute;
                      } else if (attributeCode == 'discount_percent') {
                        discount_percent = attribute;
                      } else if (attributeCode == 'size_regular') {
                        size_regular = attribute;
                        List<dynamic> lable = size_regular['value'].split(',');

                        developer.log('size_regular>>${lable.length}');
                        developer.log('size_regular>>${size_regular['value']}');
                        developer.log('size_regular>>${lable}');
                        SizedropDownList.clear();
                        for (var sizeregular in Utils.SizeregularApi) {
                          for (var lablesizeregular in lable) {

                            if (sizeregular['value'] == lablesizeregular) {
                              regularsize = sizeregular['label'];
                              Sizevalue = sizeregular['value'];
                              SizedropDownList.add(SizeRegular(sizeName: sizeregular['label'], value:sizeregular['value'], type: ''));
                              developer.log(
                                  'regularsize>>${sizeregular['label']}');
                              developer.log(
                                  'sizevalue>>${sizeregular['value']}');
                            }
                          }
                        }
                      } else if (attributeCode == 'custom_stock_status') {
                        custom_stock_status = attribute;
                        Utils.custom_stock_status.forEach((customstatus) {
                          if (customstatus['value'] == custom_stock_status['value']) {
                            Ships = customstatus['label'];
                            Shipsvalue = customstatus['value'];
                            developer.log('Ships>>${customstatus['label']}');
                            developer.log(
                                'Shipsvalue>>${customstatus['value']}');
                          }
                        });
                      }
                    }
                  }
                }


                final mediaGalleryEntries = state
                    .product['items'][0]['media_gallery_entries'] as List<
                    dynamic>;
                if (CrousalImg.isEmpty || (mediaGalleryEntries != null &&
                    CrousalImg.length > mediaGalleryEntries.length)) {
                  CrousalImg.clear();
                  if (mediaGalleryEntries != null) {
                    for (final entry in mediaGalleryEntries) {
                      final file = entry['file'] as String;
                      if (file != null) {
                        CrousalImg.add(widget.subImgUrl + file);
                      }
                    }
                  }
                }

                Map<String, dynamic> customAttributesMap = {};
                state.product['items'][0]['custom_attributes'].forEach((
                    customAttribute) {
                  String attributeCode = customAttribute["attribute_code"];

                  if (attributeCode == "meta_description") {
                    String value = customAttribute["value"];

                    List<String> substrings = value.toString().split(", ");
                    for (String substring in substrings) {
                      List<String> keyValue = substring.split(": ");
                      if (keyValue.length == 2) {
                        // check if the substring contains a colon separator
                        keyValuePairs[keyValue[0]] = keyValue[1];
                      }
                    }

                    customAttributesMap["meta_description"] = value;
                  }
                });


                if (highlights != null) {
                  final higligtparse = highlights['value'] as String;
                  final parsedValue = higligtparse
                      .replaceAll('<ul>', '')
                      .replaceAll('</ul>', '')
                      .replaceAll('</li>', '')
                      .replaceAll('<li>', ',');
                  productheadingList = parsedValue.split(',');
                }

                Map<String, dynamic> colorWashjsonData =
                json.decode(Utils.colorWash ?? '');
                Map<String, dynamic> tailoringservicesjsonData =
                json.decode(Utils.tailoringServices ?? '');
                Map<String, dynamic> fallandEdgingjsonData =
                json.decode(Utils.FallandEdging ?? '');

                ConfigureData = {
                  "cartItem": {
                    "sku": state.product['items'][0]['sku'],
                    "qty": 1,
                    "quote_id": '${Utils.usercartkey}',
                    "product_option": {
                      "extension_attributes": {
                        "configurable_item_options": [
                          {
                            "option_id": "${option_id}",
                            "option_value": "${option_value}"
                          }
                        ]
                      }
                    }
                  }
                };
                SimpleData = {
                  "cartItem": {
                    "sku": state.product['items'][0]['sku'],
                    "qty": 1,
                    "quote_id": '${Utils.usercartkey}',

                  }
                };
                customdata = {
                  "cartItem": {
                    "item_id": state.product['items'][0]['id'],
                    "sku": state.product['items'][0]['type_id'] == 'bundle'
                        ? state.product['items'][0]['sku'] + '_c'
                        : state.product['items'][0]['sku'],
                    "qty": 1,
                    "name": state.product['items'][0]['name'],
                    "price": state.product['items'][0]['price'],
                    "product_type": state.product['items'][0]['type_id'],
                    "quote_id": '${Utils.usercartkey}',
                    "product_option": {
                      "extension_attributes": {
                        "custom_options": [
                          {
                            "option_id": "string",
                            "option_value": "string",
                            /* "extension_attributes": {
                              "file_info": {
                                "base64_encoded_data": null,
                                "type": null,
                                "name": null
                              }
                            }*/
                          }
                        ],

                      }
                    },

                  }
                };
                BundalData = {
                  "cartItem": {
                    // "item_id": state.product['items'][0]['id'],
                    "sku": state.product['items'][0]['type_id'] == 'bundle'
                        ? state.product['items'][0]['sku'] + '_c'
                        : state.product['items'][0]['sku'],
                    "qty": 1,
                    // "name": state.product['items'][0]['name'],
                    // "price": state.product['items'][0]['price'],
                    // "product_type": state.product['items'][0]['type_id'],
                    "quote_id": '${Utils.usercartkey}',
                    "product_option": {
                      "extension_attributes": {
                        "bundle_options": [
                          {
                            "option_id": Bundal_optionId,
                            "option_qty": 1,
                            "option_selections": [
                              1
                            ],

                          }
                        ],
                      }
                    },

                  }
                };
                var addtocartdatad = {
                  "cartItem": {
                    "item_id": state.product['items'][0]['id'],
                    "sku": state.product['items'][0]['type_id'] == 'bundle'
                        ? state.product['items'][0]['sku'] + '_c'
                        : state.product['items'][0]['sku'],
                    "qty": 1,
                    "name": state.product['items'][0]['name'],
                    "price": state.product['items'][0]['price'],
                    "product_type": state.product['items'][0]['type_id'],
                    "quote_id": '${Utils.usercartkey}',
                    "product_option": {
                      "extension_attributes": {
                        "custom_options": [
                          {
                            "option_id": "string",
                            "option_value": "string",
                            "extension_attributes": {
                              "file_info": {
                                "base64_encoded_data": null,
                                "type": null,
                                "name": null
                              }
                            }
                          }
                        ],
                        "bundle_options": [
                          {
                            "option_id": Bundal_optionId,
                            "option_qty": 1,
                            "option_selections": [
                              0
                            ],
                            "extension_attributes": {}
                          }
                        ],
                        "configurable_item_options": [
                          {
                            "option_id": "${option_id ?? ''}",
                            "option_value": option_value ?? 0,
                            "extension_attributes": {}
                          }
                        ],
                        /* "downloadable_option": {
                          "downloadable_links": [
                            0
                          ]
                        },
                        "giftcard_item_option": {
                          "giftcard_amount": "string",
                          "custom_giftcard_amount": 0,
                          "giftcard_sender_name": "string",
                          "giftcard_recipient_name": "string",
                          "giftcard_sender_email": "string",
                          "giftcard_recipient_email": "string",
                          "giftcard_message": "string",
                          "extension_attributes": {
                            "giftcard_created_codes": [
                              "string"
                            ]
                          }
                        },

                        "grouped_options": [
                          {
                            "id": 0,
                            "qty": 0,
                            "extension_attributes": { }
                          }
                        ]*/
                      }
                    },
                    /* "extension_attributes": {
                      "discounts": [
                        {
                          "discount_data": {
                            "amount": 0,
                            "base_amount": 0,
                            "original_amount": 0,
                            "base_original_amount": 0
                          },
                          "rule_label": "string",
                          "rule_id": 0
                        }
                      ],
                      "negotiable_quote_item": {
                        "item_id": 0,
                        "original_price": 0,
                        "original_tax_amount": 0,
                        "original_discount_amount": 0,
                        "extension_attributes": { }
                      }
                    }*/
                  }
                };
                dicountValue = '(${discount_percent['value']}% Off)';
                lable = widget.label.split(' ');


                // if (name.length >= 4) {
                //   // Index 3 exists
                //   lable = lable[3];
                //
                //   if (lable != null) {
                //     lable = lable[2];
                //     developer.log("Value at index 3 is not null:$lable");
                //   } else {
                //
                //     developer.log("Value at index 3 is null: $lable");
                //   }
                // }
                // developer.log('label>>>${lable}');
                // developer.log('label>>>${lable[3]??lable[2]}');
                // developer.log('label>>>${widget.label}');
                // developer.log('label>>>${widget.label}');
                // developer.log('attributeId>>>$attributeId');
                // developer.log('url_key>>>$url_key');
                // developer.log('colorfam>>>$colorfam');
                // developer.log('discount_percent>>>$discount_percent');
                // developer.log('type_new>>>$type_new');
                // developer.log("attributeId::${attributeId['value']}");
                // developer.log("attributeId::${attributeId['attribute_code']}");
                // developer.log('addToCartData1>>>$ConfigureData');
                // developer.log("discount_percent::${discount_percent['value']}");
                developer.log(
                    "discount_percent::${discount_percent['attribute_code']}");

                BlocProvider.of<ProductBloc>(context).add(MeasurementWomen(
                    Utils.userkey, keyValuePairs['Gender'].toString()));

              return SizedBox(
                height: height,
                width: width,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: CrousalImg.length,
                              options: CarouselOptions(
                                  height: height / 1.5,
                                  enlargeCenterPage: true,
                                  autoPlay: false,
                                  aspectRatio: 0.78,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  viewportFraction: 1,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndexpd = index;
                                    });
                                  }),
                              itemBuilder: (context, index, realIndex) {
                                zoomimg = CrousalImg[index];
                                developer
                                    .log("CrousalImg>>${CrousalImg[index]}");
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      // left: 20.0, right: 20, bottom: 50, top: 20),
                                      left: 0,
                                      right: 0,
                                      bottom: 30,
                                      top: 0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Zoompage(
                                                    img: CrousalImg[index],
                                                  )));
                                    },
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height: height,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    height: height,
                                                    width: double.infinity,
                                                  )),
                                          fit: BoxFit.fitHeight,
                                          width: width,
                                          height: height,
                                          imageUrl: CrousalImg[index],
                                        )),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: activeIndexpd,
                                    count: CrousalImg.length,
                                    effect: ScrollingDotsEffect(
                                      strokeWidth: 5,
                                      activeDotColor:
                                          AppColors.primaryColorpink,
                                      dotColor: Colors.grey.withOpacity(0.40),
                                      dotHeight: 5.5,
                                      dotWidth: 5.5,
                                      activeDotScale: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 40.0,
                              // right: 0.0,
                              right: 5.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: InkWell(
                                    child: Container(
                                      width: 32,
                                      height: height * 0.052,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Image.asset(
                                        'images/mcards.png',
                                        scale: 4,
                                        width: width * 0.060,
                                      ),
                                    ),
                                    onTap: () {
                                      // Utils.showPickerBottom(
                                      //     context, widget.img);

                                      Future.delayed(const Duration(seconds: 0),
                                          () {
                                        print('One second has passed.');
                                        developer.log(
                                            "length>>>${Utils.productPrimaryList!.length}");
                                        showPickerBottom(
                                            context,
                                            Utils
                                                .productPrimaryList); // Prints after 1 second.
                                      });
                                    }),
                              ),
                            ),
                            Positioned(
                              bottom: 40.0,
                              // right: 0.0,
                              left: 5.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: InkWell(
                                    child: Container(
                                      width: 32,
                                      height: height * 0.052,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Image.asset(
                                        'images/addsearch.png',
                                        scale: 4,
                                        width: width * 0.060,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Zoompage(
                                                    img: zoomimg,
                                                  )));
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.label,
                                          overflow: TextOverflow.ellipsis,
                                          // "Embroidered Georgette Pakistani \nSuit in Pink",
                                          style: FTextStyle.H1Headings,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // const Spacer(),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Align(
                                      alignment:
                                          const FractionalOffset(0.6, -1.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const loginScreen()));
                                        },
                                        child: Container(
                                          width: 32,
                                          height: height * 0.052,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade200,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Image.asset(
                                            'images/navBarIcon/navWishlist.png',
                                            scale: 5,
                                            width: width * 0.060,
                                            // height: 20,
                                            color: AppColors.primaryColorpink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              NWidgets.ksizedBox10(context),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text:
                                        'SKU: ${state.product['items'][0]['sku']}',
                                    style: FTextStyle.SkUStyle,
                                    children:   <TextSpan>[
                                      TextSpan(
                                        text: '   |  ',
                                        style: FTextStyle.SkUStyle,
                                      ),
                                      TextSpan(
                                        text: Ships ,
                                        style: FTextStyle.SkUStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${ widget.regPrice}',
                                        style: FTextStyle.prizeStyle5,
                                      ),
                                      TextSpan(
                                        text:
                                            '  ${widget.minPrice} ',
                                        style: FTextStyle.prizeStyle3,
                                      ),
                                        TextSpan(
                                        text: dicountValue,
                                        style: FTextStyle.offprizeStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "(Inclusive of all taxes)",
                                    style: FTextStyle.SkUStyle,
                                  )),
                              NWidgets.ksizedBox(context),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Shipping:',
                                    style: FTextStyle.H1Headings15,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' FREE',
                                        style: FTextStyle.FreeStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              NWidgets.ksizedBox10(context),
                              const Divider(
                                height: 10,
                              ),

                              ///configurable
                              if (state.product['items'][0]['type_id'] ==  "configurable")
                                Container(
                                    child: Column(children: [
                                  NWidgets.ksizedBox10(context),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Size",
                                      style: FTextStyle.khomesubheadingStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Shodilogboxship();
                                    },
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        // borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      // color: Colors.white70.withOpacity(0.80),

                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Row(children: [
                                          Text(type2),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down)
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      NWidgets.ksizedBox5(context),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                      BlocProvider(
                                              create: (context) => ProductBloc(),
                                                 child: SizeChartCm(),
                                                )));
                                            // (Route<dynamic> route) => false);
                                            //signup screen
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerLeft),
                                          child: const Text(
                                            "Size Chart",
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                    color: AppColors
                                                        .Textcolorheadingblack,
                                                    offset: Offset(0, -2))
                                              ],
                                              decoration:
                                                  TextDecoration.underline,
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.transparent,
                                              fontWeight: FontWeight.w400,
                                              decorationColor: AppColors
                                                  .Textcolorheadingblack,
                                              decorationThickness: 1.5,
                                              fontSize: 15,
                                              decorationStyle:
                                                  TextDecorationStyle.solid,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ProductBloc(),
                                                          child: HowToMeasure(),
                                                        )));
                                            // (Route<dynamic> route) => false);
                                            // signup screen
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerLeft),
                                          child: const Text(
                                            "How To Measure",
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                    color: AppColors
                                                        .Textcolorheadingblack,
                                                    offset: Offset(0, -2))
                                              ],
                                              decoration:
                                                  TextDecoration.underline,
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.transparent,
                                              fontWeight: FontWeight.w400,
                                              decorationColor: AppColors
                                                  .Textcolorheadingblack,
                                              decorationThickness: 1.5,
                                              fontSize: 15,
                                              decorationStyle:
                                                  TextDecorationStyle.solid,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  NWidgets.ksizedBox(context),
                                ])),

                              ///bundle
                              if (state.product['items'][0]['type_id'] ==
                                  "bundle")
                                Container(
                                    child: Column(children: [
                                  NWidgets.ksizedBox10(context),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                          Text(
                                          Bundal_tital,
                                          style: FTextStyle.H1Headings15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Shodilogbox();
                                          },
                                          child: SizedBox(
                                            // color: Colors.blue,
                                            height: 12,
                                            width: 30,
                                            child: Image.asset(
                                              "images/infoIcon.png",
                                              height: 10,
                                              width: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {

                                      BlocProvider.of<ProductBloc>(context).add(BandalProductApi(ProductSkuList, Utils.userkey,));
                                      setState(() {
                                        checkid = !checkid;
                                      });
                                    },
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Selected Services: ',
                                          style: FTextStyle.H1option15,
                                        ),
                                        Text(
                                          "Unstiched Fabric + ₹0.00",
                                          style: TextStyle(
                                              color:
                                                  AppColors.primaryColorpink),
                                        ),
                                        Spacer(),
                                        Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                  checkid
                                      ? BlocBuilder<ProductBloc, ProductState>(
                                         builder: (context, state) {
                                          return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    redio1 = !redio1;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    RoundCheckBox(
                                                      isChecked: redio1,
                                                      borderColor: AppColors
                                                          .primaryColorpink,
                                                      checkedColor: AppColors
                                                          .primaryColorpink,
                                                      size: 13,
                                                      onTap: (selected) {
                                                        setState(() {
                                                          redio1 = selected!;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "Unstitched Fabric",
                                                      style:
                                                          FTextStyle.H1option15,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "+ ₹0.00",
                                                      style:
                                                          FTextStyle.H1option15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.010,
                                              ),
                                              Column(
                                                children: [
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        redio2 = !redio2;
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        RoundCheckBox(
                                                          isChecked: redio2,
                                                          borderColor: AppColors
                                                              .primaryColorpink,
                                                          checkedColor: AppColors
                                                              .primaryColorpink,
                                                          size: 13,
                                                          onTap: (selected) {
                                                            setState(() {
                                                              redio2 =
                                                                  selected!;
                                                            });
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Text(
                                                          "Made to Measure",
                                                          style: FTextStyle
                                                              .H1option15,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Text(
                                                          "+ ₹1200.00",
                                                          style: FTextStyle
                                                              .H1option15,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  redio2
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 22.0,
                                                                  top: 10),
                                                          child: Row(
                                                            // mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              const Text(
                                                                'Submit Measurement: ',
                                                                style: FTextStyle
                                                                    .H1option15,
                                                              ),
                                                              InkWell(
                                                                onTap: (){

                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => const WebViewPage(
                                                                            Url:
                                                                            AppUrl.usqaudesign_utsav,
                                                                            title: 'Just Ask',
                                                                            flag: true,
                                                                          )));



                                                                },
                                                                child: const Text(
                                                                  "Now",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .cyan),
                                                                ),
                                                              ),
                                                              const Text(
                                                                ' or ',
                                                                style: FTextStyle
                                                                    .H1option15,
                                                              ),
                                                              TextButton(
                                                                onPressed:
                                                                    () {},
                                                                style: TextButton.styleFrom(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    minimumSize:
                                                                        const Size(
                                                                            30,
                                                                            10),
                                                                    tapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft),
                                                                child: const Text(
                                                                    "Later ",
                                                                    style:
                                                                        TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      fontFamily:
                                                                          'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolor,
                                                                    )),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  questionmarkdilogbox();
                                                                },
                                                                child: SizedBox(
                                                                  // color: Colors.blue,
                                                                  height: 12,
                                                                  width: 20,
                                                                  child: Image
                                                                      .asset(
                                                                    "images/prdDetpgBan/qmark.png",
                                                                    height: 10,
                                                                    width: 10,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * 0.010,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    redio3 = !redio3;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    RoundCheckBox(
                                                      isChecked: redio3,
                                                      borderColor: AppColors
                                                          .primaryColorpink,
                                                      checkedColor: AppColors
                                                          .primaryColorpink,
                                                      size: 13,
                                                      onTap: (selected) {
                                                        setState(() {
                                                          redio3 = selected!;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "Ready to Wear",
                                                      style:
                                                          FTextStyle.H1option15,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "+ ₹1000.00",
                                                      style:
                                                          FTextStyle.H1option15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
  },
)
                                      : const SizedBox(),
                                  NWidgets.ksizedBox(context),
                                ])),
                              NWidgets.ksizedBox10(context),
                              Container(
                                padding: const EdgeInsets.all(
                                    0), //padding of outer Container
                                child: DottedBorder(
                                  color:
                                      Colors.grey, //color of dotted/dash line
                                  strokeWidth: 1, //thickness of dash/dots
                                  dashPattern: const [5, 3],

                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: SizedBox(
                                      width: width,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            const Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Rated ',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                  TextSpan(
                                                    text: '4.4 ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "SourceSansPro",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                          ' out of 5 based on ',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                  TextSpan(
                                                    text: '2319 reviews',
                                                    style: TextStyle(
                                                      shadows: [
                                                        Shadow(
                                                            color: AppColors
                                                                .Textcolorheadingblack,
                                                            offset:
                                                                Offset(0, -2))
                                                      ],
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      color: Colors.transparent,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      decorationColor: AppColors
                                                          .Textcolorheadingblack,
                                                      decorationThickness: 1.5,
                                                      fontSize: 15,
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text: ' on',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              'images/trustIcon.png',
                                              height: 21,
                                              width: 75,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                height: 10,
                              ),
                              NWidgets.ksizedBox(context),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Product Highlights",
                                  style: FTextStyle.H1Headings15,
                                ),
                              ),
                              // NWidgets.ksizedBox(context),
                              SizedBox(
                                height: 34.0 * productheadingList.length,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: productheadingList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // developer.log("Product Highlights::${productheadingList[index]}");
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Visibility(
                                            visible: productheadingList[index]
                                                    .toString()
                                                    .isEmpty
                                                ? false
                                                : true,
                                            child: const Text(
                                              "\u2022",
                                              style: FTextStyle.bulletpoint,
                                            ),
                                          ),
                                          //bullet text
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${productheadingList[index]}",
                                              // " Art Silk Saree in Navy Blue",
                                              style: FTextStyle.subheadingStyle,
                                            ), //text
                                          )
                                        ]);
                                  },
                                ),
                              ),
                              NWidgets.ksizedBox(context),
                              Container(
                                width: width,
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    border: Border.all(
                                        color: Colors.grey.shade100)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text('Know our ',
                                            style: FTextStyle
                                                .khomesubheadingStyle),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Shipping()));
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerLeft),
                                          child: const Text(
                                            "Shipping",
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const Text(' and ',
                                            style: FTextStyle
                                                .khomesubheadingStyle),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ReturnsScreen()));
                                          },
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 30),
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              alignment: Alignment.centerLeft),
                                          child: const Text(
                                            "Return",
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const Text(' policy ',
                                            style: FTextStyle
                                                .khomesubheadingStyle),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Any Questions? ',
                                          style:
                                              FTextStyle.khomesubheadingStyle,
                                        ),
                                        InkWell(
                                          child: const Text(
                                            "Just Ask",
                                            style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const WebViewPage(
                                                          Url:
                                                              'https://help.utsavfashion.com/support/tickets/new',
                                                              // 'https://www.facebook.com/',
                                                          title: 'Just Ask',
                                                          flag: true,
                                                        )));
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      height: height * 0.010,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            final baseUrl =
                                                'https://www.facebook.com/sharer/sharer.php';
                                            final urlParam =
                                                'u=${Uri.encodeComponent(widget.smallimg)}';
                                            final quoteParam =
                                                'quote=${Uri.encodeComponent(widget.label)}';
                                            final hashtagParam =
                                                'hashtag=${Uri.encodeComponent(widget.label)}';

                                            var uri = Uri.parse(
                                                '$baseUrl?$urlParam&$quoteParam&$hashtagParam');
                                            // print(uri);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewPage(
                                                          Url: uri.toString(),
                                                          // 'https://www.facebook.com/login.php?skip_api_login=1&api_key=966242223397117&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fsharer%2Fsharer.php%3Fu%3Dhttps%253A%252F%252Fwww.utsavfashion.com%252Fproduct%252Fbanarasi-saree-in-red-snea2571-fh23%26t%3DBanarasi%2BSaree%2Bin%2BRed&cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Fclose_window%2F%3Fapp_id%3D966242223397117%26connect%3D0%23_%3D_&display=popup&locale=en_GB',
                                                          title: 'Just Ask',
                                                          flag: true,
                                                        )));
                                          },
                                          child: Image.asset(
                                            'images/soldwtlog/fb.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // print('https://twitter.com/intent/tweet?url=${widget.smallimg}&text=${widget.label.toString()}&hashtags=${widget.label}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewPage(
                                                          Url:
                                                          'https://twitter.com/intent/tweet?url=${widget.smallimg}&text=${widget.label.toString()}&hashtags=${widget.label}',
                                                          title: 'Just Ask',
                                                          flag: true,
                                                        )));
                                          },
                                          child: Image.asset(
                                            'images/soldwtlog/tw.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(widget.smallimg);
                                            print(widget.label);
                                            print(widget.label);
                                            print(
                                                'https://www.pinterest.com/pin/create/button/?url=${Uri.encodeComponent("https://www.utsavfashion.com/product/banarasi-silk-saree-in-off-white-snea2594-fh23")}&media=${Uri.encodeComponent(widget.smallimg)}&description=${Uri.encodeComponent(widget.label)}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewPage(
                                                          Url:
                                                          'https://www.pinterest.com/pin/create/button/?url=${Uri.encodeComponent("https://www.utsavfashion.com/product/banarasi-silk-saree-in-off-white-snea2594-fh23")}&media=${Uri.encodeComponent(widget.smallimg)}&description=${Uri.encodeComponent(widget.label)}',
                                                          title: 'Just Ask',
                                                          flag: true,
                                                        )));
                                          },
                                          child: Image.asset(
                                            'images/soldwtlog/pint.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),

                              NWidgets.ksizedBox(context),

                              NWidgets.ksizedBox(context),

                              SizedBox(
                                height: 420,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 0),
                                      child: TabBar(
                                        onTap: (index) {},
                                        labelStyle:
                                            FTextStyle.poducthedingStyle,
                                        indicatorColor:
                                            AppColors.primaryColorpink,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        indicatorWeight: 3,
                                        labelColor: Colors.black,
                                        controller: _controller,
                                        tabs: list,
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _controller,
                                        children: [
                                          SizedBox(
                                            // color: Colors.cyan,
                                            height: 350,
                                            child: ListView.builder(
                                              controller: _pageController,
                                              itemCount:
                                                  Utils.productPrimaryList!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => ProductsDetails(
                                                    //               img: img,
                                                    //               label: '',
                                                    //               regPrice: '',
                                                    //               minPrice: '',
                                                    //               productId: '', subImgUrl: '',
                                                    //             )));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(2.5, 0, 0, 0),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          width: width / 2,
                                                          child: Column(
                                                            children: [
                                                              Card(
                                                                color: Colors
                                                                    .white,
                                                                shape: const RoundedRectangleBorder(
                                                                    // borderRadius: BorderRadius.circular(10.0),
                                                                    ),
                                                                elevation: 0,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Image
                                                                        .network(
                                                                      Utils
                                                                          .productPrimaryList[
                                                                              index]
                                                                          .imageUrl,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      // '',
                                                                      Utils
                                                                          .productPrimaryList[
                                                                              index]
                                                                          .name,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FTextStyle
                                                                          .decStyle,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text.rich(
                                                                      TextSpan(
                                                                        text:
                                                                            '',
                                                                        children: <
                                                                            TextSpan>[
                                                                          TextSpan(
                                                                            // text:  '',
                                                                            text:
                                                                                '${Utils.currencySymbol +  Utils.productPrimaryList[index].listPrice.toStringAsFixed(2)}',
                                                                            style:
                                                                                FTextStyle.prizeStyle5,
                                                                          ),
                                                                          TextSpan(
                                                                            // text: '  ',
                                                                            text:
                                                                                ' ${Utils.currencySymbol + Utils.productPrimaryList[index].price.toStringAsFixed(2)}',
                                                                            style:
                                                                                FTextStyle.prizeStyle3,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // margin: EdgeInsets.all(10),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            // color: Colors.cyan,
                                            height: 350,
                                            child: ListView.builder(
                                              controller: _pageController,
                                              itemCount:
                                                  Utils.new_ArrivalsList!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => ProductsDetails(
                                                    //               img: img,
                                                    //               label: '',
                                                    //               regPrice: '',
                                                    //               minPrice: '',
                                                    //               productId: '', subImgUrl: '',
                                                    //             )));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(2.5, 0, 0, 0),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          width: width / 2,
                                                          child: Column(
                                                            children: [
                                                              Card(
                                                                color: Colors
                                                                    .white,
                                                                shape: const RoundedRectangleBorder(
                                                                    // borderRadius: BorderRadius.circular(10.0),
                                                                    ),
                                                                elevation: 0,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Image
                                                                        .network(
                                                                      Utils
                                                                          .new_ArrivalsList![
                                                                              index]
                                                                          .imageUrl,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      // '',
                                                                      Utils
                                                                          .new_ArrivalsList[
                                                                              index]
                                                                          .name,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FTextStyle
                                                                          .decStyle,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text.rich(
                                                                      TextSpan(
                                                                        text:
                                                                            '',
                                                                        children: <
                                                                            TextSpan>[
                                                                          TextSpan(
                                                                            // text:  '',
                                                                            text:
                                                                            '${Utils.currencySymbol +  Utils.new_ArrivalsList[index].listPrice.toStringAsFixed(2)}',
                                                                            style:
                                                                            FTextStyle.prizeStyle5,
                                                                          ),
                                                                          TextSpan(
                                                                            // text: '  ',
                                                                            text:
                                                                            ' ${Utils.currencySymbol + Utils.new_ArrivalsList[index].price.toStringAsFixed(2)}',
                                                                            style:
                                                                            FTextStyle.prizeStyle3,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // margin: EdgeInsets.all(10),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              NWidgets.ksizedBox(context),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Recently Viewed".toUpperCase(),
                                  style: FTextStyle.H1Headings,
                                ),
                              ),
                              NWidgets.ksizedBox10(context),
                              const Divider(
                                height: 10,
                              ),
                              NWidgets.ksizedBox10(context),
                              SizedBox(
                                // color: Colors.cyan,
                                height: 350,
                                child: ListView.builder(
                                  controller: _pageController,
                                  itemCount: Utils.trendingMap!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => ProductsDetails(
                                        //               img: img,
                                        //               label: '',
                                        //               regPrice: '',
                                        //               minPrice: '',
                                        //               productId: '', subImgUrl: '',
                                        //             )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            2.5, 0, 0, 0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: width / 2,
                                              child: Column(
                                                children: [
                                                  Card(
                                                    color: Colors.white,
                                                    shape: const RoundedRectangleBorder(
                                                        // borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                    elevation: 0,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Image.network(
                                                          Utils
                                                              .trendingMap![
                                                                  index]
                                                              .imageUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            Utils
                                                                .trendingMap![
                                                                    index]
                                                                .name,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: FTextStyle
                                                                .decStyle,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              text: '',
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text:
                                                                      '${Utils.currencySymbol}${Utils.trendingMap![index].listPrice.toStringAsFixed(2)}',
                                                                  style: FTextStyle
                                                                      .prizeStyle5,
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      '  ${Utils.currencySymbol}${Utils.trendingMap![index].price.toStringAsFixed(2)}',
                                                                  style: FTextStyle
                                                                      .prizeStyle3,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // margin: EdgeInsets.all(10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              if (state.product['items'][0]['type_id'] == "bundle")
                                Container(
                                    child: Column(children: [
                                  NWidgets.ksizedBox(context),
                                  NWidgets.ksizedBox10(context),
                                  NWidgets.ksizedBox10(context),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        const Text(
                                          "More Options",
                                          style: FTextStyle.H1Headings15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ShodilogboxMoreOpt();
                                          },
                                          child: SizedBox(
                                            // color: Colors.blue,
                                            height: 12,
                                            width: 30,
                                            child: Image.asset(
                                              "images/infoIcon.png",
                                              height: 10,
                                              width: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  NWidgets.ksizedBox10(context),
                                  NWidgets.dividerlight(context),
                                  NWidgets.ksizedBox10(context),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 20),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              redio4 = !redio4;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              RoundCheckBox(
                                                isChecked: redio4,
                                                borderColor:
                                                    AppColors.primaryColorpink,
                                                checkedColor:
                                                    AppColors.primaryColorpink,
                                                size: 13,
                                                onTap: (selected) {
                                                  setState(() {
                                                    redio4 = selected!;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "None",
                                                style: FTextStyle.H1option15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "+${Utils.currencySymbol}0.00",
                                                style: FTextStyle.H1option15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              redio5 = !redio5;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              RoundCheckBox(
                                                isChecked: redio5,
                                                borderColor:
                                                    AppColors.primaryColorpink,
                                                checkedColor:
                                                    AppColors.primaryColorpink,
                                                size: 13,
                                                onTap: (selected) {
                                                  setState(() {
                                                    redio5 = selected!;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Pre-Stitched Saree",
                                                style: FTextStyle.H1option15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "+${Utils.currencySymbol}1200.00",
                                                style: FTextStyle.H1option15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              redio6 = !redio6;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              RoundCheckBox(
                                                isChecked: redio6,
                                                borderColor:
                                                    AppColors.primaryColorpink,
                                                checkedColor:
                                                    AppColors.primaryColorpink,
                                                size: 13,
                                                onTap: (selected) {
                                                  setState(() {
                                                    redio6 = selected!;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Ready to Wear",
                                                style: FTextStyle.H1option15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "+${Utils.currencySymbol}1000.00",
                                                style: FTextStyle.H1option15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      ExpansionTile(
                                        trailing: Icon(
                                          isExpanded
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          color: isExpanded
                                              ? AppColors.primaryColorpink
                                              : Colors.grey,
                                        ),
                                        title: Text(
                                          "Additional Info",
                                          style: TextStyle(
                                              fontFamily: 'NotoSans',
                                              fontSize: 16,
                                              color: isExpanded
                                                  ? AppColors.primaryColorpink
                                                  : Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text('Occasion',
                                                          style: FTextStyle
                                                              .khomesubheadingStyle),
                                                      const Spacer(),
                                                      SizedBox(
                                                        width: width / 3,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              keyValuePairs[
                                                                      'Occasion']
                                                                  .toString(),
                                                              // additionalinfo['Occasion'].toString(),
                                                              style: FTextStyle
                                                                  .khomesubheadingStyle),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  NWidgets.divider(context),
                                                  if (keyValuePairs['Fabric'] !=
                                                      null)
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              height * 0.010,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                                'Fabric	',
                                                                style: FTextStyle
                                                                    .khomesubheadingStyle),
                                                            const Spacer(),
                                                            SizedBox(
                                                              width: width / 3,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    keyValuePairs[
                                                                            'Fabric']
                                                                        .toString(),
                                                                    // additionalinfo[
                                                                    //         'Fabric']
                                                                    //     .toString(),
                                                                    style: FTextStyle
                                                                        .khomesubheadingStyle),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        NWidgets.divider(
                                                            context),
                                                      ],
                                                    ),
                                                  SizedBox(
                                                    height: height * 0.010,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Color',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          color: AppColors
                                                              .Textcolorheading,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        width: width / 3,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              keyValuePairs[
                                                                      'Color']
                                                                  .toString(),
                                                              // additionalinfo[
                                                              //         'Color']
                                                              //     .toString(),
                                                              style: FTextStyle
                                                                  .khomesubheadingStyle),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  NWidgets.divider(context),
                                                  SizedBox(
                                                    height: height * 0.010,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.010,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Work',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          color: AppColors
                                                              .Textcolorheading,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        width: width / 3,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              keyValuePairs[
                                                                      'Work']
                                                                  .toString(),
                                                              // additionalinfo[
                                                              //         'Work']
                                                              //     .toString(),
                                                              style: FTextStyle
                                                                  .khomesubheadingStyle),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  NWidgets.divider(context),
                                                  SizedBox(
                                                    height: height * 0.010,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Country of Origin',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SourceSansPro',
                                                          color: AppColors
                                                              .Textcolorheading,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      SizedBox(
                                                        width: width / 3,
                                                        child: const Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text('India',
                                                              style: FTextStyle
                                                                  .khomesubheadingStyle),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  NWidgets.divider(context),
                                                  SizedBox(
                                                    height: height * 0.010,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          'Manufactured  \nPacked & Marketed by',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SourceSansPro',
                                                            color: AppColors
                                                                .Textcolorheading,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width / 3,
                                                        child: const Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              'Utsav Fashion Private Limited',
                                                              style: FTextStyle
                                                                  .khomesubheadingStyle),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        onExpansionChanged: (value) {
                                          setState(() {
                                            isExpanded = value;
                                          });
                                        },
                                      ),
                                      isExpanded
                                          ? const SizedBox()
                                          : Visibility(
                                              visible:  state.product['items'][0]['type_id'] !="simple"?!isExpanded3:!isExpanded1,
                                              child: const Divider(
                                                // height: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                      if (state.product['items'][0]['type_id'] != "simple"&&state.product['items'][0]['type_id'] != "configurable")
                                        ExpansionTile(
                                          trailing: Icon(
                                            isExpanded1
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: isExpanded1
                                                ? AppColors.primaryColorpink
                                                : Colors.grey,
                                          ),
                                          title: Text(
                                            tailoringservicesjsonData[
                                                "TailoringServices"]["title"],
                                            style: TextStyle(
                                                fontFamily: 'NotoSans',
                                                fontSize: 16,
                                                color: isExpanded1
                                                    ? AppColors.primaryColorpink
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                // color: Colors.black12,
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 350,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            tailoringservicesjsonData[
                                                                        "TailoringServices"]
                                                                    ["list"]
                                                                .length,
                                                        // The number of items in the list
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          // This function is called for each item in the list
                                                          return Column(
                                                            children: [
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  tailoringservicesjsonData["TailoringServices"]
                                                                              [
                                                                              "list"]
                                                                          [
                                                                          index]
                                                                      ["title"],
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          'SourceSansPro',
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              NWidgets
                                                                  .ksizedBox10(
                                                                      context),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                          "\u2022",
                                                                          style:
                                                                              FTextStyle.H1Headings15,
                                                                        ),
                                                                        //bullet text
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        //space between bullet and text
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            tailoringservicesjsonData["TailoringServices"]["list"][index]["message_text"],
                                                                            style:
                                                                                FTextStyle.subheadingStyle,
                                                                          ), //text
                                                                        )
                                                                      ]),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          onExpansionChanged: (value) {
                                            setState(() {
                                              isExpanded1 = value;
                                            });
                                          },
                                        ),
                                      if (state.product['items'][0]['type_id'] !="simple" && state.product['items'][0]['type_id'] != "configurable")
                                        isExpanded1
                                            ? const SizedBox()
                                            : Visibility(
                                                visible:!isExpanded2,
                                                child: const Divider(
                                                  // height: 10,
                                                  color: Colors.black,
                                                ),
                                              ),

                                      ///configurable
                                      if (state.product['items'][0]['type_id'] != "configurable" &&
                                          state.product['items'][0]['type_id'] !="simple")
                                        ExpansionTile(
                                          trailing: Icon(
                                            isExpanded2
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: isExpanded2
                                                ? AppColors.primaryColorpink
                                                : Colors.grey,
                                          ),
                                          title: Text(
                                            fallandEdgingjsonData[
                                                "FallandEdging"]["title"],
                                            style: TextStyle(
                                                fontFamily: 'NotoSans',
                                                fontSize: 16,
                                                color: isExpanded2
                                                    ? AppColors.primaryColorpink
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          children: <Widget>[
                                            ListTile(
                                              title: Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                // color: Colors.black12,
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 350,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            fallandEdgingjsonData[
                                                                        "FallandEdging"]
                                                                    ["list"]
                                                                .length,
                                                        // The number of items in the list
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          // This function is called for each item in the list
                                                          return Column(
                                                            children: [
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  fallandEdgingjsonData["FallandEdging"]
                                                                              [
                                                                              "list"]
                                                                          [
                                                                          index]
                                                                      ["title"],
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          'SourceSansPro',
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              NWidgets
                                                                  .ksizedBox10(
                                                                      context),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                          "",
                                                                          style:
                                                                              FTextStyle.H1Headings15,
                                                                        ),
                                                                        //bullet text
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        //space between bullet and text
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            fallandEdgingjsonData["FallandEdging"]["list"][index]["message_text"],
                                                                            style:
                                                                                FTextStyle.subheadingStyle,
                                                                          ), //text
                                                                        )
                                                                      ]),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          onExpansionChanged: (value) {
                                            setState(() {
                                              isExpanded2 = value;
                                            });
                                          },
                                        ),
                                      if (state.product['items'][0]['type_id'] != "configurable" &&
                                          state.product['items'][0]['type_id'] != "simple")
                                        isExpanded2
                                            ? const SizedBox()
                                            : Visibility(
                                                visible: !isExpanded3,
                                                child: const Divider(
                                                  // height: 10,
                                                  color: Colors.black,
                                                ),
                                              ),
                                      ExpansionTile(
                                        trailing: Icon(
                                          isExpanded3
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          color: isExpanded2
                                              ? AppColors.primaryColorpink
                                              : Colors.grey,
                                        ),
                                        title: Text(
                                          colorWashjsonData["ColorandWashCare"]
                                              ["title"],
                                          style: TextStyle(
                                              fontFamily: 'NotoSans',
                                              fontSize: 16,
                                              color: isExpanded3
                                                  ? AppColors.primaryColorpink
                                                  : Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              // color: Colors.black12,
                                              color: Colors.white,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 350,
                                                    child: ListView.builder(
                                                      itemCount: colorWashjsonData[
                                                                  "ColorandWashCare"]
                                                              ["list"]
                                                          .length,
                                                      // The number of items in the list
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        // This function is called for each item in the list
                                                        return Column(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                colorWashjsonData[
                                                                            "ColorandWashCare"]
                                                                        ["list"]
                                                                    [
                                                                    index]["title"],
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'SourceSansPro',
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            NWidgets
                                                                .ksizedBox10(
                                                                    context),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "\u2022",
                                                                        style: FTextStyle
                                                                            .H1Headings15,
                                                                      ),
                                                                      //bullet text
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      //space between bullet and text
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          colorWashjsonData["ColorandWashCare"]["list"][index]
                                                                              [
                                                                              "message_text"],
                                                                          style:
                                                                              FTextStyle.subheadingStyle,
                                                                        ), //text
                                                                      )
                                                                    ]),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        onExpansionChanged: (value) {
                                          setState(() {
                                            isExpanded3 = value;
                                          });
                                        },
                                      ),
                                      isExpanded3
                                          ? const SizedBox()
                                          : const Divider(
                                              color: Colors.black,
                                            ),
                                    ],
                                  ),
                                ],
                              ),

                              InkWell(
                                 onTap: (){
                                  developer.log("colorefam::${colorfam}");
                                  developer.log("colorefam::${colorfam['value']}");
                                  developer.log("colorefam::${colorfam['attribute_code']}");
                                  developer.log("attributeId::${attributeId['value']}");
                                  developer.log("attributeId::${attributeId['attribute_code']}");
                                  // developer.log(attributeId[0].toString());
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>  MultiBlocProvider(

                                             providers: [
                                               BlocProvider(
                                                 create: (context) => ShopBloc(),),
                                               BlocProvider(
                                                 create: (context) => ProductBloc(),) ,
                                               BlocProvider(
                                                 create: (context) => ShopBloc(),) ,

                                             ],
                                             child: MixCategoryLandigPage(
                                               heding: '',
                                               field: 'category_id',
                                               value:  attributeId['value'][0].toString(),
                                               Subfield: colorfam['attribute_code'],
                                               Subvalue: colorfam['value'],
                                               Count: Utils.product_count,
                                               Sunatrribute_code: type_new['attribute_code'],
                                               Subattribute_Id: type_new['value'],
                                               pageSize: '',
                                               condition_type: 'eq',
                                               SubCondition_type: 'finset', filterdata: [],

                                             ),
                                           )));
                                      },
                                child: Container(
                                  height: height / 20,
                                  width: width / 1.2,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child:   Align(
                                      alignment: Alignment.center,
                                      child: Text('MORE ${keyValuePairs['Color']==null?'':keyValuePairs['Color']!.toUpperCase()} ${lable[2]} >'.toUpperCase(),
                                      // child: Text('MORE   REGIONAL PATOLA >',
                                          style:
                                              FTextStyle.khomesubheadingStyle)),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  developer.log("colorefam::${colorfam}");
                                  developer.log("colorefam::${colorfam['value']}");
                                  developer.log("colorefam::${colorfam['attribute_code']}");
                                  developer.log("attributeId::${type_new['value']}");
                                  developer.log("attributeId::${type_new['attribute_code']}");
                                  // developer.log(attributeId[0].toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  MultiBlocProvider(

                                            providers: [
                                              BlocProvider(
                                                create: (context) => ShopBloc(),),
                                              BlocProvider(
                                                create: (context) => ProductBloc(),) ,
                                              BlocProvider(
                                                create: (context) => ShopBloc(),) ,
                                            ],
                                            child: MixCategoryLandigPage(
                                              heding: '',
                                              Subattribute_Id: '20',
                                              field: 'category_id',
                                              value:  attributeId['value'][0].toString(),
                                              Subfield: type_new['attribute_code'],
                                              Subvalue: type_new['value'],
                                              Count: Utils.product_count,
                                              Sunatrribute_code: '',
                                              pageSize: '',
                                              condition_type: 'eq',
                                              SubCondition_type: 'finset', filterdata: [],

                                            ),
                                          )));
                                },
                                child: Container(
                                  height: height / 20,
                                  width: width / 1.2,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child:   Align(
                                      alignment: Alignment.center,
                                      child: Text('MORE ${lable[2]} >'.toUpperCase(),
                                          style:
                                              FTextStyle.khomesubheadingStyle)),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  developer.log("colorefam::${colorfam}");
                                  developer.log("colorefam::${colorfam['value']}");
                                  developer.log("colorefam::${colorfam['attribute_code']}");
                                  developer.log("attributeId::${attributeId['value']}");
                                  developer.log("attributeId::${attributeId['attribute_code']}");
                                  // developer.log(attributeId[0].toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  MultiBlocProvider(

                                            providers: [
                                              BlocProvider(
                                                create: (context) => ShopBloc(),),
                                              BlocProvider(
                                                create: (context) => ProductBloc(),) ,
                                              BlocProvider(
                                                create: (context) => ShopBloc(),) ,
                                            ],
                                            child: MixCategoryLandigPage(
                                              heding: '',
                                              Subattribute_Id: '20',
                                              field: 'category_id',
                                              value:  attributeId['value'][0].toString(),
                                              Subfield: colorfam['attribute_code'],
                                              Subvalue: colorfam['value'],
                                              Count: Utils.product_count,
                                              Sunatrribute_code: '',
                                              pageSize: '',
                                              condition_type: 'eq',
                                              SubCondition_type: 'finset', filterdata: [],

                                            ),
                                          )));
                                },
                                child: Container(
                                  height: height / 20,
                                  width: width / 1.2,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child:   Align(
                                      alignment: Alignment.center,
                                      child: Text('MORE ${keyValuePairs['Color']==null?'':keyValuePairs['Color']!.toUpperCase()} ${lable[2]} >'.toUpperCase(),
                                          style:
                                              FTextStyle.khomesubheadingStyle)),
                                ),
                              ),
                              InkWell(
                                onTap: (){

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  MultiBlocProvider(

                                            providers: [
                                              BlocProvider(
                                                create: (context) => ShopBloc(),),
                                              BlocProvider(
                                                create: (context) => ProductBloc(),) ,
                                              BlocProvider(
                                                create: (context) => ShopBloc(),) ,
                                            ],
                                            child: MixCategoryLandigPage(
                                              heding: '',
                                              Subattribute_Id: '20',
                                              field: 'category_id',
                                              value:  attributeId['value'][0].toString(),
                                              Subfield: '',
                                              Subvalue: '',
                                              Count: Utils.product_count,
                                              Sunatrribute_code: '',
                                              pageSize: '',
                                              condition_type: 'eq',
                                              SubCondition_type: 'finset', filterdata: [],

                                            ),
                                          )));
                                },
                                child: Container(
                                  height: height / 20,
                                  width: width / 1.2,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child:   Align(
                                      alignment: Alignment.center,
                                      child: Text('MORE ${lable[2]} >'.toUpperCase(),
                                          style:
                                              FTextStyle.khomesubheadingStyle)),
                                ),
                              ),
                              // images/div.png
                              Row(
                                children: <Widget>[
                                  const Expanded(
                                    child: Divider(
                                      indent: 0.0,
                                      endIndent: 10.0,
                                      thickness: 1,
                                    ),
                                  ),
                                  Image.asset(
                                    'images/mus.png',
                                    height: height * 0.030,
                                    width: 30,
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      indent: 10.0,
                                      endIndent: 0.0,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Words That We Love For",
                                style: FTextStyle.H1Headings15,
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              CarouselSlider.builder(
                                itemCount: 3,
                                options: CarouselOptions(
                                    height: 50,
                                    enlargeCenterPage: true,
                                    autoPlay: false,
                                    aspectRatio: 0.78,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                    enableInfiniteScroll: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {});
                                    }),
                                itemBuilder: (context, index, realIndex) {
                                  return const Text(
                                      "\u275D They are absolutely fantastic. \n "
                                      "   Very quick respon...\u275E",
                                      textAlign: TextAlign.center,
                                      style: FTextStyle.saugataStyle);
                                },
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              const Text("Saugata",
                                  style: FTextStyle.saugataStyle),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Testimonials()));
                                },
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(30, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                child: const Text("Read More",
                                    style: FTextStyle.Readmore),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              }else{
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text('Product not Found!'),
                // ));

                return Center(child: Text('Product not Found!'),);
              }
            } else if (state is ProductFailure) {
              developer.log('');
              return const Center(child: Text('Data Not Found'));
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SizedBox(
                height: height,
                width: width,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            CarouselSlider.builder(
                              // itemCount: CrousalImg.length,
                              itemCount: 1,
                              options: CarouselOptions(
                                  height: height / 1.5,
                                  enlargeCenterPage: true,
                                  autoPlay: false,
                                  aspectRatio: 0.78,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  viewportFraction: 1,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndexpd = index;
                                    });
                                  }),
                              itemBuilder: (context, index, realIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      // left: 20.0, right: 20, bottom: 50, top: 20),
                                      left: 0,
                                      right: 0,
                                      bottom: 30,
                                      top: 0),
                                  child: InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height: height,
                                        width: double.infinity,
                                        ),
                                  ),
                                );
                              },
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.label,
                                          overflow: TextOverflow.ellipsis,
                                          // "Embroidered Georgette Pakistani \nSuit in Pink",
                                          style: FTextStyle.H1Headings,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Align(
                                      alignment:
                                          const FractionalOffset(0.6, -1.0),
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: Container(
                                          width: 32,
                                          height: height * 0.052,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade200,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Image.asset(
                                            'images/navBarIcon/navWishlist.png',
                                            scale: 5,
                                            width: width * 0.060,
                                            // height: 20,
                                            color: AppColors.primaryColorpink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              NWidgets.ksizedBox10(context),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'SKU: LCC1162',
                                    style: FTextStyle.SkUStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '   |  ',
                                        style: FTextStyle.SkUStyle,
                                      ),
                                      TextSpan(
                                        text: 'Ships in 19 days ',
                                        style: FTextStyle.SkUStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '₹${widget.minPrice}',
                                        style: FTextStyle.prizeStyle5,
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${Utils.currencySymbol}${widget.minPrice}',
                                        style: FTextStyle.prizeStyle3,
                                      ),
                                      const TextSpan(
                                        text: '  (10% Off)',
                                        style: FTextStyle.offprizeStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "(Inclusive of all taxes)",
                                    style: FTextStyle.SkUStyle,
                                  )),
                              NWidgets.ksizedBox(context),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Shipping:',
                                    style: FTextStyle.H1Headings15,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' FREE',
                                        style: FTextStyle.FreeStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              NWidgets.ksizedBox10(context),
                              const Divider(
                                height: 10,
                              ),
                              NWidgets.ksizedBox10(context),
                              Container(
                                padding: const EdgeInsets.all(
                                    0), //padding of outer Container
                                child: DottedBorder(
                                  color:
                                      Colors.grey, //color of dotted/dash line
                                  strokeWidth: 1, //thickness of dash/dots
                                  dashPattern: const [5, 3],

                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: SizedBox(
                                      width: width,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            const Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: 'Rated ',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                  TextSpan(
                                                    text: '4.4 ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "SourceSansPro",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                          ' out of 5 based on ',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                  TextSpan(
                                                    text: '2319 reviews',
                                                    style: TextStyle(
                                                      shadows: [
                                                        Shadow(
                                                            color: AppColors
                                                                .Textcolorheadingblack,
                                                            offset:
                                                                Offset(0, -2))
                                                      ],
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      color: Colors.transparent,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      decorationColor: AppColors
                                                          .Textcolorheadingblack,
                                                      decorationThickness: 1.5,
                                                      fontSize: 15,
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text: ' on',
                                                      style: FTextStyle
                                                          .khomesubheadingStyle),
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              'images/trustIcon.png',
                                              height: 21,
                                              width: 75,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                height: 10,
                              ),
                              NWidgets.ksizedBox(context),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Product Highlights",
                                  style: FTextStyle.H1Headings15,
                                ),
                              ),
                              NWidgets.ksizedBox(context),
                              Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "\u2022",
                                          style: FTextStyle.bulletpoint,
                                        ),
                                        //bullet text
                                        SizedBox(
                                          width: 5,
                                        ),

                                        Expanded(
                                          child: Text(
                                            " Art Silk Saree in Navy Blue",
                                            style: FTextStyle.subheadingStyle,
                                          ), //text
                                        )
                                      ]),
                                  NWidgets.ksizedBox5(context),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "\u2022",
                                          style: FTextStyle.bulletpoint,
                                        ),
                                        //bullet text
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "This Drape is Beautifully Enhanced with Patola Print, Resham, Zari and Patch Border Work",
                                            style: FTextStyle.subheadingStyle,
                                          ), //text
                                        )
                                      ]),
                                  NWidgets.ksizedBox5(context),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "\u2022",
                                          style: FTextStyle.bulletpoint,
                                        ),
                                        //bullet text
                                        SizedBox(
                                          width: 5,
                                        ),

                                        Expanded(
                                          child: Text(
                                            "Available with an Unstitched Art Silk Blouse in Teal Blue",
                                            style: FTextStyle.subheadingStyle,
                                          ), //text
                                        )
                                      ]),
                                  NWidgets.ksizedBox5(context),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "\u2022",
                                          style: FTextStyle.bulletpoint,
                                        ),
                                        //bullet text
                                        SizedBox(
                                          width: 5,
                                        ),

                                        Expanded(
                                          child: Text(
                                            "Free Services: Fall and Edging (Pico)",
                                            style: FTextStyle.subheadingStyle,
                                          ), //text
                                        )
                                      ]),
                                  NWidgets.ksizedBox5(context),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "\u2022",
                                          style: FTextStyle.bulletpoint,
                                        ),
                                        //bullet text
                                        SizedBox(
                                          width: 5,
                                        ),

                                        Expanded(
                                          child: Text(
                                            "Do note: Tassels and Accessories shown in the image are for presentation purposes only. (Slight variation in actual color vs. image is possible).",
                                            style: FTextStyle.subheadingStyle,
                                          ), //text
                                        )
                                      ]),
                                ],
                              ),
                              NWidgets.ksizedBox(context),
                              const Text(
                                "Words That We Love For",
                                style: FTextStyle.H1Headings15,
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              CarouselSlider.builder(
                                itemCount: 3,
                                options: CarouselOptions(
                                    height: 50,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 0.78,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                    enableInfiniteScroll: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {});
                                    }),
                                itemBuilder: (context, index, realIndex) {
                                  return const Text(
                                      "\u275D They are absolutely fantastic. \n "
                                      "   Very quick respon...\u275E",
                                      textAlign: TextAlign.center,
                                      style: FTextStyle.saugataStyle);
                                },
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              const Text("Saugata",
                                  style: FTextStyle.saugataStyle),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Testimonials()));
                                },
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(30, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                child: const Text("Read More",
                                    style: FTextStyle.Readmore),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 10,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    children:    [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.regPrice}',
                            style: FTextStyle.prizeStyle5,
                          )),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text.rich(
                          TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.minPrice}',
                                style: FTextStyle.prizeStyle3,
                              ),
                              TextSpan(
                                text: '       $dicountValue',
                                style: TextStyle(
                                  color: AppColors.pricecolor,
                                  // decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "(Inclusive of all taxes)",
                            style: FTextStyle.SkUStyle,
                          )),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox(
                    height: height * 0.062,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                         if(ProductType=='bundle'){
                           developer.log('ProductType>>>$ProductType');
                           addToCart(BundalData);
                         }else if(ProductType=='configurable'){
                           developer.log('ProductType>>>$ProductType');
                           addToCart(ConfigureData);
                         }else if(ProductType=='simple'){
                           developer.log('ProductType>>>$ProductType');
                           addToCart(SimpleData);
                         }else{
                           developer.log('ProductType>>>$ProductType');
                           addToCart(customdata);
                         }


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColorpink, // background
                      ),
                      child: Align(
                          child:addcartloding? Text(
                        "ADD TO BAG".toUpperCase(),
                        style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ):CircularProgressIndicator(color: AppColors.white,)),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Shodilogbox() {
    Map<String, dynamic> BlouseStitchingjsonData =
        json.decode(Utils.BlouseStitching);
    developer.log("Blouse Stciging:-${BlouseStitchingjsonData}");

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: SizedBox(
              height: height / 1.8,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: width,
                    color: AppColors.primaryColorpink,
                    child: Row(
                      children: [
                        Text(
                          BlouseStitchingjsonData["SemiStitchedBlouse"]
                              ["title"],
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: InkWell(
                            child: Image.asset(
                              "images/ccrossIcon.png",
                              height: 22,
                              width: 22,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: height / 2,
                      width: width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.010,
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 410,
                                    child: ListView.builder(
                                      itemCount: BlouseStitchingjsonData[
                                              "SemiStitchedBlouse"]["list"]
                                          .length, // The number of items in the list
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // This function is called for each item in the list
                                        return Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  BlouseStitchingjsonData[
                                                          "SemiStitchedBlouse"]
                                                      ["list"][index]["title"],
                                                  style: const TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    color: AppColors
                                                        .Textcolorheading,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  BlouseStitchingjsonData[
                                                              "SemiStitchedBlouse"]
                                                          ["list"][index]
                                                      ["message_text"],
                                                  style:
                                                      FTextStyle.paragrphStyle,
                                                ),
                                              ],
                                            ),
                                            NWidgets.ksizedBox10(context),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  questionmarkdilogbox() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: SizedBox(
              height: height / 3.5,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: width,
                    color: AppColors.primaryColorpink,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            ' Blouse Stitching Options',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: InkWell(
                            child: Image.asset(
                              "images/ccrossIcon.png",
                              height: 22,
                              width: 22,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: height / 2,
                      width: width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.010,
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NWidgets.ksizedBox10(context),
                                      const Text(
                                        'You can always submit your measurement after placing the order. For now, just select Customize with Made to Measure, click Add to Shopping Bag and complete order. Later on go to Account section, visit My Orders page and submit your latest measurement.',
                                        style: FTextStyle.paragrphStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getSizedChart(itemcode, keyword, appid, mes) async {
    var dio = Dio();
    print("getSizedChart itemcode:-" + itemcode);
    print("getSizedChart keyword:-" + keyword);
    print("getSizedChart appid:-" + appid);
    print("Mesurement:-" + mes);
    String data = itemcode + keyword + appid;
    print(data);
    List<int> bytes = utf8.encode(data);
    Digest md5Hash = md5.convert(bytes);
    print(md5Hash.toString());

    try {
      Response response = await dio.get(
          "${AppUrl.sizeChart}?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json&unit=${mes}");
      if (response.statusCode == 200) {
        // developer.log("SizeChartjsonDataResp:-${response.data}");

        Xml2Json xml2json = new Xml2Json();

        xml2json.parse(response.data);
        var jsondata = xml2json.toParker();
        print(jsondata.runtimeType);
        var data = json.decode(jsondata);
        developer.log("SizeChartjsonDataResp:-${data}");
      } else {
        print('Enter Data Failure');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }

    showPickerBottom(context, List<ProductPrimary> similarModel) {
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
                            itemCount: Utils.productPrimaryList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                                create: (context) =>
                                                    ProductBloc(),
                                                child: ProductsDetails(
                                                  img: Utils.productPrimaryList[index].imageUrl,
                                                  subImgUrl: AppUrl.ImgBaseUrl,
                                                  label: Utils.productPrimaryList[index].name.toString(),
                                                  regPrice: Utils.productPrimaryList[index].listPrice.toStringAsFixed(2),
                                                  minPrice: Utils.productPrimaryList[index].price.toStringAsFixed(2),
                                                  productId :Utils.Urlparser(Utils.productPrimaryList[index].url) ,
                                                  smallimg: Utils.productPrimaryList[index].imageUrl,
                                                ),
                                              )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      // borderRadius: BorderRadius.circular(10.0),
                                      ),
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        Utils.productPrimaryList[index].imageUrl,
                                        // '',
                                        fit: BoxFit.fill,
                                        height: height / 3.1,
                                        width: width / 2,
                                      ),
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
                                              // '',
                                              Utils.productPrimaryList[index].name,
                                              textAlign: TextAlign.start,
                                              style: FTextStyle.decStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    // text:  '',
                                                    text: Utils
                                                        .productPrimaryList[index]
                                                        .listPrice
                                                        .toStringAsFixed(2),
                                                    style: FTextStyle.prizeStyle5,
                                                  ),
                                                  TextSpan(
                                                    // text: '  ',
                                                    text:' ${Utils.currencySymbol + Utils.productPrimaryList[index].price.toStringAsFixed(2)}',
                                                    style: FTextStyle.prizeStyle3,
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

  getSized(itemcode, keyword, appid) async {
    var dio = Dio();

    String data = itemcode + keyword + appid;
    developer.log(data);
    List<int> bytes = utf8.encode(data);
    Digest md5Hash = md5.convert(bytes);
    print(md5Hash.toString());

    try {
      developer.log(
          "https://usqaapi.utsav.bz/api/v1/standard/sizes.svc/get?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json");
      Response response = await dio.get(
          "${AppUrl.standardsizes}?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json");
      if (response.statusCode == 200) {
      } else {
        print('Enter Data Failure');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }

  getSizedcxChart(itemcode, keyword, appid) async {
    var dio = Dio();

    String data = itemcode + keyword + appid;
    developer.log(data);
    List<int> bytes = utf8.encode(data);
    Digest md5Hash = md5.convert(bytes);
    print(md5Hash.toString());

    try {
      developer.log(
          "https://usqaapi.utsav.bz/api/v1/standard/sizes.svc/get?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json&unit=cm");
      Response response = await dio.get(
          "${AppUrl.standardsizes}?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json");
      if (response.statusCode == 200) {
      } else {
        print('Enter Data Failure');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }

  Shodilogboxship() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: SizedBox(
              height: height / 1.8,
              width: 200,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    // width: width ,
                    color: AppColors.primaryColorpink,
                    child: Row(
                      children: [
                        const Text(
                          '   Choose size',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: InkWell(
                            child: Image.asset(
                              "images/ccrossIcon.png",
                              height: 22,
                              width: 22,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: height / 2,
                      // width: width,
                      child: ListView.builder(
                        // itemCount: size.length,
                        itemCount: SizedropDownList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                   setState(() {
                                     type2 = "${SizedropDownList[index].sizeName}";
                                   });

                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(

                                    "${SizedropDownList[index].sizeName}",

                                     style: FTextStyle.H1Headings,
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
               /*   Expanded(
                    child: SizedBox(
                      height: height / 2,
                      // width: width,
                      child: ListView.builder(
                        // itemCount: size.length,
                        itemCount: StandSizejsonData["measurement"]["options"][0]["values"]
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                   setState(() {
                                     type2 = "${StandSizejsonData["measurement"]["options"][0]["values"][index]["label"]}";
                                   });

                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(

                                    "${StandSizejsonData["measurement"]["options"][0]["values"][index]["label"]}",

                                     style: FTextStyle.H1Headings,
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getStandardSized(itemcode, keyword, appid) async {
    var dio = Dio();
    print("itemcode:-" + itemcode);
    print("keyword:-" + keyword);
    print("appid:-" + appid);
    String data = itemcode + keyword + appid;
    print(data);
    List<int> bytes = utf8.encode(data);
    Digest md5Hash = md5.convert(bytes);
    print(md5Hash.toString());
    try {
      print(
          "${AppUrl.standardSize}?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json");
      Response response = await dio.get(
          "${AppUrl.standardSize}?itemcode=${itemcode}&appid=${appid}&checksum=${md5Hash.toString()}&returntype=json");
      if (response.statusCode == 200) {
        StandSizejsonData = response.data;
      } else {
        print('Enter Data Failure');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }

  ShodilogboxMoreOpt() {
    Map<String, dynamic> PetticoatStitchjsonData =
    json.decode(Utils.PetticoatStitch);
    developer.log("PetticoatSti Stciging:-${PetticoatStitchjsonData}");

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: SizedBox(
              height: height / 1.8,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: width,
                    color: AppColors.primaryColorpink,
                    child: Row(
                      children: [
                        Text(
                          PetticoatStitchjsonData["PetticoatStitching"]
                          ["title"],
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: InkWell(
                            child: Image.asset(
                              "images/ccrossIcon.png",
                              height: 22,
                              width: 22,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: height / 2,
                      width: width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: height * 0.010,
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 410,
                                    child: ListView.builder(
                                      itemCount: PetticoatStitchjsonData[
                                      "PetticoatStitching"]["list"]
                                          .length, // The number of items in the list
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // This function is called for each item in the list
                                        return Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  PetticoatStitchjsonData[
                                                  "PetticoatStitching"]
                                                  ["list"][index]["title"],
                                                  style: const TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    color: AppColors
                                                        .Textcolorheading,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  PetticoatStitchjsonData[
                                                  "PetticoatStitching"]
                                                  ["list"][index]
                                                  ["message_text"],
                                                  style:
                                                  FTextStyle.paragrphStyle,
                                                ),
                                              ],
                                            ),
                                            NWidgets.ksizedBox10(context),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<AddToModel?>addToCart(productData) async {
  //   print(productData);
  //   var dio = Dio();
  //   print("Add Cart Api:-${AppUrl.guest_cartId}${Utils.usercartkey}/items");
  //   Response response = await dio.post(
  //     "${AppUrl.guest_cartId}${Utils.usercartkey}/items",
  //     options: Options(headers: {"Content-Type": "application/json"}),
  //     data: productData,
  //   );
  //   if (response.statusCode == 200) {
  //     print("RespByAbbToCart:-${response.data}");
  //     return AddToModel.fromJson(response.data);
  //
  //
  //   } else {
  //     print('Error: ${response.statusCode}');
  //   }
  //   return null;
  // }
}
