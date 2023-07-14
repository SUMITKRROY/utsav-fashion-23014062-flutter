import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'dart:developer' as developer;

class PlusSize extends StatefulWidget {
  Map<String, dynamic> mapdata;
  PlusSize({Key? key, required this.mapdata}) : super(key: key);

  @override
  State<PlusSize> createState() => _PlusSizeState();
}

class _PlusSizeState extends State<PlusSize> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.4);
  var Subfield;
  var Subvalue;
  var kcategory_id;

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
                                builder: (context) => ShoppingBag(
                                      addToCartData1: {},
                                    )));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const FilterList()));
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
                  ///PLUS SIZE
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata['plussize']['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.mapdata['plussize']['message_text'],
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Column(
                    children: [
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: widget
                                .mapdata['plussize']['bnanner_url'].length,
                            options: CarouselOptions(
                                height: height / 2.5,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  // setState(() {
                                  //   activeIndex = index;
                                  // });
                                }),
                            itemBuilder: (context, index, realIndex) {
                              return GestureDetector(
                                onTap: () {
                                  Utils.navigateToMixCategoryLandingPage(
                                      context,
                                      widget.mapdata['plussize']['bnanner_url']
                                          [index]['sub_title'],
                                      widget.mapdata['plussize']['bnanner_url']
                                          [index]['url_key']);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.700,
                                      decoration: BoxDecoration(
                                        // color:Colors.red,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            '${widget.mapdata['plussize']['bnanner_url'][index]["ban_img"]}',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.mapdata['plussize']['grid_list'].length,
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
                                    Utils.navigateToMixCategoryLandingPage(
                                        context,
                                        widget.mapdata['plussize']['grid_list']
                                            [index]['sub_title'],
                                        widget.mapdata['plussize']['grid_list']
                                            [index]['url_key']);
                                  },
                                  child: Card(
                                    child: Image.network(
                                      widget.mapdata['plussize']['grid_list']
                                          [index]['imgurl'],
                                      fit: BoxFit.fill,
                                      height: height / 2.6,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // margin: EdgeInsets.all(10),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),

                  ///SHOP BY

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata['plussize']["shopBySize"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget
                          .mapdata['plussize']['shopBySize']["size_list"]
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  // bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(20),
                                  // topRight: Radius.circular(40),
                                ),
                                color: AppColors.primaryColorbabypink,
                              ),
                              height: height * 0.040,
                              width: null,
                              child: FloatingActionButton.extended(
                                elevation: 0,
                                onPressed: () {
                                  // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                                  var title = widget.mapdata['plussize']
                                          ['shopBySize']["size_list"][index]
                                      ['sub_title'];
                                  var urlkey = widget.mapdata['plussize']
                                          ['shopBySize']["size_list"][index]
                                      ['url_key'];
                                  Utils.navigateToMixCategoryLandingPage(
                                      context, title, urlkey);
                                },
                                label: Text(
                                  '${widget.mapdata['plussize']['shopBySize']["size_list"][index]["size"]}'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                backgroundColor: AppColors.primaryColorbabypink,
                              ),
                            ),
                            NWidgets.ksizedBox10(context),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  ///Radar
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata['plussize']["plusradar"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget
                          .mapdata['plussize']["plusradar"]['grid_list'].length,
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
                                    // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                                    var title = widget.mapdata['plussize']
                                            ["plusradar"]['grid_list'][index]
                                        ['sub_title'];
                                    var urlkey = widget.mapdata['plussize']
                                            ["plusradar"]['grid_list'][index]
                                        ['url_key'];
                                    Utils.navigateToMixCategoryLandingPage(
                                        context, title, urlkey);

                                    // developer.log("urlkey>>>>${urlkey}");
                                    // List url = [];
                                    // url = urlkey.split('/');
                                    // developer.log("urllist>>>>${url}");
                                    // for (var ds in Utils.UrlKeyData) {
                                    //   if (url[0] == ds["url_key"]) {
                                    //     kcategory_id = ds["entity_id"];
                                    //   }
                                    //   if (url[1] == ds["url_key"]) {
                                    //     Subfield = ds["attribute_code"];
                                    //     Subvalue = ds["entity_id"];
                                    //   }
                                    // }
                                    // developer.log(
                                    //     "Utils.category_id>>>>${kcategory_id}");
                                    // developer.log("2_Subfield2>>>>${Subfield}");
                                    // developer.log("2_Subvalue2>>>>${Subvalue}");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MultiBlocProvider(
                                    //               providers: [
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ProductBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //               ],
                                    //               child: MixCategoryLandigPage(
                                    //                 heding: title,
                                    //                 Subattribute_Id: '20',
                                    //                 field: 'category_id',
                                    //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                    //                 value: kcategory_id,
                                    //                 Subfield: Subfield,
                                    //                 Subvalue: Subvalue,
                                    //                 Count: Utils.product_count,
                                    //                 Sunatrribute_code: '',
                                    //                 pageSize: '',
                                    //                 condition_type: 'eq',
                                    //                 SubCondition_type: 'finset',
                                    //                 filterdata: [],
                                    //               ),
                                    //             )));
                                  },
                                  child: Card(
                                    child: Image.network(
                                      widget.mapdata['plussize']["plusradar"]
                                          ["grid_list"][index]['ban_img'],
                                      fit: BoxFit.fill,
                                      height: height / 2.6,
                                    ),
                                  ),
                                ),
                              ),

                              //   Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Expanded(
                              //         child: InkWell(
                              //           onTap: () {
                              //             var imgurl = widget.mapdata['WhatsNow']
                              //                 ['list'][index]['imgurl'];
                              //             var title = widget.mapdata['WhatsNow']
                              //                 ['list'][index]['title'];
                              //             var urlkey = widget.mapdata['WhatsNow']
                              //                     ['list'][index]['btn1day'][0]
                              //                 ['url_key'];
                              //             developer.log("urlkey>>>>${urlkey}");
                              //             List url = [];
                              //             url = urlkey.split('/');
                              //             developer.log("urllist>>>>${url}");
                              //             for (var ds in Utils.UrlKeyData) {
                              //               if (url[0] == ds["url_key"]) {
                              //                 kcategory_id = ds["entity_id"];
                              //               }
                              //               if (url[1] == ds["url_key"]) {
                              //                 Subfield = ds["attribute_code"];
                              //                 Subvalue = ds["entity_id"];
                              //               }
                              //             }
                              //             developer.log(
                              //                 "Utils.category_id>>>>${kcategory_id}");
                              //             developer.log("2_Subfield2>>>>${Subfield}");
                              //             developer.log("2_Subvalue2>>>>${Subvalue}");
                              //             /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
                              //   if (url.isNotEmpty && url[0] ==
                              //       Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
                              //     Utils.category_id =
                              //     Utils.UrlKeyData[j]["entity_id"];
                              //   }
                              //   if (url.length >= 2 &&
                              //       url[1] == Utils.UrlKeyData[j]["url_key"]) {
                              //     Subfield = Utils.UrlKeyData[j]["attribute_code"];
                              //     Subvalue = Utils.UrlKeyData[j]["entity_id"];
                              //     developer.log(
                              //         "Utils.category_id>>>>${Utils.category_id}");
                              //     developer.log("2_Subfield2>>>>${Subfield}");
                              //     developer.log("2_Subvalue2>>>>${Subvalue}");
                              //   }
                              // }*/
                              //
                              //             // if(urlkey.toString().contains('/')) {
                              //             //    url = urlkey?.split('/') ?? [];
                              //             // } else {
                              //             //   url.add(urlkey);
                              //             // }
                              //
                              //             Navigator.push(
                              //                 context,
                              //                 MaterialPageRoute(
                              //                     builder: (context) =>
                              //                         MultiBlocProvider(
                              //                           providers: [
                              //                             BlocProvider(
                              //                               create: (context) =>
                              //                                   ShopBloc(),
                              //                             )
                              //                           ],
                              //                           child: MixCategoryLandigPage(
                              //                             heding: title,
                              //                             storeId: '2',
                              //                             currencyCode: 'INR',
                              //                             CriteriapageSize: '20',
                              //                             conditionType: 'eq',
                              //                             field: 'category_id',
                              //                             // value: childrenId==0?Utils.category_id:childrenId.toString(),
                              //                             value: kcategory_id,
                              //                             Subfield: Subfield,
                              //                             Subvalue: Subvalue,
                              //                             Count: Utils.product_count,
                              //                             currentPage: '',
                              //                             pageSize: '',
                              //                             condition_type: 'eq',
                              //                             SubCondition_type: 'finset',
                              //                           ),
                              //                         )));
                              //           },
                              //           child: Container(
                              //             height: height * 0.038,
                              //             width: 145,
                              //             margin: const EdgeInsets.all(15.0),
                              //             padding: const EdgeInsets.all(3.0),
                              //             decoration: BoxDecoration(
                              //                 border:
                              //                     Border.all(color: Colors.black)),
                              //             child: Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 const SizedBox(
                              //                   width: 10,
                              //                 ),
                              //                 Text(
                              //                   "Within 1 day".toUpperCase(),
                              //                   style: const TextStyle(
                              //                     fontFamily: 'SourceSansPro',
                              //                     color: AppColors.Textcolorheading,
                              //                     fontWeight: FontWeight.w600,
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       const SizedBox(width: 10),
                              //       Expanded(
                              //         child: InkWell(
                              //           onTap: () {
                              //             var imgurl = widget.mapdata['WhatsNow']
                              //                 ['list'][index]['imgurl'];
                              //             var title = widget.mapdata['WhatsNow']
                              //                 ['list'][index]['title'];
                              //             var urlkey = widget.mapdata['WhatsNow']
                              //                     ['list'][index]['btn2day'][1]
                              //                 ['url_key'];
                              //             developer.log("urlkey>>>>${urlkey}");
                              //             List url = [];
                              //             url = urlkey.split('/');
                              //             developer.log("urllist>>>>${url}");
                              //             for (var ds in Utils.UrlKeyData) {
                              //               if (url[0] == ds["url_key"]) {
                              //                 kcategory_id = ds["entity_id"];
                              //               }
                              //               if (url[1] == ds["url_key"]) {
                              //                 Subfield = ds["attribute_code"];
                              //                 Subvalue = ds["entity_id"];
                              //               }
                              //             }
                              //             developer.log(
                              //                 "Utils.category_id>>>>${kcategory_id}");
                              //             developer.log("2_Subfield2>>>>${Subfield}");
                              //             developer.log("2_Subvalue2>>>>${Subvalue}");
                              //             /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
                              //   if (url.isNotEmpty && url[0] ==
                              //       Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
                              //     Utils.category_id =
                              //     Utils.UrlKeyData[j]["entity_id"];
                              //   }
                              //   if (url.length >= 2 &&
                              //       url[1] == Utils.UrlKeyData[j]["url_key"]) {
                              //     Subfield = Utils.UrlKeyData[j]["attribute_code"];
                              //     Subvalue = Utils.UrlKeyData[j]["entity_id"];
                              //     developer.log(
                              //         "Utils.category_id>>>>${Utils.category_id}");
                              //     developer.log("2_Subfield2>>>>${Subfield}");
                              //     developer.log("2_Subvalue2>>>>${Subvalue}");
                              //   }
                              // }*/
                              //
                              //             // if(urlkey.toString().contains('/')) {
                              //             //    url = urlkey?.split('/') ?? [];
                              //             // } else {
                              //             //   url.add(urlkey);
                              //             // }
                              //
                              //             Navigator.push(
                              //                 context,
                              //                 MaterialPageRoute(
                              //                     builder: (context) =>
                              //                         MultiBlocProvider(
                              //                           providers: [
                              //                             BlocProvider(
                              //                               create: (context) =>
                              //                                   ShopBloc(),
                              //                             )
                              //                           ],
                              //                           child: MixCategoryLandigPage(
                              //                             heding: title,
                              //                             storeId: '2',
                              //                             currencyCode: 'INR',
                              //                             CriteriapageSize: '20',
                              //                             conditionType: 'eq',
                              //                             field: 'category_id',
                              //                             // value: childrenId==0?Utils.category_id:childrenId.toString(),
                              //                             value: kcategory_id,
                              //                             Subfield: Subfield,
                              //                             Subvalue: Subvalue,
                              //                             Count: Utils.product_count,
                              //                             currentPage: '',
                              //                             pageSize: '',
                              //                             condition_type: 'eq',
                              //                             SubCondition_type: 'finset',
                              //                           ),
                              //                         )));
                              //           },
                              //           child: Container(
                              //             height: height * 0.038,
                              //             width: 145,
                              //             margin: const EdgeInsets.all(15.0),
                              //             padding: const EdgeInsets.all(3.0),
                              //             decoration: BoxDecoration(
                              //                 border:
                              //                     Border.all(color: Colors.black)),
                              //             child: Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 const SizedBox(
                              //                   width: 10,
                              //                 ),
                              //                 Text(
                              //                   "Within 2 day".toUpperCase(),
                              //                   style: const TextStyle(
                              //                     fontFamily: 'SourceSansPro',
                              //                     color: AppColors.Textcolorheading,
                              //                     fontWeight: FontWeight.w600,
                              //                     fontSize: 14,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                            ],
                          ),

                          // margin: EdgeInsets.all(10),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["Mustwear"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.mapdata["Mustwear"]['grid_list'].length,
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
                                    // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                                    var title = widget.mapdata["Mustwear"]
                                        ['grid_list'][index]['sub_title'];
                                    var urlkey = widget.mapdata["Mustwear"]
                                        ['grid_list'][index]['url_key'];
                                    Utils.navigateToMixCategoryLandingPage(
                                        context, title, urlkey);
                                    // developer.log("urlkey>>>>${urlkey}");
                                    // List url = [];
                                    // url = urlkey.split('/');
                                    // developer.log("urllist>>>>${url}");
                                    // for (var ds in Utils.UrlKeyData) {
                                    //   if (url[0] == ds["url_key"]) {
                                    //     kcategory_id = ds["entity_id"];
                                    //   }
                                    //   if (url[1] == ds["url_key"]) {
                                    //     Subfield = ds["attribute_code"];
                                    //     Subvalue = ds["entity_id"];
                                    //   }
                                    // }
                                    // developer.log(
                                    //     "Utils.category_id>>>>${kcategory_id}");
                                    // developer.log("2_Subfield2>>>>${Subfield}");
                                    // developer.log("2_Subvalue2>>>>${Subvalue}");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MultiBlocProvider(
                                    //               providers: [
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ProductBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //               ],
                                    //               child: MixCategoryLandigPage(
                                    //                 heding: title,
                                    //                 Subattribute_Id: '20',
                                    //                 field: 'category_id',
                                    //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                    //                 value: kcategory_id,
                                    //                 Subfield: Subfield,
                                    //                 Subvalue: Subvalue,
                                    //                 Count: Utils.product_count,
                                    //                 Sunatrribute_code: '',
                                    //                 pageSize: '',
                                    //                 condition_type: 'eq',
                                    //                 SubCondition_type: 'finset',
                                    //                 filterdata: [],
                                    //               ),
                                    //             )));
                                  },
                                  child: Card(
                                    child: Image.network(
                                      widget.mapdata["Mustwear"]['grid_list']
                                          [index]['ban_img'],
                                      fit: BoxFit.fill,
                                      height: height / 2.6,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // margin: EdgeInsets.all(10),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),

                  ///Go Big
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["gobig"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      controller: _pageController,
                      itemCount:
                          widget.mapdata["gobig"]["grid_list_first"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                            var title = widget.mapdata["gobig"]
                                ["grid_list_first"][index]['sub_title'];
                            var urlkey = widget.mapdata["gobig"]
                                ["grid_list_first"][index]['url_key'];
                            Utils.navigateToMixCategoryLandingPage(
                                context, title, urlkey);
                            // developer.log("urlkey>>>>${urlkey}");
                            // List url = [];
                            // url = urlkey.split('/');
                            // developer.log("urllist>>>>${url}");
                            // for (var ds in Utils.UrlKeyData) {
                            //   if (url[0] == ds["url_key"]) {
                            //     kcategory_id = ds["entity_id"];
                            //   }
                            //   if (url[1] == ds["url_key"]) {
                            //     Subfield = ds["attribute_code"];
                            //     Subvalue = ds["entity_id"];
                            //   }
                            // }
                            // developer
                            //     .log("Utils.category_id>>>>${kcategory_id}");
                            // developer.log("2_Subfield2>>>>${Subfield}");
                            // developer.log("2_Subvalue2>>>>${Subvalue}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) =>
                            //                       ProductBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 Subattribute_Id: '20',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield,
                            //                 Subvalue: Subvalue,
                            //                 Count: Utils.product_count,
                            //                 Sunatrribute_code: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //                 filterdata: [],
                            //               ),
                            //             )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
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
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              widget.mapdata["gobig"]
                                                      ["grid_list_first"][index]
                                                  ["ban_img"],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
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
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      controller: _pageController,
                      itemCount:
                          widget.mapdata["gobig"]["grid_list_sec"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                            var title = widget.mapdata["gobig"]["grid_list_sec"]
                                [index]['sub_title'];
                            var urlkey = widget.mapdata["gobig"]
                                ["grid_list_sec"][index]['url_key'];
                            Utils.navigateToMixCategoryLandingPage(
                                context, title, urlkey);
                            // developer.log("urlkey>>>>${urlkey}");
                            // List url = [];
                            // url = urlkey.split('/');
                            // developer.log("urllist>>>>${url}");
                            // for (var ds in Utils.UrlKeyData) {
                            //   if (url[0] == ds["url_key"]) {
                            //     kcategory_id = ds["entity_id"];
                            //   }
                            //   if (url[1] == ds["url_key"]) {
                            //     Subfield = ds["attribute_code"];
                            //     Subvalue = ds["entity_id"];
                            //   }
                            // }
                            // developer
                            //     .log("Utils.category_id>>>>${kcategory_id}");
                            // developer.log("2_Subfield2>>>>${Subfield}");
                            // developer.log("2_Subvalue2>>>>${Subvalue}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) =>
                            //                       ProductBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 Subattribute_Id: '20',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield,
                            //                 Subvalue: Subvalue,
                            //                 Count: Utils.product_count,
                            //                 Sunatrribute_code: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //                 filterdata: [],
                            //               ),
                            //             )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
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
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              widget.mapdata["gobig"]
                                                      ["grid_list_sec"][index]
                                                  ["ban_img"],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
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
                  NWidgets.ksizedBox(context),
                  Row(
                    children: [
                      Text("${widget.mapdata['gobig']["txt_btn"]['title']}-"),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {},
                        child: Text(
                            "${widget.mapdata['gobig']['txt_btn']["txt_btn_list"][0]["Btn_txt"]}"),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget
                          .mapdata['gobig']['txt_btn']["txt_btn_list"].length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                            var title = widget.mapdata['gobig']['txt_btn']
                                ["txt_btn_list"][index]['sub_title'];
                            var urlkey = widget.mapdata['gobig']['txt_btn']
                                ["txt_btn_list"][index]['url_key'];
                            Utils.navigateToMixCategoryLandingPage(
                                context, title, urlkey);
                            // developer.log("urlkey>>>>${urlkey}");
                            // List url = [];
                            // url = urlkey.split('/');
                            // developer.log("urllist>>>>${url}");
                            // for (var ds in Utils.UrlKeyData) {
                            //   if (url[0] == ds["url_key"]) {
                            //     kcategory_id = ds["entity_id"];
                            //   }
                            //   if (url[1] == ds["url_key"]) {
                            //     Subfield = ds["attribute_code"];
                            //     Subvalue = ds["entity_id"];
                            //   }
                            // }
                            // developer
                            //     .log("Utils.category_id>>>>${kcategory_id}");
                            // developer.log("2_Subfield2>>>>${Subfield}");
                            // developer.log("2_Subvalue2>>>>${Subvalue}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) =>
                            //                       ProductBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 Subattribute_Id: '20',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield,
                            //                 Subvalue: Subvalue,
                            //                 Count: Utils.product_count,
                            //                 Sunatrribute_code: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //                 filterdata: [],
                            //               ),
                            //             )));
                          },
                          child: Text(
                              "${widget.mapdata['gobig']['txt_btn']["txt_btn_list"][index]["Btn_txt"]}"),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  ///spotlight
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["spotlight"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          widget.mapdata["spotlight"]['grid_list'].length,
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
                                    // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                                    var title = widget.mapdata["spotlight"]
                                        ['grid_list'][index]['sub_title'];
                                    var urlkey = widget.mapdata["spotlight"]
                                        ['grid_list'][index]['url_key'];
                                    Utils.navigateToMixCategoryLandingPage(
                                        context, title, urlkey);
                                    // developer.log("urlkey>>>>${urlkey}");
                                    // List url = [];
                                    // url = urlkey.split('/');
                                    // developer.log("urllist>>>>${url}");
                                    // for (var ds in Utils.UrlKeyData) {
                                    //   if (url[0] == ds["url_key"]) {
                                    //     kcategory_id = ds["entity_id"];
                                    //   }
                                    //   if (url[1] == ds["url_key"]) {
                                    //     Subfield = ds["attribute_code"];
                                    //     Subvalue = ds["entity_id"];
                                    //   }
                                    // }
                                    // developer.log(
                                    //     "Utils.category_id>>>>${kcategory_id}");
                                    // developer.log("2_Subfield2>>>>${Subfield}");
                                    // developer.log("2_Subvalue2>>>>${Subvalue}");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MultiBlocProvider(
                                    //               providers: [
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ProductBloc(),
                                    //                 ),
                                    //                 BlocProvider(
                                    //                   create: (context) =>
                                    //                       ShopBloc(),
                                    //                 ),
                                    //               ],
                                    //               child: MixCategoryLandigPage(
                                    //                 heding: title,
                                    //                 Subattribute_Id: '20',
                                    //                 field: 'category_id',
                                    //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                    //                 value: kcategory_id,
                                    //                 Subfield: Subfield,
                                    //                 Subvalue: Subvalue,
                                    //                 Count: Utils.product_count,
                                    //                 Sunatrribute_code: '',
                                    //                 pageSize: '',
                                    //                 condition_type: 'eq',
                                    //                 SubCondition_type: 'finset',
                                    //                 filterdata: [],
                                    //               ),
                                    //             )));
                                  },
                                  child: Card(
                                    child: Image.network(
                                      widget.mapdata["spotlight"]['grid_list']
                                          [index]['ban_img'],
                                      fit: BoxFit.fill,
                                      height: height / 2.6,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),

                  ///Just Choose
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["justChoose"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox10(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.mapdata['justChoose']['Sub_title'],
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      controller: _pageController,
                      itemCount: widget
                          .mapdata["justChoose"]["grid_list_first"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                            var title = widget.mapdata["justChoose"]
                                ["grid_list_first"][index]['sub_title'];
                            var urlkey = widget.mapdata["justChoose"]
                                ["grid_list_first"][index]['url_key'];
                            Utils.navigateToMixCategoryLandingPage(
                                context, title, urlkey);
                            // developer.log("urlkey>>>>${urlkey}");
                            // List url = [];
                            // url = urlkey.split('/');
                            // developer.log("urllist>>>>${url}");
                            // for (var ds in Utils.UrlKeyData) {
                            //   if (url[0] == ds["url_key"]) {
                            //     kcategory_id = ds["entity_id"];
                            //   }
                            //   if (url[1] == ds["url_key"]) {
                            //     Subfield = ds["attribute_code"];
                            //     Subvalue = ds["entity_id"];
                            //   }
                            // }
                            // developer
                            //     .log("Utils.category_id>>>>${kcategory_id}");
                            // developer.log("2_Subfield2>>>>${Subfield}");
                            // developer.log("2_Subvalue2>>>>${Subvalue}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) =>
                            //                       ProductBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 Subattribute_Id: '20',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield ?? "",
                            //                 Subvalue: Subvalue ?? "",
                            //                 Count: Utils.product_count,
                            //                 Sunatrribute_code: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //                 filterdata: [],
                            //               ),
                            //             )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: width / 1,
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
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              widget.mapdata["justChoose"]
                                                      ["grid_list_first"][index]
                                                  ["ban_img"],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
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

                  ///Udesign
                  NWidgets.ksizedBox(context),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["udesign"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Card(
                    child: Image.network(
                      widget.mapdata['udesign']['ban_img'],
                      fit: BoxFit.fill,
                      height: height / 2.6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.mapdata['udesign']['message_text'],
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.mapdata['udesign']['txt_btn'].length,
                      itemBuilder: (context, index) {
                        return TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                            var title = widget.mapdata['udesign']['txt_btn']
                                [index]['sub_title'];
                            var urlkey = widget.mapdata['udesign']['txt_btn']
                                [index]['url_key'];
                            Utils.navigateToMixCategoryLandingPage(
                                context, title, urlkey);
                            // developer.log("urlkey>>>>${urlkey}");
                            // List url = [];
                            // url = urlkey.split('/');
                            // developer.log("urllist>>>>${url}");
                            // for (var ds in Utils.UrlKeyData) {
                            //   if (url[0] == ds["url_key"]) {
                            //     kcategory_id = ds["entity_id"];
                            //   }
                            //   if (url[1] == ds["url_key"]) {
                            //     Subfield = ds["attribute_code"];
                            //     Subvalue = ds["entity_id"];
                            //   }
                            // }
                            // developer
                            //     .log("Utils.category_id>>>>${kcategory_id}");
                            // developer.log("2_Subfield2>>>>${Subfield}");
                            // developer.log("2_Subvalue2>>>>${Subvalue}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) =>
                            //                       ProductBloc(),
                            //                 ),
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 ),
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 Subattribute_Id: '20',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield ?? "",
                            //                 Subvalue: Subvalue ?? "",
                            //                 Count: Utils.product_count,
                            //                 Sunatrribute_code: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //                 filterdata: [],
                            //               ),
                            //             )));
                          },
                          child: Text(
                              "${widget.mapdata['udesign']['txt_btn'][index]["Btn_txt"]}"),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          indent: 20.0,
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
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  /// styleIdes
                  NWidgets.ksizedBox(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.mapdata["styleIdes"]['title'],
                        style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox10(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      widget.mapdata['styleIdes']['Sub_title'],
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.8,
                      ),
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          widget.mapdata["styleIdes"]['grid_list_first'].length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.mapdata["styleIdes"]['grid_list_first']
                                    [index]["headding"],
                                style: FTextStyle.H1Headings,
                              ),
                            ),
                            NWidgets.ksizedBox(context),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                widget.mapdata["styleIdes"]['grid_list_first']
                                    [index]["sub_headding"],
                                textAlign: TextAlign.justify,
                                style: FTextStyle.paragrphStyle,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 1,
            //       childAspectRatio: 1,
            //     ),
            //     controller: ScrollController(keepScrollOffset: false),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     itemCount: widget.mapdata['fashionStories']['list'].length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         color: Colors.white,
            //         shape: const RoundedRectangleBorder(),
            //         elevation: 0,
            //         child: Column(
            //           children: [
            //             Expanded(
            //               child: InkWell(
            //                 onTap: () {
            //                   var imgurl = widget.mapdata['fashionStories']
            //                   ['list'][index]['imgurl'];
            //                   var title = widget.mapdata['fashionStories']
            //                   ['list'][index]['title'];
            //                   var urlkey = widget.mapdata['fashionStories']
            //                   ['list'][index]['url_key'];
            //                   developer.log("urlkey>>>>${urlkey}");
            //                   List url = [];
            //                   url = urlkey.split('/');
            //                   developer.log("urllist>>>>${url}");
            //                   for (var ds in Utils.UrlKeyData) {
            //                     if (url[0] == ds["url_key"]) {
            //                       kcategory_id = ds["entity_id"];
            //                     }
            //                     if (url[1] == ds["url_key"]) {
            //                       Subfield = ds["attribute_code"];
            //                       Subvalue = ds["entity_id"];
            //                     }
            //                   }
            //                   developer
            //                       .log("Utils.category_id>>>>${kcategory_id}");
            //                   developer.log("2_Subfield2>>>>${Subfield}");
            //                   developer.log("2_Subvalue2>>>>${Subvalue}");
            //
            //                   // Navigator.push(
            //                   //     context,
            //                   //     MaterialPageRoute(
            //                   //         builder: (context) => MultiBlocProvider(
            //                   //               providers: [
            //                   //                 BlocProvider(
            //                   //                   create: (context) => ShopBloc(),
            //                   //                 )
            //                   //               ],
            //                   //               child: MixCategoryLandigPage(
            //                   //                 heding: title,
            //                   //                 storeId: '2',
            //                   //                 currencyCode: 'INR',
            //                   //                 CriteriapageSize: '20',
            //                   //                 conditionType: 'eq',
            //                   //                 field: 'category_id',
            //                   //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //                   //                 value: kcategory_id,
            //                   //                 Subfield: Subfield,
            //                   //                 Subvalue: Subvalue,
            //                   //                 Count: Utils.product_count,
            //                   //                 currentPage: '',
            //                   //                 pageSize: '',
            //                   //                 condition_type: 'eq',
            //                   //                 SubCondition_type: 'finset',
            //                   //               ),
            //                   //             )));
            //                 },
            //                 child: Card(
            //                   child: Image.network(
            //                     widget.mapdata['fashionStories']['list'][index]
            //                     ['imgurl'],
            //                     fit: BoxFit.fill,
            //                     height: height / 2.6,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               height: height * 0.020,
            //             ),
            //           ],
            //         ),
            //
            //         // margin: EdgeInsets.all(10),
            //       );
            //     },
            //   ),
            // ),
            //
            // Row(
            //   children: <Widget>[
            //     const Expanded(
            //       child: Divider(
            //         indent: 20.0,
            //         endIndent: 10.0,
            //         thickness: 1,
            //       ),
            //     ),
            //     Image.asset(
            //       'images/mus.png',
            //       height: height * 0.030,
            //       width: 30,
            //     ),
            //     const Expanded(
            //       child: Divider(
            //         indent: 10.0,
            //         endIndent: 20.0,
            //         thickness: 1,
            //       ),
            //     ),
            //   ],
            // ),
            //
            // NWidgets.ksizedBox(context),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //         child: Align(
            //           alignment: Alignment.center,
            //           child: Text(
            //             widget.mapdata['fashionStories']["bottom_btn"]['title'],
            //             style: FTextStyle.H1Headings,
            //           ),
            //         ),
            //       ),
            //       NWidgets.ksizedBox(context),
            //       SizedBox(
            //         height: height * 0.010,
            //       ),
            //     ],
            //   ),
            // ),
            //
            // SizedBox(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 3,
            //     ),
            //     controller: ScrollController(keepScrollOffset: false),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     itemCount: widget.mapdata['fashionStories']['list'].length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: height * 0.038,
            //         width: 145,
            //         margin: const EdgeInsets.all(15.0),
            //         padding: const EdgeInsets.all(3.0),
            //         decoration:
            //             BoxDecoration(border: Border.all(color: Colors.black)),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const SizedBox(
            //               width: 15,
            //             ),
            //             Text(
            //               widget.mapdata['fashionStories']['list'][index]["title"]
            //                   .toUpperCase(),
            //               style: const TextStyle(
            //                 fontFamily: 'SourceSansPro',
            //                 color: AppColors.Textcolorheading,
            //                 fontWeight: FontWeight.w600,
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //
            //       //   Card(
            //       //   color: Colors.white,
            //       //   shape: const RoundedRectangleBorder(),
            //       //   elevation: 0,
            //       //   child: Column(
            //       //     children: [
            //       //       Expanded(
            //       //         child: InkWell(
            //       //           onTap: () {
            //       //             var imgurl = widget.mapdata['WhatsNow']['list']
            //       //             [index]['imgurl'];
            //       //             var title = widget.mapdata['WhatsNow']['list']
            //       //             [index]['title'];
            //       //             var urlkey = widget.mapdata['WhatsNow']['list']
            //       //             [index]['url_key'];
            //       //             developer.log("urlkey>>>>${urlkey}");
            //       //             List url = [];
            //       //             url = urlkey.split('/');
            //       //             developer.log("urllist>>>>${url}");
            //       //             for (var ds in Utils.UrlKeyData) {
            //       //               if (url[0] == ds["url_key"]) {
            //       //                 kcategory_id = ds["entity_id"];
            //       //               }
            //       //               if (url[1] == ds["url_key"]) {
            //       //                 Subfield = ds["attribute_code"];
            //       //                 Subvalue = ds["entity_id"];
            //       //               }
            //       //             }
            //       //             developer
            //       //                 .log("Utils.category_id>>>>${kcategory_id}");
            //       //             developer.log("2_Subfield2>>>>${Subfield}");
            //       //             developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //             /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
            //       //     if (url.isNotEmpty && url[0] ==
            //       //         Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
            //       //       Utils.category_id =
            //       //       Utils.UrlKeyData[j]["entity_id"];
            //       //     }
            //       //     if (url.length >= 2 &&
            //       //         url[1] == Utils.UrlKeyData[j]["url_key"]) {
            //       //       Subfield = Utils.UrlKeyData[j]["attribute_code"];
            //       //       Subvalue = Utils.UrlKeyData[j]["entity_id"];
            //       //       developer.log(
            //       //           "Utils.category_id>>>>${Utils.category_id}");
            //       //       developer.log("2_Subfield2>>>>${Subfield}");
            //       //       developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //     }
            //       //   }*/
            //       //
            //       //             // if(urlkey.toString().contains('/')) {
            //       //             //    url = urlkey?.split('/') ?? [];
            //       //             // } else {
            //       //             //   url.add(urlkey);
            //       //             // }
            //       //
            //       //             Navigator.push(
            //       //                 context,
            //       //                 MaterialPageRoute(
            //       //                     builder: (context) => MultiBlocProvider(
            //       //                       providers: [
            //       //                         BlocProvider(
            //       //                           create: (context) => ShopBloc(),
            //       //                         )
            //       //                       ],
            //       //                       child: MixCategoryLandigPage(
            //       //                         heding: title,
            //       //                         storeId: '2',
            //       //                         currencyCode: 'INR',
            //       //                         CriteriapageSize: '20',
            //       //                         conditionType: 'eq',
            //       //                         field: 'category_id',
            //       //                         // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //       //                         value: kcategory_id,
            //       //                         Subfield: Subfield,
            //       //                         Subvalue: Subvalue,
            //       //                         Count: Utils.product_count,
            //       //                         currentPage: '',
            //       //                         pageSize: '',
            //       //                         condition_type: 'eq',
            //       //                         SubCondition_type: 'finset',
            //       //                       ),
            //       //                     )));
            //       //           },
            //       //           child: Card(
            //       //             child: Image.network(
            //       //               widget.mapdata['WhatsNow']['list'][index]
            //       //               ['imgurl'],
            //       //               fit: BoxFit.fill,
            //       //               height: height / 2.6,
            //       //             ),
            //       //           ),
            //       //         ),
            //       //       ),
            //       //       SizedBox(
            //       //         height: height * 0.020,
            //       //       ),
            //       //       //   Row(
            //       //       //     mainAxisAlignment: MainAxisAlignment.center,
            //       //       //     children: [
            //       //       //       Expanded(
            //       //       //         child: InkWell(
            //       //       //           onTap: () {
            //       //       //             var imgurl = widget.mapdata['WhatsNow']
            //       //       //                 ['list'][index]['imgurl'];
            //       //       //             var title = widget.mapdata['WhatsNow']
            //       //       //                 ['list'][index]['title'];
            //       //       //             var urlkey = widget.mapdata['WhatsNow']
            //       //       //                     ['list'][index]['btn1day'][0]
            //       //       //                 ['url_key'];
            //       //       //             developer.log("urlkey>>>>${urlkey}");
            //       //       //             List url = [];
            //       //       //             url = urlkey.split('/');
            //       //       //             developer.log("urllist>>>>${url}");
            //       //       //             for (var ds in Utils.UrlKeyData) {
            //       //       //               if (url[0] == ds["url_key"]) {
            //       //       //                 kcategory_id = ds["entity_id"];
            //       //       //               }
            //       //       //               if (url[1] == ds["url_key"]) {
            //       //       //                 Subfield = ds["attribute_code"];
            //       //       //                 Subvalue = ds["entity_id"];
            //       //       //               }
            //       //       //             }
            //       //       //             developer.log(
            //       //       //                 "Utils.category_id>>>>${kcategory_id}");
            //       //       //             developer.log("2_Subfield2>>>>${Subfield}");
            //       //       //             developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //       //             /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
            //       //       //   if (url.isNotEmpty && url[0] ==
            //       //       //       Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
            //       //       //     Utils.category_id =
            //       //       //     Utils.UrlKeyData[j]["entity_id"];
            //       //       //   }
            //       //       //   if (url.length >= 2 &&
            //       //       //       url[1] == Utils.UrlKeyData[j]["url_key"]) {
            //       //       //     Subfield = Utils.UrlKeyData[j]["attribute_code"];
            //       //       //     Subvalue = Utils.UrlKeyData[j]["entity_id"];
            //       //       //     developer.log(
            //       //       //         "Utils.category_id>>>>${Utils.category_id}");
            //       //       //     developer.log("2_Subfield2>>>>${Subfield}");
            //       //       //     developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //       //   }
            //       //       // }*/
            //       //       //
            //       //       //             // if(urlkey.toString().contains('/')) {
            //       //       //             //    url = urlkey?.split('/') ?? [];
            //       //       //             // } else {
            //       //       //             //   url.add(urlkey);
            //       //       //             // }
            //       //       //
            //       //       //             Navigator.push(
            //       //       //                 context,
            //       //       //                 MaterialPageRoute(
            //       //       //                     builder: (context) =>
            //       //       //                         MultiBlocProvider(
            //       //       //                           providers: [
            //       //       //                             BlocProvider(
            //       //       //                               create: (context) =>
            //       //       //                                   ShopBloc(),
            //       //       //                             )
            //       //       //                           ],
            //       //       //                           child: MixCategoryLandigPage(
            //       //       //                             heding: title,
            //       //       //                             storeId: '2',
            //       //       //                             currencyCode: 'INR',
            //       //       //                             CriteriapageSize: '20',
            //       //       //                             conditionType: 'eq',
            //       //       //                             field: 'category_id',
            //       //       //                             // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //       //       //                             value: kcategory_id,
            //       //       //                             Subfield: Subfield,
            //       //       //                             Subvalue: Subvalue,
            //       //       //                             Count: Utils.product_count,
            //       //       //                             currentPage: '',
            //       //       //                             pageSize: '',
            //       //       //                             condition_type: 'eq',
            //       //       //                             SubCondition_type: 'finset',
            //       //       //                           ),
            //       //       //                         )));
            //       //       //           },
            //       //       //           child: Container(
            //       //       //             height: height * 0.038,
            //       //       //             width: 145,
            //       //       //             margin: const EdgeInsets.all(15.0),
            //       //       //             padding: const EdgeInsets.all(3.0),
            //       //       //             decoration: BoxDecoration(
            //       //       //                 border:
            //       //       //                     Border.all(color: Colors.black)),
            //       //       //             child: Row(
            //       //       //               mainAxisAlignment:
            //       //       //                   MainAxisAlignment.center,
            //       //       //               children: [
            //       //       //                 const SizedBox(
            //       //       //                   width: 10,
            //       //       //                 ),
            //       //       //                 Text(
            //       //       //                   "Within 1 day".toUpperCase(),
            //       //       //                   style: const TextStyle(
            //       //       //                     fontFamily: 'SourceSansPro',
            //       //       //                     color: AppColors.Textcolorheading,
            //       //       //                     fontWeight: FontWeight.w600,
            //       //       //                     fontSize: 14,
            //       //       //                   ),
            //       //       //                 ),
            //       //       //               ],
            //       //       //             ),
            //       //       //           ),
            //       //       //         ),
            //       //       //       ),
            //       //       //       const SizedBox(width: 10),
            //       //       //       Expanded(
            //       //       //         child: InkWell(
            //       //       //           onTap: () {
            //       //       //             var imgurl = widget.mapdata['WhatsNow']
            //       //       //                 ['list'][index]['imgurl'];
            //       //       //             var title = widget.mapdata['WhatsNow']
            //       //       //                 ['list'][index]['title'];
            //       //       //             var urlkey = widget.mapdata['WhatsNow']
            //       //       //                     ['list'][index]['btn2day'][1]
            //       //       //                 ['url_key'];
            //       //       //             developer.log("urlkey>>>>${urlkey}");
            //       //       //             List url = [];
            //       //       //             url = urlkey.split('/');
            //       //       //             developer.log("urllist>>>>${url}");
            //       //       //             for (var ds in Utils.UrlKeyData) {
            //       //       //               if (url[0] == ds["url_key"]) {
            //       //       //                 kcategory_id = ds["entity_id"];
            //       //       //               }
            //       //       //               if (url[1] == ds["url_key"]) {
            //       //       //                 Subfield = ds["attribute_code"];
            //       //       //                 Subvalue = ds["entity_id"];
            //       //       //               }
            //       //       //             }
            //       //       //             developer.log(
            //       //       //                 "Utils.category_id>>>>${kcategory_id}");
            //       //       //             developer.log("2_Subfield2>>>>${Subfield}");
            //       //       //             developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //       //             /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
            //       //       //   if (url.isNotEmpty && url[0] ==
            //       //       //       Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
            //       //       //     Utils.category_id =
            //       //       //     Utils.UrlKeyData[j]["entity_id"];
            //       //       //   }
            //       //       //   if (url.length >= 2 &&
            //       //       //       url[1] == Utils.UrlKeyData[j]["url_key"]) {
            //       //       //     Subfield = Utils.UrlKeyData[j]["attribute_code"];
            //       //       //     Subvalue = Utils.UrlKeyData[j]["entity_id"];
            //       //       //     developer.log(
            //       //       //         "Utils.category_id>>>>${Utils.category_id}");
            //       //       //     developer.log("2_Subfield2>>>>${Subfield}");
            //       //       //     developer.log("2_Subvalue2>>>>${Subvalue}");
            //       //       //   }
            //       //       // }*/
            //       //       //
            //       //       //             // if(urlkey.toString().contains('/')) {
            //       //       //             //    url = urlkey?.split('/') ?? [];
            //       //       //             // } else {
            //       //       //             //   url.add(urlkey);
            //       //       //             // }
            //       //       //
            //       //       //             Navigator.push(
            //       //       //                 context,
            //       //       //                 MaterialPageRoute(
            //       //       //                     builder: (context) =>
            //       //       //                         MultiBlocProvider(
            //       //       //                           providers: [
            //       //       //                             BlocProvider(
            //       //       //                               create: (context) =>
            //       //       //                                   ShopBloc(),
            //       //       //                             )
            //       //       //                           ],
            //       //       //                           child: MixCategoryLandigPage(
            //       //       //                             heding: title,
            //       //       //                             storeId: '2',
            //       //       //                             currencyCode: 'INR',
            //       //       //                             CriteriapageSize: '20',
            //       //       //                             conditionType: 'eq',
            //       //       //                             field: 'category_id',
            //       //       //                             // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //       //       //                             value: kcategory_id,
            //       //       //                             Subfield: Subfield,
            //       //       //                             Subvalue: Subvalue,
            //       //       //                             Count: Utils.product_count,
            //       //       //                             currentPage: '',
            //       //       //                             pageSize: '',
            //       //       //                             condition_type: 'eq',
            //       //       //                             SubCondition_type: 'finset',
            //       //       //                           ),
            //       //       //                         )));
            //       //       //           },
            //       //       //           child: Container(
            //       //       //             height: height * 0.038,
            //       //       //             width: 145,
            //       //       //             margin: const EdgeInsets.all(15.0),
            //       //       //             padding: const EdgeInsets.all(3.0),
            //       //       //             decoration: BoxDecoration(
            //       //       //                 border:
            //       //       //                     Border.all(color: Colors.black)),
            //       //       //             child: Row(
            //       //       //               mainAxisAlignment:
            //       //       //                   MainAxisAlignment.center,
            //       //       //               children: [
            //       //       //                 const SizedBox(
            //       //       //                   width: 10,
            //       //       //                 ),
            //       //       //                 Text(
            //       //       //                   "Within 2 day".toUpperCase(),
            //       //       //                   style: const TextStyle(
            //       //       //                     fontFamily: 'SourceSansPro',
            //       //       //                     color: AppColors.Textcolorheading,
            //       //       //                     fontWeight: FontWeight.w600,
            //       //       //                     fontSize: 14,
            //       //       //                   ),
            //       //       //                 ),
            //       //       //               ],
            //       //       //             ),
            //       //       //           ),
            //       //       //         ),
            //       //       //       ),
            //       //       //     ],
            //       //       //   ),
            //       //     ],
            //       //   ),
            //       //
            //       //   // margin: EdgeInsets.all(10),
            //       // );
            //     },
            //   ),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () {
            //           var imgurl = widget.mapdata['WhatsNow']
            //           ['list'][0]['imgurl'];
            //           var title = widget.mapdata['WhatsNow']
            //           ['list'][0]['title'];
            //           var urlkey = widget.mapdata['WhatsNow']
            //           ['list'][0]['btn1day'][0]
            //           ['url_key'];
            //           developer.log("urlkey>>>>${urlkey}");
            //           List url = [];
            //           url = urlkey.split('/');
            //           developer.log("urllist>>>>${url}");
            //           for (var ds in Utils.UrlKeyData) {
            //             if (url[0] == ds["url_key"]) {
            //               kcategory_id = ds["entity_id"];
            //             }
            //             if (url[1] == ds["url_key"]) {
            //               Subfield = ds["attribute_code"];
            //               Subvalue = ds["entity_id"];
            //             }
            //           }
            //           developer.log(
            //               "Utils.category_id>>>>${kcategory_id}");
            //           developer.log("2_Subfield2>>>>${Subfield}");
            //           developer.log("2_Subvalue2>>>>${Subvalue}");
            //
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) =>
            //                       MultiBlocProvider(
            //                         providers: [
            //                           BlocProvider(
            //                             create: (context) =>
            //                                 ShopBloc(),
            //                           )
            //                         ],
            //                         child: MixCategoryLandigPage(
            //                           heding: title,
            //                           storeId: '2',
            //                           currencyCode: 'INR',
            //                           CriteriapageSize: '20',
            //                           conditionType: 'eq',
            //                           field: 'category_id',
            //                           // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //                           value: kcategory_id,
            //                           Subfield: Subfield,
            //                           Subvalue: Subvalue,
            //                           Count: Utils.product_count,
            //                           currentPage: '',
            //                           pageSize: '',
            //                           condition_type: 'eq',
            //                           SubCondition_type: 'finset',
            //                         ),
            //                       )));
            //         },
            //         child: Container(
            //           height: height * 0.038,
            //           width: 145,
            //           margin: const EdgeInsets.all(15.0),
            //           padding: const EdgeInsets.all(3.0),
            //           decoration: BoxDecoration(
            //               border:
            //               Border.all(color: Colors.black)),
            //           child: Row(
            //             mainAxisAlignment:
            //             MainAxisAlignment.center,
            //             children: [
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Text(
            //                 "Within 1 day".toUpperCase(),
            //                 style: const TextStyle(
            //                   fontFamily: 'SourceSansPro',
            //                   color: AppColors.Textcolorheading,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 14,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     Expanded(
            //       child: InkWell(
            //         onTap: () {
            //           var imgurl = widget.mapdata['WhatsNow']
            //           ['list'][0]['imgurl'];
            //           var title = widget.mapdata['WhatsNow']
            //           ['list'][0]['title'];
            //           var urlkey = widget.mapdata['WhatsNow']
            //           ['list'][0]['btn2day'][1]
            //           ['url_key'];
            //           developer.log("urlkey>>>>${urlkey}");
            //           List url = [];
            //           url = urlkey.split('/');
            //           developer.log("urllist>>>>${url}");
            //           for (var ds in Utils.UrlKeyData) {
            //             if (url[0] == ds["url_key"]) {
            //               kcategory_id = ds["entity_id"];
            //             }
            //             if (url[1] == ds["url_key"]) {
            //               Subfield = ds["attribute_code"];
            //               Subvalue = ds["entity_id"];
            //             }
            //           }
            //           developer.log(
            //               "Utils.category_id>>>>${kcategory_id}");
            //           developer.log("2_Subfield2>>>>${Subfield}");
            //           developer.log("2_Subvalue2>>>>${Subvalue}");
            //           /*  for (int j = 0; j < Utils.UrlKeyData.length; j++) {
            //               if (url.isNotEmpty && url[0] ==
            //                   Utils.UrlKeyData[j]["url_key"].toLowerCase()) {
            //                 Utils.category_id =
            //                 Utils.UrlKeyData[j]["entity_id"];
            //               }
            //               if (url.length >= 2 &&
            //                   url[1] == Utils.UrlKeyData[j]["url_key"]) {
            //                 Subfield = Utils.UrlKeyData[j]["attribute_code"];
            //                 Subvalue = Utils.UrlKeyData[j]["entity_id"];
            //                 developer.log(
            //                     "Utils.category_id>>>>${Utils.category_id}");
            //                 developer.log("2_Subfield2>>>>${Subfield}");
            //                 developer.log("2_Subvalue2>>>>${Subvalue}");
            //               }
            //             }*/
            //
            //           // if(urlkey.toString().contains('/')) {
            //           //    url = urlkey?.split('/') ?? [];
            //           // } else {
            //           //   url.add(urlkey);
            //           // }
            //
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) =>
            //                       MultiBlocProvider(
            //                         providers: [
            //                           BlocProvider(
            //                             create: (context) =>
            //                                 ShopBloc(),
            //                           )
            //                         ],
            //                         child: MixCategoryLandigPage(
            //                           heding: title,
            //                           storeId: '2',
            //                           currencyCode: 'INR',
            //                           CriteriapageSize: '20',
            //                           conditionType: 'eq',
            //                           field: 'category_id',
            //                           // value: childrenId==0?Utils.category_id:childrenId.toString(),
            //                           value: kcategory_id,
            //                           Subfield: Subfield,
            //                           Subvalue: Subvalue,
            //                           Count: Utils.product_count,
            //                           currentPage: '',
            //                           pageSize: '',
            //                           condition_type: 'eq',
            //                           SubCondition_type: 'finset',
            //                         ),
            //                       )));
            //         },
            //         child: Container(
            //           height: height * 0.038,
            //           width: 145,
            //           margin: const EdgeInsets.all(15.0),
            //           padding: const EdgeInsets.all(3.0),
            //           decoration: BoxDecoration(
            //               border:
            //               Border.all(color: Colors.black)),
            //           child: Row(
            //             mainAxisAlignment:
            //             MainAxisAlignment.center,
            //             children: [
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //               Text(
            //                 "Within 2 day".toUpperCase(),
            //                 style: const TextStyle(
            //                   fontFamily: 'SourceSansPro',
            //                   color: AppColors.Textcolorheading,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 14,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
