import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:utsav/screens/CMS/ListingLandingPage.dart';

import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';

import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';


class CmsLandingPage extends StatefulWidget {
  String heding;
  Map<String, dynamic> mapdata;
  Map<String, dynamic> festivdata;
  CmsLandingPage(
      {Key? key,
      required this.heding,
      required this.mapdata,
      required this.festivdata})
      : super(key: key);

  @override
  State<CmsLandingPage> createState() => _CmsLandingPageState();
}

class _CmsLandingPageState extends State<CmsLandingPage> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  static const items = [
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
    'Saree',
  ];
  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];
  List<String> images2 = [
    "images/gridImg/bandirl.png",
    "images/gridImg/bandirl.png",
    "images/gridImg/bandirl.png",
    "images/gridImg/bandirl.png"
  ];

  final Map<String, dynamic> _trendingMap = {
    "trending": [
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/home/2022/2605/sequins_medley.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/home/2022/2605/black_magic.jpg",
        "name": "Embroidered Georgette Pakistani Suit in Brown"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/home/2022/2605/checks_mania.jpg",
        "name": "Embroidered Georgette Pakistani Suit in grey"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/home/2022/2605/digital_prints.jpg",
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
    '25% Off | Ready to Ship',
    'Out of Stock',
    '10% Off',
  ];

  int activeIndex = 0;
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
                height: height * 0.014,
                width: height * 0.022,
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
                      builder: (context) => NavBarBottom(
                            selectedIndex: 0,
                          )));
            },
            child: Image.asset(
              "images/welcome_icon.png",
              height: height * 0.050,
              width: height * 0.055,
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
            SizedBox(
              height: height * 0.010,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(
                      context, '${widget.heding.toUpperCase()} COLLECTION'),
                  NWidgets.ksizedBox(context),
                  const Text(
                    "What makes the Salwar Kameez truly irresistible? Well, it’s perfect for every season, every reason, every body type and every occasion. No wonder we call it the queen of ethnic fashion! For the modern Indian woman who wants to dress up quickly and conveniently and yet look magical, we present the Salwar Kameez in its zillion avatars!",
                    textAlign: TextAlign.justify,
                    style: FTextStyle.paragrphStyle,
                  ),
                  NWidgets.ksizedBox(context),
                  Column(
                    children: [
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                }),
                            itemBuilder: (context, index, realIndex) {
                              return GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavBarBottom(
                                                      selectedIndex: 0,
                                                    )));
                                      },
                                      child: Container(
                                        // alignment: Alignment.bottomCenter,
                                        height: height * 0.500,
                                        // width: width,
                                        decoration: const BoxDecoration(
                                          // color: Colors.cyan,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'images/bannerImg/banercms.png',
                                            ),
                                          ),
                                          // borderRadius:
                                          // BorderRadius.all(Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: -30,
                            right: 0,
                            left: 0,
                            // top: 0,
                            child: Center(
                              child: AnimatedSmoothIndicator(
                                activeIndex: activeIndex,
                                count: 3,
                                effect: ScrollingDotsEffect(
                                  strokeWidth: 5,
                                  activeDotColor: AppColors.primaryColorpink,
                                  dotColor: Colors.grey.withOpacity(0.40),
                                  dotHeight: 5.5,
                                  dotWidth: 5.5,
                                  activeDotScale: 1.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'FABRICS OF FANTASY'),
                  NWidgets.ksizedBox(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "images/ClothsButtonCms/artSilk.png",
                        height: height * 0.095,
                        width: height * 0.095,
                        // color: Colors.grey,
                      ),
                      Image.asset(
                        "images/ClothsButtonCms/cotton.png",
                        height: height * 0.095,
                        width: height * 0.095,
                        // color: Colors.grey,
                      ),
                      Image.asset(
                        "images/ClothsButtonCms/geo.png",
                        height: height * 0.095,
                        width: height * 0.095,
                        // color: Colors.grey,
                      ),
                      Image.asset(
                        "images/ClothsButtonCms/jacquard.png",
                        height: height * 0.095,
                        width: height * 0.095,
                        // color: Colors.grey,
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  const Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: 'Also See - ',
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Chanderi ',
                            style: TextStyle(
                              color: AppColors.underlineTextcolorheading,
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' |Rayon',
                            style: TextStyle(
                              color: AppColors.underlineTextcolorheading,
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '  |Satin',
                            style: TextStyle(
                              color: AppColors.underlineTextcolorheading,
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' |Crepe',
                            style: TextStyle(
                              color: AppColors.underlineTextcolorheading,
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    // height: height / 2.3,
                    height: 350,
                    child: ListView.builder(
                      itemCount: widget.mapdata['trending'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = widget.mapdata['trending'][index];
                        var img = category['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>

                                        ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  // width: width / 2,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              category['img'],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
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
                                                      text: '₹5000.00',
                                                      style: FTextStyle
                                                          .prizeStyle5,
                                                    ),
                                                    TextSpan(
                                                      text: ' ${Utils.currencySymbol}3000.00',
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
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'FINERY FOR THE FESTIVITIES'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.lightGreen,F
                    // height: height * 0.650,
                    // height: height*0.510,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: ScrollController(keepScrollOffset: true),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _trendingMap['trending'].length,
                      itemBuilder: (context, index) {
                        var category = _trendingMap['trending'][index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListingLandingPage(
                                            imglist: const [],
                                            name: 'Arrived This Week',
                                            more: '',
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(category['img']),
                                    fit: BoxFit.fill,
                                  )),
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    height: 350,
                    child: ListView.builder(
                      itemCount: widget.mapdata['trending'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = widget.mapdata['trending'][index];
                        var img = category['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>

                                        ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              category['img'],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
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
                                                      text: '₹5000.00',
                                                      style: FTextStyle
                                                          .prizeStyle5,
                                                    ),
                                                    TextSpan(
                                                      text: ' ${Utils.currencySymbol}3000.00',
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
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'CHIC FOR THE WORKPLACE'),
                  NWidgets.ksizedBox(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/ClothsButtonCms/casual.png',
                          fit: BoxFit.fill,
                          width: width / 2,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/ClothsButtonCms/strignt.png',
                          fit: BoxFit.fill,
                          // fit: BoxFit.cover,
                          width: width / 2,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    height: 350,
                    child: ListView.builder(
                      itemCount: widget.mapdata['trending'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = widget.mapdata['trending'][index];
                        var img = category['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>

                                        ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              category['img'],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
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
                                                      text: '₹5000.00',
                                                      style: FTextStyle
                                                          .prizeStyle5,
                                                    ),
                                                    TextSpan(
                                                      text: ' ${Utils.currencySymbol}3000.00',
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
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'GLITZ FOR PARTY TIMES'),
                  NWidgets.ksizedBox(context),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sometimes, it's as if life is one long party! But then, every party is different from the other & calls for a unique look. So, here’s a mashup of Pakistani, Sequined and Contemporary Suits to don at daytime garden parties and evening galas. Look out for bling, dramatic necklines & full sleeves to channel your inner diva.",
                      style: FTextStyle.paragrphStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Image.asset(
                    'images/ClothsButtonCms/sedsuits.png',
                    fit: BoxFit.fill,
                    width: width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/ClothsButtonCms/StoneWork.png',
                          fit: BoxFit.fill,
                          width: width / 2,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/ClothsButtonCms/contemp.png',
                          fit: BoxFit.fill,
                          // fit: BoxFit.cover,
                          width: width / 2,
                        ),
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    height: 350,
                    child: ListView.builder(
                      itemCount: widget.mapdata['trending'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = widget.mapdata['trending'][index];
                        final img = category['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>

                                        ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              category['img'],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
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
                                                      text: '₹5000.00',
                                                      style: FTextStyle
                                                          .prizeStyle5,
                                                    ),
                                                    TextSpan(
                                                      text: ' ${Utils.currencySymbol}3000.00',
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
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'WHAT’S TRENDING'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    height: height / 5,
                    child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = items[index];
                        return GestureDetector(
                          onTap: () {
                            // print(category);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Stack(children: [
                                        Card(
                                          color: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                              // borderRadius: BorderRadius.circular(10.0),
                                              ),
                                          elevation: 0,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'images/ClothsButtonCms/dori.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                          // margin: EdgeInsets.all(10),
                                        ),
                                      ]),
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
                  NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // color: Colors.cyan,
                    height: 350,
                    child: ListView.builder(
                      itemCount: widget.mapdata['trending'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = widget.mapdata['trending'][index];
                        final img = category['img'];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>

                                        ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '', smallimg: '',)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  // color: Colors.grey,
                                  width: width / 2,
                                  // height: height / 4,
                                  child: Column(
                                    // crossAxisAlignment: Axis.horizont,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            ),
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              category['img'],
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                category['name'],
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
                                                      text: '₹5000.00',
                                                      style: FTextStyle
                                                          .prizeStyle5,
                                                    ),
                                                    TextSpan(
                                                      text: ' ${Utils.currencySymbol}3000.00',
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

                                  // Column(
                                  //   // crossAxisAlignment: Axis.horizont,
                                  //   children: [
                                  //     Card(
                                  //       color: Colors.white,
                                  //       shape: const RoundedRectangleBorder(
                                  //           // borderRadius: BorderRadius.circular(10.0),
                                  //           ),
                                  //       elevation: 1,
                                  //       child: Column(
                                  //         children: [
                                  //           Image.asset(
                                  //             'images/trendImg/trend.png',
                                  //             fit: BoxFit.cover,
                                  //           ),
                                  //           const Text(
                                  //             "Embroidered Georgette \n Pakistani Suit in Mustard",
                                  //             textAlign: TextAlign.left,
                                  //             style: TextStyle(
                                  //               fontFamily: 'SourceSansPro',
                                  //               fontSize: 13,
                                  //               color: Colors.black,
                                  //               // fontWeight: FontWeight.bold
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       // margin: EdgeInsets.all(10),
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(context, 'SPOTLIGHT ON OUR HIGHLIGHTS'),
                  NWidgets.ksizedBox(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/ClothsButtonCms/StoneWork.png',
                        fit: BoxFit.fill,
                        width: width / 2.2,
                      ),
                      Image.asset(
                        'images/ClothsButtonCms/contemp.png',
                        // fit: BoxFit.fill,
                        fit: BoxFit.cover,
                        width: width / 2.2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/ClothsButtonCms/StoneWork.png',
                        fit: BoxFit.fill,
                        width: width / 2.2,
                      ),
                      Image.asset(
                        'images/ClothsButtonCms/contemp.png',
                        // fit: BoxFit.fill,
                        fit: BoxFit.cover,
                        width: width / 2.2,
                      ),
                    ],
                  ),
                  NWidgets.ksizedBox(context),
                  NWidgets.kheadinghome(
                      context, 'WHAT YOU ALSO NEED TO COMPLETE THE LOOK'),
                  NWidgets.ksizedBox(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/ClothsButtonCms/oxid.png',
                        fit: BoxFit.fill,
                        width: width / 2.2,
                      ),
                      Image.asset(
                        'images/ClothsButtonCms/oxid.png',
                        // fit: BoxFit.fill,
                        fit: BoxFit.cover,
                        width: width / 2.2,
                      ),
                    ],
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
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CUSTOMIZATION - THE UDESIGN MAGIC',
                      style: FTextStyle.khomeheadingStyle,
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Get your dream Kurta in just the length you prefer so that it looks super flattering on you. Experiment with the neck styles, specifying the depth of the back and neckline. Choose the bottomwear from salwar, churidar and trouser style. Give the sleeves of your kurta your personal signature. Sleeveless, short sleeved, elbow length or above the wrist - your wish is our command at U-Design.",
                        textAlign: TextAlign.justify,
                        style: FTextStyle.paragrphStyle,
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const loginScreen()));
                        // (Route<dynamic> route) => false);
                        //signup screen
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      child: const Text(
                        "Explore UDesign",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: AppColors.underlineTextcolorheading,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const loginScreen()));
                        // (Route<dynamic> route) => false);
                        //signup screen
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      child: const Text(
                        "Click here for Measurement Guide",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // decoration:
                          // TextDecoration.underline,
                          fontFamily: 'SourceSansPro',
                          color: AppColors.underlineTextcolorheading,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'images/ClothsButtonCms/size.png',
                    fit: BoxFit.fill,
                    width: width,
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
                            title: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'SALWAR SUITS FOR STYLE & CONVENIENCE',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            children: const <Widget>[
                              ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Indisputably the queen of all Indian attires is the Salwar Kameez. Predominantly worn in North India and now popular in all parts of the country and world, Salwar Suits are as suitable for everyday wear as they are for ceremonial ones. Here is an attire that flatters every body type and is the modern woman’s best friend. In fact, no two ensembles are the same, as multiple colors, length of kameez, styling, prints and threadwork brings forth the Salwar Suit in its zillion avatars.",
                                    textAlign: TextAlign.left,
                                    style: FTextStyle.paragrphStyle,
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
                          ExpansionTile(
                            trailing: Icon(
                              isExpanded1
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isExpanded1
                                  ? AppColors.primaryColorpink
                                  : Colors.grey,
                            ),
                            title: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'WHAT’S YOUR FAVE SALWAR SUIT?',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            children: const <Widget>[
                              ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Indisputably the queen of all Indian attires is the Salwar Kameez. Predominantly worn in North India and now popular in all parts of the country and world, Salwar Suits are as suitable for everyday wear as they are for ceremonial ones. Here is an attire that flatters every body type and is the modern woman’s best friend. In fact, no two ensembles are the same, as multiple colors, length of kameez, styling, prints and threadwork brings forth the Salwar Suit in its zillion avatars.",
                                    textAlign: TextAlign.left,
                                    style: FTextStyle.paragrphStyle,
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
                          ExpansionTile(
                            trailing: Icon(
                              isExpanded2
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isExpanded2
                                  ? AppColors.primaryColorpink
                                  : Colors.grey,
                            ),
                            title: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'NAME THE OCCASION, AND IT WORKS',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            children: const <Widget>[
                              ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Indisputably the queen of all Indian attires is the Salwar Kameez. Predominantly worn in North India and now popular in all parts of the country and world, Salwar Suits are as suitable for everyday wear as they are for ceremonial ones. Here is an attire that flatters every body type and is the modern woman’s best friend. In fact, no two ensembles are the same, as multiple colors, length of kameez, styling, prints and threadwork brings forth the Salwar Suit in its zillion avatars.",
                                    textAlign: TextAlign.left,
                                    style: FTextStyle.paragrphStyle,
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
                          ExpansionTile(
                            trailing: Icon(
                              isExpanded3
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isExpanded3
                                  ? AppColors.primaryColorpink
                                  : Colors.grey,
                            ),
                            title: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'THE ELONGATED SILHOUETTES',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            children: const <Widget>[
                              ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Indisputably the queen of all Indian attires is the Salwar Kameez. Predominantly worn in North India and now popular in all parts of the country and world, Salwar Suits are as suitable for everyday wear as they are for ceremonial ones. Here is an attire that flatters every body type and is the modern woman’s best friend. In fact, no two ensembles are the same, as multiple colors, length of kameez, styling, prints and threadwork brings forth the Salwar Suit in its zillion avatars.",
                                    textAlign: TextAlign.left,
                                    style: FTextStyle.paragrphStyle,
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
                          ExpansionTile(
                            trailing: Icon(
                              isExpanded4
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isExpanded4
                                  ? AppColors.primaryColorpink
                                  : Colors.grey,
                            ),
                            title: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'GET IT FROM UTSAV FASHION',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            children: const <Widget>[
                              ListTile(
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Indisputably the queen of all Indian attires is the Salwar Kameez. Predominantly worn in North India and now popular in all parts of the country and world, Salwar Suits are as suitable for everyday wear as they are for ceremonial ones. Here is an attire that flatters every body type and is the modern woman’s best friend. In fact, no two ensembles are the same, as multiple colors, length of kameez, styling, prints and threadwork brings forth the Salwar Suit in its zillion avatars.",
                                    textAlign: TextAlign.left,
                                    style: FTextStyle.paragrphStyle,
                                  ),
                                ),
                              ),
                            ],
                            onExpansionChanged: (value) {
                              setState(() {
                                isExpanded4 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
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
