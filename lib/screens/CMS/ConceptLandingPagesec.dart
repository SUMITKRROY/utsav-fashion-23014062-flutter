import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

import '../ShoppingBag/ShoppingBloc/shopping_bloc.dart';



class ConceptLandingPagesec extends StatefulWidget {
  const ConceptLandingPagesec({Key? key}) : super(key: key);

  @override
  State<ConceptLandingPagesec> createState() => _ConceptLandingPagesecState();
}

class _ConceptLandingPagesecState extends State<ConceptLandingPagesec> {
  List<String> images = [
    "images/gridImg/bride.png",
    "images/gridImg/bridemom.png",
    "images/gridImg/bridemates.png",
    "images/gridImg/groom.png"
  ];

  List<String> images2 = [
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
    "images/gridImg/frameGirl.png",
    // "images/gridImg/bride.png",
    // "images/gridImg/bride.png",
    // "images/gridImg/bride.png",
    // "images/gridImg/bridemom.png",
    // "images/gridImg/bridemates.png",
    // "images/gridImg/groom.png"
  ];
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
                          const NavBarBottom(selectedIndex: 0,)));

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
                                builder: (context) => BlocProvider(
                                  create: (context) => ShoppingBloc(),
                                  child: ShoppingBag(addToCartData1: {}),
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
            SizedBox(
              height: height * 0.010,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height / 1.5,
                      width: width,
                      child: Container(
                        child: Image.asset(
                          'images/ConceptPageLanding/tendsban.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "FROM THE EDITOR'S DESK",
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  const Text(
                    'What makes the Salwar Kameez truly irresistible? Well, it’s perfect for every season, every reason, every body type and every occasion. No wonder we call it the queen of ethnic fashion! For the modern Indian woman who wants to dress up quickly and conveniently and yet look magical, we present the Salwar Kameez in its zillion avatars!',
                    style: FTextStyle.paragrphStyle,
                  ),
                  NWidgets.ksizedBox(context),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height / 2.2,
                      width: width,
                      child: Container(
                        child: Image.asset(
                          'images/ConceptPageLanding/bloomingPass.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  const Text(
                    'What makes the Salwar Kameez truly irresistible? Well, it’s perfect for every season, every reason, every body type and every occasion. No wonder we call it the queen of ethnic fashion! For the modern Indian woman who wants to dress up quickly and conveniently and yet look magical, we present the Salwar Kameez in its zillion avatars!',
                    textAlign: TextAlign.justify,
                    style: FTextStyle.paragrphStyle,
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // height: 67,
                    // width: 362,
                    height: height * 0.067,
                    width: width * 362,
                    child: ElevatedButton(
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                        //
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const NavBarBottom()));
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('Processing Data')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.pricecolor, // background
                      ),
                      child: const Text(
                        "SHOP FLORAL STYLES",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: AppColors.buttongrey,
                            fontWeight: FontWeight.w700),
                      ),
                      // icon: const Icon(
                      //   Icons.arrow_back,
                      // ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height / 2.2,
                      width: width,
                      child: Container(
                        child: Image.asset(
                          'images/ConceptPageLanding/pelli.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  NWidgets.ksizedBox(context),
                  const Text(
                    'What makes the Salwar Kameez truly irresistible? Well, it’s perfect for every season, every reason, every body type and every occasion. No wonder we call it the queen of ethnic fashion! For the modern Indian woman who wants to dress up quickly and conveniently and yet look magical, we present the Salwar Kameez in its zillion avatars!',
                    textAlign: TextAlign.center,
                    style: FTextStyle.paragrphStyle,
                  ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    // height: 67,
                    // width: 362,
                    height: height * 0.067,
                    width: width * 362,
                    child: ElevatedButton(
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                        //
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const NavBarBottom()));
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('Processing Data')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.pricecolor, // background
                      ),
                      child: const Text(
                        "SHOP SHEER FASION",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: AppColors.buttongrey,
                            fontWeight: FontWeight.w700),
                      ),
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
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Our Other Edits",
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                  SizedBox(
                    // color: Colors.cyan,
                    height: height / 3.5,
                    child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = items[index];
                        return GestureDetector(
                          onTap: () {
                            print(category);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: width / 2.5,
                                  // height: height / 4,
                                  child: Column(
                                    children: [
                                      Stack(children: [
                                        Card(
                                          color: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                              ),
                                          elevation: 0,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'images/ConceptPageLanding/tensred.png',
                                                fit: BoxFit.fill,
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
