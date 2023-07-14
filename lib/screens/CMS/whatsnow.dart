import 'package:flutter/material.dart';

import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/screens/Filter/filterList.dart';

import 'package:utsav/utils/utils.dart';

import '../../utils/widgets.dart';

class Whatsnow extends StatefulWidget {
  const Whatsnow({Key? key}) : super(key: key);

  @override
  State<Whatsnow> createState() => _WhatsnowState();
}

class _WhatsnowState extends State<Whatsnow> {
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

  var img =
      "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg";

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
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NavBarBottom(selectedIndex: 0,)));

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
                        builder: (context) => const SearchScreen())
                );
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
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/shipin.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            SizedBox(width: 10.0),
                            Text(
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
                  // VerticalDivider(
                  //   width: 2.0,
                  //   color: Colors.grey,
                  //   indent: 10.0,
                  //   endIndent: 10.0,
                  // ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        // margin: const EdgeInsets.all(15.0),
                        // padding: const EdgeInsets.all(3.0),
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.grey)
                        // ),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                                width: 1.0, color: AppColors.bordergrey),
                            left: BorderSide(
                                width: 1.0, color: AppColors.bordergrey),
                          ),
                          color: Colors.white,
                        ),

                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/filter.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            SizedBox(width: 10.0),
                            Text(
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
                  // VerticalDivider(
                  //   width: 2.0,
                  //   color: Colors.black,
                  //   indent: 10.0,
                  //   endIndent: 10.0,
                  // ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/filterIcon/sort.png",
                              height: height * 0.020,
                              width: height * 0.020,
                              // color: Colors.grey,
                            ),
                            SizedBox(width: 10.0),
                            Text(
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "ALL THAT'S FRESH",
                       style: FTextStyle.H1Headings,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text(
                      'Presenting My- Store! An exclusive collection of hand picked products and styles , specially curated for you. Our team of fashion stylists analyses your browsing and product selection carefully and uniquely suggests what will look good, better and awesome as per your taste each time you come here. So give it a scroll and pick what you love the most.',
                      textAlign: TextAlign.justify,
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SizedBox(
                // color: Colors.lightGreen,
                height: height / 2,
                // height: height*0.510,
                child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.47,
                  ),
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         // builder: (context) => MixCategoryLandigPage(heding: _hidengemMap['hidenGem'][index]['name'], mapdata: _hidengemMap, )));
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
                            Stack(
                              children: [
                                Image.network(
                                  img,
                                  fit: BoxFit.cover,
                                  height: height / 3.1,
                                ),
                                Positioned(
                                  bottom: 5.0,
                                  // right: 0.0,
                                  right: 0.0,
                                  child: IconButton(
                                    onPressed: () {
                                      // Use the controller to change the current page
                                      // carouselController.previousPage();
                                    },
                                    icon: InkWell(
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: const BoxDecoration(
                                              // border: Border.all(color: Colors.grey, width: 1),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Image.asset(
                                            'images/mcards.png',
                                            scale: 4,
                                            width: width * 0.060,
                                            // height: 20,
                                            // color: Colors.grey,
                                          ),
                                        ),
                                        onTap: () {
                                          Utils.showPickerBottom(context, img);
                                          // _buildBottomDrawer(context);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            NWidgets.ksizedBox5(context),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Embroidered Net Scalloped Saree in Red",
                                textAlign: TextAlign.left,
                                style: FTextStyle.decStyle,
                              ),
                            ),
                            NWidgets.ksizedBox5(context),
                              Align(
                              alignment: Alignment.bottomLeft,
                              child: Text.rich(
                                TextSpan(
                                  text: '',
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '₹5000.00',
                                      style: FTextStyle.prizeStyle5,
                                    ),
                                    TextSpan(
                                      text: ' ${Utils.currencySymbol}3000.00',
                                      style: FTextStyle.prizeStyle3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            NWidgets.ksizedBox5(context),
                            Expanded(
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text.rich(
                                      TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '25% Off',
                                            style: FTextStyle.offprizeStyle,
                                          ),
                                          // TextSpan(
                                          //   text: '         Ready to Ship',
                                          //   style: TextStyle(
                                          //     color: AppColors.pricecolor,
                                          //     // decoration: TextDecoration.lineThrough,
                                          //   ),
                                          // ),
                                        ],
                                      ),
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
            ),
            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
