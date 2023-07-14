import 'package:flutter/material.dart';
import 'package:utsav/screens/Filter/filterList.dart';

import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';

import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';


import '../../utils/widgets.dart';

class ListingLandingPage extends StatefulWidget {
  List imglist;
  String name;
  String more;
  ListingLandingPage(
      {Key? key, required this.imglist, required this.name, required this.more})
      : super(key: key);

  @override
  State<ListingLandingPage> createState() => _ListingLandingPageState();
}

class _ListingLandingPageState extends State<ListingLandingPage> {

  final Map<String, dynamic> _trendingMap = {
    "trending": [
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-pakistani-suit-in-grey-v1-kgzt4609.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-off-white-v1-ssf8703.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },

      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-saree-in-off-white-v1-spf7548_1.jpg",
        "name": "Embroidered Georgette Pakistani Suit in Brown"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-cream-v1-ssf13321.jpg",
        "name": "Embroidered Georgette Pakistani Suit in Brown"
      },

      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-velvet-sherwani-in-black-v1-muy482.jpg",
        "name": "Embroidered Georgette Coat"
      },
    ]
  };

  List itemname = [
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25% Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
    '25 % Off',
    '25 % Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
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
                              height: 20,
                              width: 20,
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
                        // Utils.showPickerShipin(context);
                        Utils.showPickerShipin(context);
                      },
                    ),
                  ),

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
                                builder: (context) =>  FilterList(
                                  Subattribute_Id: '',
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: [
                        Text(
                          widget.name,
                          style: FTextStyle.H1Headings,
                          textAlign: TextAlign.left,
                        ),
                        const Spacer(),
                        const Text(
                          'Found 3248 items',
                          style: FTextStyle.SkUStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      // color: Colors.lightGreen,
                      height: height / 1.3,
                      // height: height*0.510,
                      child: GridView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.47,
                        ),
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: widget.name == 'Arrived This Week'
                            ? _trendingMap['trending'].length
                            : widget.imglist.length,

                        itemBuilder: (context, index) {
                          var img = widget.name == 'Arrived This Week'
                              ? _trendingMap['trending'][index]['img']
                              : widget.imglist[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>

                                          ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
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
                                      Container(
                                        height: height / 3.1,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColorpink
                                                .withOpacity(0.10),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'images/loading.gif'))),
                                        child: Image.network(
                                          img,
                                          fit: BoxFit.cover,
                                          height: height / 3.1,
                                        ),
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
                                                Utils.showPickerBottom(
                                                    context, img);
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
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              text: '',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: itemname[index],
                                                  style:
                                                      FTextStyle.offprizeStyle,
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
                ],
              ),
            ),

            NWidgets.ksizedBox10(context),

            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
