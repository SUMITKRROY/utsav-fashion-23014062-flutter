import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';

import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';


import '../../utils/widgets.dart';



class ConceptPage extends StatefulWidget {
  String img;
  List imglist;
  String bnrimg;
  String name;
  ConceptPage(
      {Key? key,
      required this.img,
      required this.bnrimg,
      required this.name,
      required this.imglist})
      : super(key: key);

  @override
  State<ConceptPage> createState() => _ConceptPageState();
}

class _ConceptPageState extends State<ConceptPage> {




  List itemname = [
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
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                "images/Arrow_Back.png",
                height: 20,
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
                      builder: (context) => NavBarBottom(
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
          centerTitle: true,
        ),
        // body: bottomNavigationBar,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: height / 4,
                  width: width,
                  child: Container(
                    child: Image.network(
                      widget.bnrimg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: AppColors.Textcolorheading,
                        fontWeight: FontWeight.w600,
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
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: widget.img == ''
                    ? SizedBox(
                        // color: Colors.lightGreen,
                        // height: height /2,
                        // height: height*0.510,
                        child: GridView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.50,
                          ),
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemCount: widget.imglist.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var img = widget.imglist[index];

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
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/loading.gif'))),
                                          child: Image.network(
                                            widget.imglist[index],
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
                                                      context, widget.img);
                                                  // _buildBottomDrawer(context);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Embroidered Net Scalloped Saree in Red",
                                        textAlign: TextAlign.left,
                                        style: FTextStyle.decStyle,
                                      ),
                                    ),
                                    SizedBox(
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
                                              style: FTextStyle.prizeStyle5,
                                            ),
                                            TextSpan(
                                              text: '${Utils.currencySymbol}3000.00',
                                              style: FTextStyle.prizeStyle3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
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
                                                    style: FTextStyle
                                                        .offprizeStyle,
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
                      )
                    : SizedBox(
                        // color: Colors.lightGreen,
                        // height: height /2,
                        // height: height*0.510,
                        child: GridView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.50,
                          ),
                          controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemCount: 4,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var img = widget.img;
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
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/loading.gif'))),
                                          child: Image.network(
                                            widget.img,
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
                                                      context, widget.img);
                                                  // _buildBottomDrawer(context);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Embroidered Net Scalloped Saree in Red",
                                        textAlign: TextAlign.left,
                                        style: FTextStyle.decStyle,
                                      ),
                                    ),
                                    SizedBox(
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
                                    SizedBox(
                                      height: 5,
                                    ),
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
                                                    style: FTextStyle
                                                        .offprizeStyle,
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
      ),
    );
  }
}
