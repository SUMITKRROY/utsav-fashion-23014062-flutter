import 'package:flutter/material.dart';
 import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';
import 'package:utsav/screens/WhishList/shareWhislist.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

import '../../utils/utils.dart';



class WishListHome extends StatefulWidget {
  const WishListHome({Key? key}) : super(key: key);

  @override
  State<WishListHome> createState() => _WishListHomeState();
}

class _WishListHomeState extends State<WishListHome> {
  List<String> images = [
    "images/whishListGridImg/lady1.png",
    "images/whishListGridImg/lady2.png",
    "images/SimPod/simgolg.png",
    "images/SimPod/simring.png",
  ];
  List<String> images2 = [
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-pure-silk-handloom-saree-in-red-v1-smua137.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-light-purple-v1-ssf16661.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-peacock-style-brahmi-nath-v1-jpm5901.jpg",
  ];


  int activeIndex = 0;
  List itemname= [
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding:   EdgeInsets.all(width*0.012),
            child: Column(
              children: [
                SizedBox(
                  child: GridView.builder(

                    physics: const NeverScrollableScrollPhysics(),

                    controller: ScrollController(keepScrollOffset: true),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.47,
                    ),
                    itemCount: images2.length ,
                    itemBuilder: (BuildContext context, int index) {
                      var img = images2[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            child: Card(
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                              child: Column(
                                children: [
                                  Image.network(
                                    img,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Embroidered Net Scalloped ",
                                        textAlign: TextAlign.left,
                                        style: FTextStyle.decStyle
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
                                              style: FTextStyle.prizeStyle5
                                          ),
                                          TextSpan(
                                              text: ' ${Utils.currencySymbol}3000.00',
                                              style: FTextStyle.prizeStyle3
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: 30,
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             SoldPrdWithLogin(img: i,)));
                                              // SoldPrdWtLogin(img: i,)));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors
                                                  .primaryColorpink, // background
                                            ),
                                            child:  Text(
                                              "ADD TO BAG".toUpperCase(),
                                              style: FTextStyle.addtobigStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.040,
                                      ),
                                      const Text(
                                        "Remove",
                                        // style: TextStyle(
                                        //     decoration: TextDecoration.underline,
                                        //     fontFamily: 'SourceSansPro',
                                        //     fontSize: 15,
                                        //     color: AppColors.Textcolorheadingblack,
                                        //     fontWeight: FontWeight.w400),
                                        style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                color: AppColors.Textcolorheadingblack,
                                                offset: Offset(0, -2))
                                          ],
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'SourceSansPro',
                                          color: Colors.transparent,
                                          fontWeight: FontWeight.w400,
                                          decorationColor: AppColors.Textcolorheadingblack,
                                          decorationThickness: 1.5,
                                          fontSize: 15,
                                          decorationStyle:
                                          TextDecorationStyle.solid,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // margin: EdgeInsets.all(10),
                            ),
                            onTap: (){


                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //
                              //             ProductsDetails(img: img, label: '', regPrice: '', minPrice: '', productId: '', subImgUrl: '',)));

                            },
                          ),
                        ],
                      );

                    },


                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Share It! It’s easy to share your Wishlist with friends or family through email. ",
                    style: FTextStyle.shareItStyle,
                  ),
                ),
                // textgrey
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: 67,
                  // width: 362,
                  height: height * 0.067,
                  width: width * 362,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShareWishList()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColorpink, // background
                    ),
                    child: const Text(
                      "SHARE WISHLIST",

                      style: FTextStyle.shareWishStyle,
                    ),
                    // icon: const Icon(
                    //   Icons.arrow_back,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
