import 'package:flutter/material.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'dart:developer' as developer;

class TrendsWeLove extends StatefulWidget {
  Map<String, dynamic> mapdata;
  TrendsWeLove({Key? key, required this.mapdata}) : super(key: key);

  @override
  State<TrendsWeLove> createState() => _TrendsWeLoveState();
}

class _TrendsWeLoveState extends State<TrendsWeLove> {
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

  Map<String, dynamic> mapdataa = {
    "data": [
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_04.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/ring-ceremony-concept.jpg",
        "name": "Ring "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_05.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/sangeet-gala-concept.jpg",
        "name": "Sangeet "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_07.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/mehendi-funtion-concept.jpg",
        "name": "Mehendi "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_08.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/haldi-ritual-concept.jpg",
        "name": "Haldi "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_10.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/cocktail-party-concept.jpg",
        "name": "Cocktail "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_11.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-pheras-concept.jpg",
        "name": "Wedding "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_12.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/reception-revelry-concept.jpg",
        "name": "Reception "
      },
    ]
  };

  var Subfield;
  var Subvalue;
  var kcategory_id;
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
                      //         builder: (context) =>   FilterList()));
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.70,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: widget
                        .mapdata["Trends_We_Love"]["header"]["image"].length,
                    itemBuilder: (BuildContext context, int index) {
                      String imageUrl = widget.mapdata["Trends_We_Love"]
                          ["header"]["image"][index]["img_url"];
                      return InkWell(
                        onTap: () {
                          var title = widget.mapdata["Trends_We_Love"]["header"]
                              ["image"][index]['sub_title'];
                          var urlkey = widget.mapdata["Trends_We_Love"]
                              ["header"]["image"][index]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          imageUrl,
                          //fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.mapdata['Trends_We_Love']["header"]['title'],
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                ),
              ],
            ),
          ),
          NWidgets.ksizedBox(context),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              widget.mapdata['Trends_We_Love']['header']['description'],
              textAlign: TextAlign.justify,
              style: FTextStyle.paragrphStyle,
            ),
          ),
          NWidgets.ksizedBox(context),
          InkWell(
            onTap: (){
              var title = widget.mapdata['Trends_We_Love']['gifImg']['sub_title'];
              var urlkey = widget.mapdata['Trends_We_Love']['gifImg']['url_key'];
              Utils.navigateToMixCategoryLandingPage(
                  context, title, urlkey);
            },
            child: Card(
              child: Image.network(
                widget.mapdata['Trends_We_Love']['gifImg']["img_url"],
                fit: BoxFit.fill,
                height: height / 2.6,
              ),
            ),
          ),
          NWidgets.ksizedBox(context),
          NWidgets.ksizedBox(context),
          SizedBox(
            height: height / 2,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  (widget.mapdata['Trends_We_Love']['palette'].length / 2)
                      .ceil(),
              itemBuilder: (context, index) {
                final int imageIndex1 = index * 2;
                final int imageIndex2 = imageIndex1 + 1;
                return Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['palette'][imageIndex1]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['palette'][imageIndex1]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['palette']
                              [imageIndex1]['img_url'],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['palette'][imageIndex2]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['palette'][imageIndex2]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['palette']
                              [imageIndex2]['img_url'],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          NWidgets.ksizedBox(context),
          NWidgets.ksizedBox(context),
          SizedBox(
            height: height / 2,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
              (widget.mapdata['Trends_We_Love']['textile'].length / 2)
                  .ceil(),
              itemBuilder: (context, index) {
                final int imageIndex1 = index * 2;
                final int imageIndex2 = imageIndex1 + 1;
                return Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['textile'][imageIndex1]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['textile'][imageIndex1]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['textile']
                          [imageIndex1]['img_url'],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['textile'][imageIndex2]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['textile'][imageIndex2]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['textile']
                          [imageIndex2]['img_url'],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          NWidgets.ksizedBox(context),
          NWidgets.ksizedBox(context),
          SizedBox(
            height: height / 2,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
              (widget.mapdata['Trends_We_Love']['favorites'].length / 2)
                  .ceil(),
              itemBuilder: (context, index) {
                final int imageIndex1 = index * 2;
                final int imageIndex2 = imageIndex1 + 1;
                return Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['favorites'][imageIndex1]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['favorites'][imageIndex1]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['favorites']
                          [imageIndex1]['img_url'],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var title = widget.mapdata['Trends_We_Love']['favorites'][imageIndex2]['sub_title'];
                          var urlkey = widget.mapdata['Trends_We_Love']['favorites'][imageIndex2]['url_key'];
                          Utils.navigateToMixCategoryLandingPage(
                              context, title, urlkey);
                        },
                        child: Image.network(
                          widget.mapdata['Trends_We_Love']['favorites']
                          [imageIndex2]['img_url'],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          NWidgets.ksizedBox(context),
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
                      widget.mapdata["Trends_We_Love"]["our_edit"]["title"],
                      style: FTextStyle.H1Headings,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              // controller: _pageController,
              itemCount:
                  widget.mapdata["Trends_We_Love"]["our_edit"]["slider"].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // var imgurl = widget.mapdata['plussize']['bnanner_url'][index]["ban_img"];
                    var title = widget.mapdata["Trends_We_Love"]["our_edit"]["slider"]
                        [index]['sub_title'];
                    var urlkey = widget.mapdata["Trends_We_Love"]["our_edit"]["slider"]
                        [index]['url_key'];
                    Utils.navigateToMixCategoryLandingPage(
                        context, title, urlkey);
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
                                      widget.mapdata["Trends_We_Love"]
                                              ["our_edit"]["slider"][index]
                                          ["img_url"],
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 5,
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
        ]),
      ),
    );
  }
}
