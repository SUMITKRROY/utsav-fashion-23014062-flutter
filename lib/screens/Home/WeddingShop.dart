import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/screens/Filter/filterList.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'dart:developer' as developer;

class MyWeddingShop extends StatefulWidget {
  Map<String, dynamic> mapdata;
  MyWeddingShop({Key? key, required this.mapdata}) : super(key: key);

  @override
  State<MyWeddingShop> createState() => _MyWeddingShopState();
}

class _MyWeddingShopState extends State<MyWeddingShop> {
  final PageController _pageController =
  PageController(initialPage: 1, viewportFraction: 0.4);
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
        body: ListView(children: [
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>  FilterList()));
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
                      widget.mapdata['weddingshopBlockfirst']['title'],
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                ),
                NWidgets.ksizedBox(context),
                Card(
                  child: Image.network(
                    widget.mapdata['weddingshopBlockfirst']['imgurl'],
                    fit: BoxFit.fill,
                    height: height / 2.6,
                  ),
                ),
                NWidgets.ksizedBox(context),
                // Image.network(
                //     "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_02.gif"),
                NWidgets.ksizedBox(context),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    widget.mapdata['weddingshopBlockfirst']['message_text'],
                    textAlign: TextAlign.justify,
                    style: FTextStyle.paragrphStyle,
                  ),
                ),

                SizedBox(
                  height: height * 0.010,
                ),
              ],
            ),
          ),
          SizedBox(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1,
              ),
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.mapdata['weddingshopBlockfirst']['list'].length,
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
                            // var imgurl = widget.mapdata['springSumerTrends']
                            //     ['list'][index]['imgurl'];
                            var title = widget.mapdata['weddingshopBlockfirst']['list'][index]['title'];
                            var urlkey = widget.mapdata['weddingshopBlockfirst']['list'][index]['url_key'];
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
                            //
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 )
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 storeId: '2',
                            //                 currencyCode: 'INR',
                            //                 CriteriapageSize: '20',
                            //                 conditionType: 'eq',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield,
                            //                 Subvalue: Subvalue,
                            //                 Count: Utils.product_count,
                            //                 currentPage: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //               ),
                            //             )));
                          },
                          child: Card(
                            child: Image.network(
                              widget.mapdata['weddingshopBlockfirst']['list']
                                  [index]['imgurl'],
                              fit: BoxFit.fill,
                              height: height,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      //   child: Text(
                      //     widget.mapdata['springSumerTrends']['list'][index]
                      //         ['description'],
                      //     textAlign: TextAlign.justify,
                      //     style: FTextStyle.paragrphStyle,
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      // Container(
                      //   height: height * 0.038,
                      //   width: 145,
                      //   margin: const EdgeInsets.all(15.0),
                      //   padding: const EdgeInsets.all(3.0),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.black)),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text(
                      //         widget.mapdata['springSumerTrends']['list'][index]
                      //                 ['btn']["name"]
                      //             .toUpperCase(),
                      //         style: const TextStyle(
                      //           fontFamily: 'SourceSansPro',
                      //           color: AppColors.Textcolorheading,
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),

                  // margin: EdgeInsets.all(10),
                );
              },
            ),
          ),


          ///TRENDING THIS WEEK
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Align(
              alignment: Alignment.center,
              child: NWidgets.kheadinghome(
                  context, "COLLECTION PREVIEW".toUpperCase()),
            ),
          ),

          SizedBox(
            height: height * 0.010,
          ),
          SizedBox(
            // color: Colors.cyan,
            height: 370,
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
                                      Utils.trendingMap![index]
                                          .imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        Utils
                                            .trendingMap![index].name,
                                        textAlign: TextAlign.left,
                                        style: FTextStyle.decStyle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
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
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.mapdata['weddingshopBlocksec']['title'],
                style: FTextStyle.H1Headings,
              ),
            ),
          ),

          NWidgets.ksizedBox(context),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              widget.mapdata['weddingshopBlocksec']['message_text'],
              textAlign: TextAlign.justify,
              style: FTextStyle.paragrphStyle,
            ),
          ),
          SizedBox(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1,
              ),
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.mapdata['weddingshopBlocksec']['list'].length,
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
                            // var imgurl = widget.mapdata['springSumerTrends']
                            //     ['list'][index]['imgurl'];
                            // var title = widget
                            //         .mapdata['fashispringSumerTrendsonStories']
                            //     ['list'][index]['title'];
                            // var urlkey = widget.mapdata['springSumerTrends']
                            //     ['list'][index]['url_key'];
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
                            //
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MultiBlocProvider(
                            //               providers: [
                            //                 BlocProvider(
                            //                   create: (context) => ShopBloc(),
                            //                 )
                            //               ],
                            //               child: MixCategoryLandigPage(
                            //                 heding: title,
                            //                 storeId: '2',
                            //                 currencyCode: 'INR',
                            //                 CriteriapageSize: '20',
                            //                 conditionType: 'eq',
                            //                 field: 'category_id',
                            //                 // value: childrenId==0?Utils.category_id:childrenId.toString(),
                            //                 value: kcategory_id,
                            //                 Subfield: Subfield,
                            //                 Subvalue: Subvalue,
                            //                 Count: Utils.product_count,
                            //                 currentPage: '',
                            //                 pageSize: '',
                            //                 condition_type: 'eq',
                            //                 SubCondition_type: 'finset',
                            //               ),
                            //             )));
                          },
                          child: Card(
                            child: Image.network(
                              widget.mapdata['weddingshopBlocksec']['list']
                                  [index]['imgurl'],
                              fit: BoxFit.fill,
                              height: height,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      //   child: Text(
                      //     widget.mapdata['springSumerTrends']['list'][index]
                      //         ['description'],
                      //     textAlign: TextAlign.justify,
                      //     style: FTextStyle.paragrphStyle,
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      // Container(
                      //   height: height * 0.038,
                      //   width: 145,
                      //   margin: const EdgeInsets.all(15.0),
                      //   padding: const EdgeInsets.all(3.0),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.black)),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text(
                      //         widget.mapdata['springSumerTrends']['list'][index]
                      //                 ['btn']["name"]
                      //             .toUpperCase(),
                      //         style: const TextStyle(
                      //           fontFamily: 'SourceSansPro',
                      //           color: AppColors.Textcolorheading,
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),

                  // margin: EdgeInsets.all(10),
                );
              },
            ),
          ),
          ///TRENDING THIS WEEK
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Align(
              alignment: Alignment.center,
              child: NWidgets.kheadinghome(
                  context, "COLLECTION PREVIEW".toUpperCase()),
            ),
          ),

          SizedBox(
            height: height * 0.010,
          ),
          SizedBox(
            // color: Colors.cyan,
            height: 370,
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
                                      Utils.trendingMap![index]
                                          .imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        Utils
                                            .trendingMap![index].name,
                                        textAlign: TextAlign.left,
                                        style: FTextStyle.decStyle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
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
          SizedBox(
            height: height * 0.010,
          ),

        ]),
      ),
    );
  }
}
