import 'package:flutter/material.dart';
import 'package:utsav/screens/Filter/filterList.dart';

import 'package:utsav/utils/app_colors.dart';

import 'package:utsav/utils/utils.dart';

import '../ShoppingBag/shoppingBag.dart';

class CategoryWiseFilter extends StatefulWidget {
  const CategoryWiseFilter({Key? key}) : super(key: key);

  @override
  State<CategoryWiseFilter> createState() => _CategoryWiseFilterState();
}

class _CategoryWiseFilterState extends State<CategoryWiseFilter> {
  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
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
              onPressed: () {},
            );
          }),
          title: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "images/welcome_icon.png",
              height: 50,
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
              onPressed: () {},
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
                              height: 20,
                              width: 20,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 10.0),
                            const  Text(
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
                        Utils.showPicker(context);

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
                              height: 20,
                              width: 20,
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
                                builder: (context) =>
                                    FilterList(Subattribute_Id: '',
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
                              height: 20,
                              width: 20,
                              // color: Colors.grey,
                            ),
                            const  SizedBox(width: 10.0),
                            const  Text(
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


                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Image.asset(
                              "images/ccrossIcon.png",
                              height: 13,
                              width: 13,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              'Red',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {

                        },
                      ),
                      InkWell(
                        child: Container(
                          padding:const  EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/ccrossIcon.png",
                                height: 13,
                                width: 13,
                                // color: Colors.grey,
                              ),
                              const SizedBox(width: 4.0),
                              const  Text(
                                '32',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {

                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/ccrossIcon.png",
                                height: 13,
                                width: 13,
                                // color: Colors.grey,
                              ),
                              const SizedBox(width: 4.0),
                              const Text(
                                'Party',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {

                        },
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Image.asset(
                              "images/ccrossIcon.png",
                              height: 13,
                              width: 13,
                              // color: Colors.grey,
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '₹ 5,000.00-10,000',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {

                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      child:const  Text(
                        "Clear All",
                        textAlign: TextAlign.left,
                        style: TextStyle(

                          fontFamily: 'SourceSansPro',
                          color: AppColors.underlineTextcolorheading,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Wedding Saree',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                         Spacer(),
                        Text(
                        'Found 3248 items',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const  SizedBox(
                    height: 10,
                  ),
                  SizedBox(

                    height: height / 1.3,

                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 0.58,
                      controller: ScrollController(keepScrollOffset: true),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [

                        ...images.map(
                          (i) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                    ),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                          i,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
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
                                                    'images/navBarIcon/navWishlist.png',
                                                    scale: 4,
                                                    width: width * 0.060,
                                                    // height: 20,
                                                    color: AppColors
                                                        .primaryColorpink,
                                                  ),
                                                ),
                                                onTap: () {
                                                  // if (!PrefUtils.getLogin())
                                                  if (Utils.checkLogin==false)
                                                  {
                                                    Utils.ShowDialoglogin(context,"To Like our Product Please Login");
                                                  }
                                                }),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5.0,
                                          // right: 0.0,
                                          left: 0.0,
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
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) => const WelcomeScreen()));
                                                  // (Route<dynamic> route) => false);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Embroidered Net Scalloped Saree in Red",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                      Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '₹ 5000.00',
                                              style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${Utils.currencySymbol} 3000.00',
                                              style: TextStyle(
                                                color: AppColors.pricecolor,
                                                fontSize: 16,
                                                fontFamily: "SourceSansPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: const [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '25 % Off',
                                                  style: TextStyle(
                                                    color: AppColors.pricecolor,
                                                    fontSize: 10,
                                                    fontFamily: "SourceSansPro",
                                                    fontWeight: FontWeight.w400,
                                                  ),
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
                                  ],
                                ),

                                // margin: EdgeInsets.all(10),
                              ),
                              // Material(
                              //   shape: const CircleBorder(),
                              //   elevation: 3.0,
                              //   child: FittedBox(
                              //     child: Image.asset(
                              //       i,
                              //       fit: BoxFit.fill,
                              //       // height: 400,
                              //       // width: 200,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
