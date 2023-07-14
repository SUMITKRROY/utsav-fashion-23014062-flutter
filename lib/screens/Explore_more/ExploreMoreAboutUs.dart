import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ExploreMoreAboutUs extends StatefulWidget {
  const ExploreMoreAboutUs({Key? key}) : super(key: key);

  @override
  State<ExploreMoreAboutUs> createState() => _ExploreMoreAboutUsState();
}

class _ExploreMoreAboutUsState extends State<ExploreMoreAboutUs> {

  bool isExpanded = false;


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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "images/Arrow_Back.png",
              height: 20,
              width: 22,
              // color: Colors.grey,
            ),
          ),
          title: NWidgets.kappbarheading(context,"About US")
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "WHO WE ARE",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "The journey of Utsav Fashion began in the year 2000 with the opening of our first wholesale and retail outlet in Jaipur, India. After the success of this store, Utsav Fashion launched its online store in 2003, never looking back since then. Today, it is the world's preferred choice for Indian Ethnic Fashion and sets new standards of customer delight every day.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "WHAT WE STAND FOR",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "We are a one-stop webshop offering the widest variety of authentic and trendy ethnic fashion. Our online platform offers it all - sarees, salwar kameez, lehengas, contemporary Indo Westerns with an exquisite collection of accessories.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "OUR MISSION",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "To provide our customers a truly international online shopping experience, we guarantee superior quality and craftsmanship through our range, supported by swift and secure processes right from purchase to product delivery and beyond.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "OUR VISION",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "We envisage ourselves as the best online shopping experience for customers worldwide, providing rich Indian artistry through truly international fashion statements. The aim is to source the best of Indian Ethnic Fashion and spread its magic.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Divider(
                        height: height * 0.010,
                      ),

                      SizedBox(
                        height: height * 0.020,
                      ),

                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "WHAT’S SPECIAL ABOUT US",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color:   AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/15thyear.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "A 15-Year Old Legacy",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "We envisage ourselves as the best online shopping experience for customers worldwide, providing rich Indian artistry through truly international fashion statements. The aim is to source the best of Indian Ethnic Fashion and spread its magic.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color:   AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/hanger.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "The Latest Collection",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Our collection encompasses 75,000 of the latest Indian styles. Our team of fashion experts work with artisans and weavers to bring you red-hot trends inspired by fashion runways.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/birdWithGift.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Fast Fashion for You",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Not everyone can boast of a Ready to Ship Collection as exciting as ours. You’ll never miss an occasion when you shop from our repertoire that’s set for dispatch within 24 hours.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/singlehanger.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Plus Styles Galore",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Unlike many online stores, we have a dedicated collection of Ready-to-Wear styles in plus size. We also have an exclusive tailoring section for stitching Indian styles in larger sizes.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/tailor.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Customization & Stitching",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Our unique UDesign service offers customization in your chosen design, ensuring tailored perfection in the fit, styling & adornment. It’s like having a boutique that creates just for you.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      // Curation by Occasion
                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/dress.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Curation by Occasion",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Having a specialized curation team gives us an edge. We curate collections by festivals, colors, body types, zodiac signs, weddings, types of ethnic work - and more. Makes shopping so easy.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/navigation.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Pan-India Specialities",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Where would you find authentic treasures from artisan hubs across India? Right here. Kanjeevaram from Tamil Nadu, Baluchari from Bengal, Leheriya from Rajasthan...et al.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/gadget.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Mobile-Ready Experience",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "We’ve put the finest technology at work so that all our front-end platforms are futuristic and mobile-ready. Shop from your mobile with ease, and get prices in your local currency to boot.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Container(
                        color: AppColors.cardWhite,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Image.asset(
                              "images/appBarIcon/cartbag.png",
                              height: 45,
                              width: 45,
                              // color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "For Weddings & Bulk Orders",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "For those living outside India, our hand-picked wedding closet and bridal trousseau of the richest Indian garbs is a dream come true. We also offer special discounts for bulk purchase.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Explore!",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors
                                        .primaryColorblueforexplorescreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                    ],
                  ),

                  Divider(
                    height: height * 0.010,
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Celebrating India Anywhere",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),

                  Image.asset(
                    "images/appBarIcon/dressgirl.png",
                    height: 150,
                    width: width,
                    // color: Colors.grey,
                  ),

                  SizedBox(
                    height: height * 0.020,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What happens when the global Indian is looking for the finest ethnic wear? The search ends at utsavfashion.com. The incredible range, customization options and worldwide delivery are sure to bring smiles to faces across the world. Watch it for some slice-of-life fashion solutions from incredible India.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 14,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.020,
                  ),
                  Divider(
                    height: height * 0.010,
                  ),

                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "LET'S GET STARTED",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.020,
                  ),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A warm welcome to this amazing journey, Just SIGN IN for the best shopping experience.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 14,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
