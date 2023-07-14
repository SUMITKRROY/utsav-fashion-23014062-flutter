import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/screens/CMS/ConceptPage.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import '../../utils/widgets.dart';
import '../Filter/filterList.dart';
import 'dart:developer' as developer;

import '../ShopPage/MixCategoryLandingPage.dart';
import '../ShopPage/ShopBloc/shop_bloc.dart';
import 'ProductDetails/ProductBloc/product_bloc.dart';
class WeddingPage extends StatefulWidget {
  Map<String, dynamic> mapdata;

  WeddingPage({Key? key, required this.mapdata}) : super(key: key);

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];
  static const items = [
    'Must have',
    "Month's Best Look",
    'Top Rated Styles',
  ];

  Map<String, dynamic> mapdataa = {
    "data": [
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_04.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/ring-ceremony-concept.jpg",
        "name": "Ring "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_05.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/sangeet-gala-concept.jpg",
        "name": "Sangeet "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_07.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/mehendi-funtion-concept.jpg",
        "name": "Mehendi "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_08.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/haldi-ritual-concept.jpg",
        "name": "Haldi "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_10.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/cocktail-party-concept.jpg",
        "name": "Cocktail "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_11.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-pheras-concept.jpg",
        "name": "Wedding "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_12.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/reception-revelry-concept.jpg",
        "name": "Reception "
      },
    ]
  };

  var Subfield;
  var Subvalue;
  var kcategory_id;

  // var img =
  //     "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                "images/appBarIcon/menuIcon.png",
                height: 14,
                width: 22,
                // color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
          title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavBarBottom(
                            selectedIndex: 0,
                          )));
            },
            child: Image.asset(
              "images/welcome_icon.png",
              height: 40,
              width: 55,
              // color: Colors.grey,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/appBarIcon/search.png",
                height: 20,
                width: 20,
                // color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Stack(
                children: <Widget>[
                  InkWell(
                      child: Container(
                        // color: Colors.cyan,
                        width: 30,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/appBarIcon/cart.png",
                          height: 25,
                          width: 25,
                          // color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   ShoppingBag(addToCartData1: {},)));
                        // (Route<dynamic> route) => false);
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '5',
                        style: TextStyle(
                            color: AppColors.primaryColorpink,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // body: bottomNavigationBar,
        body: ListView(
          children: [
            // Text("Mob"),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.bordergrey,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/shipin.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 10.0),
                            const Text(
                              'SHIPS IN',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Utils.showPickerShipin(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                                width: 1.0, color: AppColors.bordergrey),
                            left: BorderSide(
                                width: 1.0, color: AppColors.bordergrey),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/filter.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 10.0),
                            const Text(
                              'FILTER',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  FilterList(Subattribute_Id: '',
                                  Sunatrribute_code: '',
                                  condition_type: '',
                                  SubCondition_type: '',
                                  field: '',
                                  Subfield: '',
                                  value: 0,
                                  Subvalue: '',
                                  heding: '',
                                  Count: 0,
                                  pageSize: '',),));
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/sort.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 10.0),
                            const Text(
                              'SORT',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Utils.showPickershort(
                          context,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            NWidgets.ksizedBox(context),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                    Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                                  widget.mapdata['READYTOSHIP']['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  // Image.network(
                  //     "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_02.gif"),
                  NWidgets.ksizedBox(context),
                    Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.mapdata['READYTOSHIP']['message_text'],
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1,
                  ),
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.mapdata['READYTOSHIP']['list'].length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(),
                      elevation: 0,
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // var imgurl = widget.mapdata['READYTOSHIP']['list'][index]['imgurl'];
                                var title = widget.mapdata['READYTOSHIP']['list'][index]['title'];
                                var urlkey = widget.mapdata['READYTOSHIP']['list'][index]['url_key'];
                                Utils.navigateToMixCategoryLandingPage(
                                    context, title, urlkey);

                                // developer.log("urlkey>>>>${urlkey}");
                                //
                                // List url = [];
                                // url = urlkey.split('/');
                                // developer.log("urllist>>>>${url}");
                                // for (var ds in Utils.UrlKeyData) {
                                //
                                //   if (url[0] == ds["url_key"]) {
                                //     kcategory_id = ds["entity_id"];
                                //   }
                                //   if (url[1] == ds["url_key"]) {
                                //     Subfield = ds["attribute_code"];
                                //     Subvalue = ds["entity_id"];
                                //
                                //
                                //   }
                                // }
                                // developer.log("Utils.category_id>>>>${kcategory_id}");
                                // developer.log("2_Subfield2>>>>${Subfield}");
                                // developer.log("2_Subvalue2>>>>${Subvalue}");
                                //
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>  MultiBlocProvider(
                                //
                                //           providers: [
                                //             BlocProvider(
                                //               create: (context) => ShopBloc(),),
                                //             BlocProvider(
                                //               create: (context) => ProductBloc(),) ,
                                //             BlocProvider(
                                //               create: (context) => ShopBloc(),) ,
                                //
                                //            ],
                                //           child: MixCategoryLandigPage(
                                //             heding: title,
                                //
                                //             Subattribute_Id: '20',
                                //
                                //             field: 'category_id',
                                //             // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                //             value:  kcategory_id,
                                //             Subfield: Subfield,
                                //             Subvalue: Subvalue,
                                //             Count: Utils.product_count,
                                //             Sunatrribute_code: '',
                                //             pageSize: '',
                                //             condition_type: 'eq',
                                //             SubCondition_type: 'finset', filterdata: [],
                                //
                                //           ),
                                //         )));
                              },
                              child: Card(
                                child: Image.network(
                                  widget.mapdata['READYTOSHIP']['list'][index]['imgurl'],
                                  fit: BoxFit.fill,
                                  height: height / 2.6,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // var imgurl = widget.mapdata['READYTOSHIP']['list'][index]['imgurl'];
                                    var title = widget.mapdata['READYTOSHIP']['list'][index]['title'];
                                    var urlkey = widget.mapdata['READYTOSHIP']['list'][index]['btn1day'][0]['url_key'];
                                    Utils.navigateToMixCategoryLandingPage(
                                        context, title, urlkey);

                                    // developer.log("urlkey>>>>${urlkey}");
                                    // List url = [];
                                    // url = urlkey.split('/');
                                    // developer.log("urllist>>>>${url}");
                                    // for (var ds in Utils.UrlKeyData) {
                                    //
                                    //   if (url[0] == ds["url_key"]) {
                                    //     kcategory_id = ds["entity_id"];
                                    //   }
                                    //   if (url[1] == ds["url_key"]) {
                                    //     Subfield = ds["attribute_code"];
                                    //     Subvalue = ds["entity_id"];
                                    //
                                    //
                                    //   }
                                    // }
                                    // developer.log("Utils.category_id>>>>${kcategory_id}");
                                    // developer.log("2_Subfield2>>>>${Subfield}");
                                    // developer.log("2_Subvalue2>>>>${Subvalue}");
                                    //
                                    //
                                    //
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>  MultiBlocProvider(
                                    //
                                    //           providers: [
                                    //             BlocProvider(
                                    //               create: (context) => ShopBloc(),),
                                    //             BlocProvider(
                                    //               create: (context) => ProductBloc(),) ,
                                    //             BlocProvider(
                                    //               create: (context) => ShopBloc(),) ,
                                    //
                                    //            ],
                                    //           child: MixCategoryLandigPage(
                                    //             heding: title,
                                    //
                                    //             Subattribute_Id: '20',
                                    //
                                    //             field: 'category_id',
                                    //             // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                    //             value:  kcategory_id,
                                    //             Subfield: Subfield,
                                    //             Subvalue: Subvalue,
                                    //             Count: Utils.product_count,
                                    //             Sunatrribute_code: '',
                                    //             pageSize: '',
                                    //             condition_type: 'eq',
                                    //             SubCondition_type: 'finset', filterdata: [],
                                    //
                                    //           ),
                                    //         )));
                                  },
                                  child: Container(
                                    height: height * 0.038,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Within 1 day".toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            color: AppColors.Textcolorheading,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    // var imgurl = widget.mapdata['READYTOSHIP']['list'][index]['imgurl'];
                                    var title = widget.mapdata['READYTOSHIP']['list'][index]['title'];
                                    var urlkey = widget.mapdata['READYTOSHIP']['list'][index]['btn2day'][1]['url_key'];
                                    Utils.navigateToMixCategoryLandingPage(
                                        context, title, urlkey);
                                    // developer.log("urlkey>>>>${urlkey}");
                                    // List url = [];
                                    // url = urlkey.split('/');
                                    // developer.log("urllist>>>>${url}");
                                    // for (var ds in Utils.UrlKeyData) {
                                    //
                                    //   if (url[0] == ds["url_key"]) {
                                    //     kcategory_id = ds["entity_id"];
                                    //   }
                                    //   if (url[1] == ds["url_key"]) {
                                    //     Subfield = ds["attribute_code"];
                                    //     Subvalue = ds["entity_id"];
                                    //
                                    //
                                    //   }
                                    // }
                                    // developer.log("Utils.category_id>>>>${kcategory_id}");
                                    // developer.log("2_Subfield2>>>>${Subfield}");
                                    // developer.log("2_Subvalue2>>>>${Subvalue}");


                                    //
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>  MultiBlocProvider(
                                    //
                                    //           providers: [
                                    //             BlocProvider(
                                    //               create: (context) => ShopBloc(),),
                                    //             BlocProvider(
                                    //               create: (context) => ProductBloc(),) ,
                                    //             BlocProvider(
                                    //               create: (context) => ShopBloc(),) ,
                                    //
                                    //           ],
                                    //           child: MixCategoryLandigPage(
                                    //             heding: title,
                                    //
                                    //             Subattribute_Id: '20',
                                    //
                                    //             field: 'category_id',
                                    //             // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                    //             value:  kcategory_id,
                                    //             Subfield: Subfield,
                                    //             Subvalue: Subvalue,
                                    //             Count: Utils.product_count,
                                    //             Sunatrribute_code: '',
                                    //             pageSize: '',
                                    //             condition_type: 'eq',
                                    //             SubCondition_type: 'finset', filterdata: [],
                                    //
                                    //           ),
                                    //         )));
                                  },
                                  child: Container(
                                    height: height * 0.038,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Within 2 day".toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            color: AppColors.Textcolorheading,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // margin: EdgeInsets.all(10),
                    );
                  },
                ),
              ),
            ),
            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
