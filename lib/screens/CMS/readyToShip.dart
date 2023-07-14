import 'package:flutter/material.dart';

import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';
import '../Home/ProductDetails/ProductDetails.dart';



class ReadyToShip extends StatefulWidget {
  const ReadyToShip({Key? key}) : super(key: key);

  @override
  State<ReadyToShip> createState() => _ReadyToShipState();
}

class _ReadyToShipState extends State<ReadyToShip>
    with SingleTickerProviderStateMixin {

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
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-satin-georgette-pakistani-suit-in-black-v1-kch2088_3.jpg",
      //   "name": "Embroidered Georgette Pakistani Suit in Brown"},
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
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/p/r/printed-pure-cotton-a-line-suit-in-sky-blue-v1-kpx73.jpg",
      //   "name": "Embroidered Georgette Pakistani Suit in grey"},
      // {"img": "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/s/o/solid-color-polyester-viscose-blazer-with-trousers-in-black-v1-mst852.jpg",
      //   "name": "Embroidered Georgette Coat"},
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
            SizedBox(
              height: height * 0.010,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "READY TO SHIP INDIAN FASHION".toUpperCase(),
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  const Text(
                    'Presenting the latest Indian Fashion trends for those who hate to wait. Choose your favorite outfit from thousands of available options from our Ready to Ship Collection. We will send it in the blink of an eye. No Waiting, No Followups, No Delays. Just pure fashion. So get ready to style up for your friends wedding, family rituals or a grand festival well in time.',
                    textAlign: TextAlign.justify,
                    style: FTextStyle.paragrphStyle,
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
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
                      const SizedBox(width: 20),
                      Expanded(
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
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SizedBox(
                // color: Colors.lightGreen,
                height: height / 1.6,
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
                  itemCount: _trendingMap['trending'].length,

                  itemBuilder: (context, index) {
                    var img = _trendingMap['trending'][index]['img'];
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
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text.rich(
                                      TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: itemname[index],
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
            SizedBox(
              height: height * 0.010,
            ),
            // EdgeInsets.fromLTRB(10,0,10,0),
          ],
        ),
      ),
    );
  }
}
