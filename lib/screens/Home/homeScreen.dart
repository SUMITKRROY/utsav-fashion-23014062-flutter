import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:utsav/Model/SimilarItemModel.dart';
import 'package:utsav/screens/Account/createAccount.dart';
import 'package:utsav/screens/CMS/ConceptPage.dart';
import 'package:utsav/screens/CMS/ListingLandingPage.dart';
import 'package:utsav/screens/CMS/cmsLandingPage.dart';
import 'package:utsav/screens/CMS/readyToShip.dart';
 import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';
import 'package:utsav/screens/Home/helpScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShopPage/MixCategoryLandingPage.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

import '../ShopPage/ShopBloc/shop_bloc.dart';
import 'HomeBloc/home_bloc.dart';
import 'ProductDetails/ProductBloc/product_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.4);


  List<dynamic> recentlyViewed = [];
  List<dynamic> trendingMap = [];
  @override
  void initState() {

    BlocProvider.of<HomeBloc>(context).add(HomeScreenHandler(Utils.userkey));
    BlocProvider.of<HomeBloc>(context).add(NostoApiSimilarProductHome(AppUrl.nostoAutheKey));

    super.initState();
  }

  final Map<String, dynamic> _brideInfoMap = {
    "bride": [
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-art-silk-lehenga-in-maroon-v1-lyc1116.jpg",
        "name": "BRIDE  "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-purple-v1-spta11138.jpg",
        "name": "BRIDE'S MOM"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/k/c/kch628_3.jpg",
        "name": "BRIDE'S MAID"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-sherwani-in-off-white-v1-muy521.jpg",
        "name": "GROOM"
      }
    ]
  };

  final Map<String, dynamic> _ListviewMap = {
    "list": [
      {"img": "images/listViewimg/saree.png", "name": "Saree"},
      {"img": "images/listViewimg/lhenga.png", "name": "Kids"},
      {"img": "images/listViewimg/men.png", "name": "Lehenga"},
      {"img": "images/listViewimg/lhenga.png", "name": "Men "},
      {"img": "images/listViewimg/saree.png", "name": "Saree"},
      {"img": "images/listViewimg/lhenga.png", "name": "Kids"},
      {"img": "images/listViewimg/kids.png", "name": "Lehenga"},
      {"img": "images/listViewimg/kids.png", "name": "Men "},
    ]
  };

  final Map<String, dynamic> _hidengemMap = {
    "hidenGem": [
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-georgette-abaya-style-suit-in-peach-v1-kch7785_2.jpg",
        "name": "PAKISTANI SUITS",
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/d/i/digital-printed-georgette-pakistani-suit-in-peach-v1-uku1349.jpg",
        "name": "PARTY WEAR FOR KIDS"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-earrings-v1-jdn211.jpg",
        "name": "MEENAKARI JEWELRY"
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/a/bandhej-printed-cotton-tiered-kurta-in-black-v1-tzs90.jpg",
        "name": "FUSION KURTAS"
      },
    ]
  };







  Map<String, dynamic> mapdata = {
    "data": [
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_04.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/bridal-treasures-concepts.jpg",
        "name": "Bridal "
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
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/bridesmaids-favorites-concepts.jpg",
        "name": "Bridesmaids "
      },
      {
        "img":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_08.jpg",
        "bnrimg":
            "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/1901/grooms-chattels-concepts.jpg",
        "name": "Grooms "
      },
    ]
  };

  int activeIndex = 0;
  var rating = 0.0;
  static const IconData star = IconData(0xe5f9, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is SuccessHomeData) {

              Map<String, dynamic> jsonData = json.decode(state.homeScreenDataModel['items'][0]['content']);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        controller: _pageController,
                        // itemCount: _ListviewMap['list'].length,
                        itemCount: jsonData["CategoryList"]["list"].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // final category = state.homeScreenDataModel['items'][0]['categoryList']['list'][index];
                          final category = _ListviewMap['list'][index];
                          // print("category>>>name$category");
                          return GestureDetector(
                            onTap: () {
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CmsLandingPage(
                                            heding: '',
                                            mapdata: _trendingMap,
                                            festivdata: _brideInfoMap,
                                          )));*/
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.primaryColorpink
                                        .withOpacity(0.10),
                                    radius: 30,
                                    child: Image.network(
                                      jsonData["CategoryList"]["list"][index]['img'],
                                      // 'images/jewelry.jpg',
                                      height: 45,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(jsonData["CategoryList"]["list"][index]['name'],
                                      style: FTextStyle.khomesubheadingStyle),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount:
                                  jsonData["Carouselbanner"]["items"].length,
                              options: CarouselOptions(
                                  height: height / 1.8,
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
                                      Container(
                                        height: height * 0.700,
                                        decoration: BoxDecoration(
                                          // color:Colors.red,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              '${jsonData["Carouselbanner"]["items"][index]["img_url"]}',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        right: 0.0,
                                        left: 0,
                                        // top: 0,
                                        child: Align(
                                          child: SizedBox(
                                            height: 50,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: jsonData["Carouselbanner"]["items"][index]["buttonItems"].length,


                                              itemBuilder: (BuildContext context, int ixd) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                        color: Colors.white,
                                                      ),
                                                      height: height * 0.040,
                                                      width: 100,
                                                      child: Center(
                                                        child: Text(
                                                            '${jsonData["Carouselbanner"]["items"][index]["buttonItems"][ixd]["btn_name"]}',
                                                            style: FTextStyle
                                                                .khomesubheadingStyle),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                     var url_key  = jsonData["Carouselbanner"]["items"][index]["buttonItems"][ixd]["url_key"];
                                                     var title  = jsonData["Carouselbanner"]["items"][index]["buttonItems"][ixd]["btn_name"];
                                                     var Subfield ;
                                                     var Subvalue;
                                                     var kcategory_id;
                                                     List url = [];
                                                      developer.log('url_key>>>$url_key');

                                                     var urlkey = jsonData["Carouselbanner"]["items"][index]["buttonItems"][ixd]["url_key"];
                                                     developer.log("urlkey>>>>${urlkey}");



                                                     switch (title) {
                                                       case "SALE":
                                                         {
                                                           Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                   builder: (context) =>  MultiBlocProvider(

                                                                     providers: [
                                                                       BlocProvider(
                                                                         create: (context) => ShopBloc(),),
                                                                       BlocProvider(
                                                                         create: (context) => ProductBloc(),) ,


                                                                     ],
                                                                     child: MixCategoryLandigPage(
                                                                       heding: title,
                                                                       Subattribute_Id: '20',
                                                                       field: 'discount',
                                                                       value:  '[494,495,496,497,498,499,500,501]',
                                                                       // value:  '499',
                                                                       Subfield: '',
                                                                       Subvalue:  '',
                                                                       Count: Utils.product_count,
                                                                       Sunatrribute_code: '',
                                                                       pageSize: '',
                                                                       condition_type: 'in',
                                                                       SubCondition_type: 'in', filterdata: [],

                                                                     ),
                                                                   )));
                                                         };
                                                         break;

                                                       case "BEST SELLER":
                                                         {
                                                           Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                   builder: (context) =>  MultiBlocProvider(

                                                                     providers: [
                                                                       BlocProvider(
                                                                         create: (context) => ShopBloc(),),
                                                                       BlocProvider(
                                                                         create: (context) => ProductBloc(),) ,

                                                                     ],
                                                                     child: MixCategoryLandigPage(
                                                                       heding: title,
                                                                       Subattribute_Id: '20',
                                                                       field: 'feature',
                                                                       value:  '378',
                                                                       Subfield:  '',
                                                                       Subvalue:  '',
                                                                       Count: Utils.product_count,
                                                                       Sunatrribute_code: '',
                                                                       pageSize: '',
                                                                       condition_type: 'finset',
                                                                       SubCondition_type: ' ', filterdata: [],

                                                                     ),
                                                                   )));
                                                         };
                                                         break;

                                                       case "READY TO SHIP":
                                                         {
                                                           Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                   builder: (context) =>  MultiBlocProvider(

                                                                     providers: [
                                                                       BlocProvider(
                                                                         create: (context) => ShopBloc(),),
                                                                       BlocProvider(
                                                                         create: (context) => ProductBloc(),) ,

                                                                     ],
                                                                     child: MixCategoryLandigPage(
                                                                       heding: title,
                                                                       Subattribute_Id: '20',
                                                                       field: 'tts',
                                                                       value:  '249',
                                                                       Subfield: '',
                                                                       Subvalue: '',
                                                                       Count: Utils.product_count,
                                                                       Sunatrribute_code: '',
                                                                       pageSize: '',
                                                                       condition_type: 'finset',
                                                                       SubCondition_type: '', filterdata: [],

                                                                     ),
                                                                   )));
                                                         };
                                                         break;

                                                       default:
                                                         {

                                                           if(urlkey.toString().contains('/')) {
                                                             url = urlkey?.split('/') ?? [];
                                                           } else {
                                                             url.add(urlkey);
                                                           }

                                                           // url = urlkey.split('/');
                                                           developer.log("urllist>>>>${url}");
                                                           for (var ds in Utils.UrlKeyData) {

                                                             if (url[0] == ds["url_key"]) {
                                                               kcategory_id = ds["entity_id"];
                                                             }
                                                             if (url[1] == ds["url_key"]) {
                                                               Subfield = ds["attribute_code"];
                                                               Subvalue = ds["entity_id"];


                                                             }
                                                           }
                                                           developer.log("Utils.category_id>>>>${kcategory_id}");
                                                           developer.log("Subfield2>>>>${Subfield}");
                                                           developer.log("Subvalue2>>>>${Subvalue}");
                                                           Navigator.push(
                                                               context,
                                                               MaterialPageRoute(
                                                                   builder: (context) =>  MultiBlocProvider(

                                                                     providers: [
                                                                       BlocProvider(
                                                                         create: (context) => ShopBloc(),),
                                                                       BlocProvider(
                                                                         create: (context) => ProductBloc(),) ,

                                                                     ],
                                                                     child: MixCategoryLandigPage(
                                                                       heding: title,
                                                                       Subattribute_Id: '20',
                                                                       field: 'category_id',
                                                                       value:  kcategory_id,
                                                                       Subfield: Subfield,
                                                                       Subvalue: Subvalue,
                                                                       Count: Utils.product_count,
                                                                       Sunatrribute_code: '',
                                                                       pageSize: '',
                                                                       condition_type: 'eq',
                                                                       SubCondition_type: 'finset', filterdata: [],

                                                                     ),
                                                                   )));
                                                         };
                                                         break;

                                                     }


                                                    },
                                                  ),
                                                );
                                              },

                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: jsonData["Carouselbanner"]["items"].length,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: height * 0.135,
                          width: width-50,
                          child: Image.network(
                            jsonData["Offerbanner"]["img_url"],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),

                    ///SHOP BY ROLE
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        child: NWidgets.kheadinghome(context, "SHOP BY ROLE"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    SizedBox(
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
                        // itemCount: _brideInfoMap['bride'].length,
                        itemCount: jsonData["ShopByRole"]["items"].length,
                        itemBuilder: (context, index) {
                          _brideInfoMap['bride'][index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                            /*  onTap: () {
                                var img = mapdata['data'][index]['img'];
                                var name = mapdata['data'][index]['name'];
                                var imglist =
                                    _brideInfoMap['bride'][index]['img'];
                                var bnrimg = mapdata['data'][index]['bnrimg'];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ConceptPage(
                                              img: imglist,
                                              bnrimg: bnrimg,
                                              name: '$name',
                                              imglist: const [],
                                            )));
                              },*/
                              onTap: () {
                                var url_key  = jsonData["ShopByRole"]["items"][index]["url_key"];
                                var title  = jsonData["ShopByRole"]["items"][index]["name"];
                                var Subfield ;
                                var Subvalue;
                                var kcategory_id;
                                List url = [];
                                developer.log('url_key>>>$url_key');

                                var urlkey = jsonData["ShopByRole"]["items"][index]["url_key"];
                                developer.log("urlkey>>>>${urlkey}");

                                if(urlkey.toString().contains('/')) {
                                  url = urlkey?.split('/') ?? [];
                                } else {
                                  url.add(urlkey);
                                }

                                // url = urlkey.split('/');
                                developer.log("urllist>>>>${url}");
                                for (var ds in Utils.UrlKeyData) {

                                  if (url[0] == ds["url_key"]) {
                                    kcategory_id = ds["entity_id"] ??'';
                                  }
                                  if (url[1] == ds["url_key"]) {
                                    Subfield = ds["attribute_code"] ??'';
                                    Subvalue = ds["entity_id"] ??'';


                                  }
                                }
                                developer.log("Utils.category_id>>>>${kcategory_id}");
                                developer.log("Subfield2>>>>${Subfield??''}");
                                developer.log("Subvalue2>>>>${Subvalue??''}");



                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  MultiBlocProvider(

                                          providers: [
                                            BlocProvider(
                                              create: (context) => ShopBloc(),),
                                            BlocProvider(
                                              create: (context) => ProductBloc(),) ,
                                            BlocProvider(
                                              create: (context) => ShopBloc(),) ,
                                          ],
                                          child: MixCategoryLandigPage(
                                            heding: title,

                                            Subattribute_Id: '20',

                                            field: 'category_id',
                                            value:  Subvalue??'',
                                            // value:  '547',
                                            Subfield:  '',
                                            Subvalue:  '',
                                            Count: Utils.product_count,
                                            Sunatrribute_code: '',
                                            pageSize: '',
                                            condition_type: 'eq',
                                            SubCondition_type: '', filterdata: [],

                                          ),
                                        )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(jsonData["ShopByRole"]
                                          ["items"][index]['img']),
                                      fit: BoxFit.fill,
                                    )),
                                alignment: Alignment.bottomCenter,

                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),

                    ///READY-TO-SHIP COLLECTION
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        child: NWidgets.kheadinghome(
                            context, "${jsonData["Banner"]["title"]}"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NavBarBottom(selectedIndex: 0),
                              ));
                        },
                        child: Container(
                            width: width,
                            height: height / 2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${jsonData["Banner"]["banner"]["img_url"]}'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.010,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        color: Colors.grey,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: ScrollController(keepScrollOffset: true),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: List.generate(4, (index) {
                            switch (index) {
                              case 0:
                                return InkWell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'images/girdIcon/giftg.png',
                                          height: height * 0.050,
                                          width: height * 0.050,
                                        ),
                                        SizedBox(height: height * 0.010),
                                        const Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text.rich(
                                          TextSpan(
                                            text: '',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Get ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.w400,
                                                  // decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'INR500',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' off*',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
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
                                                const CreateAccount()));
                                  },
                                );

                              case 1:
                                return InkWell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'images/girdIcon/flowg.png',
                                          height: height * 0.050,
                                          width: height * 0.050,
                                        ),
                                        SizedBox(height: height * 0.010),
                                        const Text('JUST ARRIVED',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text('Stylish Trends',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListingLandingPage(
                                                  imglist: const [],
                                                  name: 'Arrived This Week',
                                                  more: '',
                                                )));
                                  },
                                );

                              case 2:
                                return InkWell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'images/girdIcon/birdg.png',
                                          height: height * 0.050,
                                          width: height * 0.050,
                                        ),
                                        SizedBox(height: height * 0.010),
                                        const Text('READY TO SHIP',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text('Save your Time',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ReadyToShip()));
                                  },
                                );

                              case 3:
                                return InkWell(
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'images/girdIcon/star.png',
                                          height: height * 0.050,
                                          width: height * 0.050,
                                        ),
                                        SizedBox(height: height * 0.010),
                                        const Text('BESTSELLERS',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text('The Global Favs',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>

                                          MixCategoryLandigPage(
                                          heding:
                                          "This Week's Best Sellers",

                                          Subattribute_Id:
                                          '',

                                          field: '',
                                          value: '',
                                          Count: 1,
                                          Sunatrribute_code: '',
                                          pageSize: '',
                                          condition_type:
                                          '',
                                          SubCondition_type:
                                          '',
                                          Subfield: '',
                                          Subvalue: '', filterdata: [],
                                        )

                                        ));
                                  },
                                );

                              default:
                                return Container();
                            }
                          }),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.010,
                    ),

                    SizedBox(
                      height: height * 0.020,
                    ),

                    ///TRENDING THIS WEEK
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        child: NWidgets.kheadinghome(
                            context, "${Utils.trendingMap_tital}"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    SizedBox(
                      // color: Colors.cyan,
                      height: 350,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: Utils.trendingMap!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: () {
                              // var img =  items[index].images[0].url;
                              // var id =  items[index].id;
                              // var repImag =     Utils.imageConverter(img);
                              // var producturl =  items[index].url;
                              // var productdata= Utils.Urlparser(producturl);
                              // developer.log("productindx>>$productdata");
                              // developer.log("idid>>$id");
                              //
                              //
                              //
                              // var arr = img.split('/');
                              // var ind = arr.indexOf("small_image");
                              // arr[ind] = "image";
                              // arr[ind + 1] = "1000x";
                              // var urlKey = arr[ind + 2];
                              //
                              // developer.log("arrindexurl>>>${arr[ind+2]}");
                              // var urlrImag ;
                              // var urlImg = arr.toString().replaceAll(",", "/");
                              // urlImg = urlImg.replaceAll(" ", "");
                              // urlImg = urlImg.replaceAll("[", "");
                              // urlImg = urlImg.replaceAll("]", "");
                              // developer.log("urlrImag>>$urlImg");
                              // var splitValue = urlImg.split(urlKey);
                              // Utils.ProductImgUrl = splitValue[0];
                              // Utils.ImgUrlKey = urlKey;
                              // developer.log("Utils.ProductImgUrl>>${Utils.ProductImgUrl}");
                              // developer.log("Utils.ImgUrlKey>>${Utils.ImgUrlKey}");
                              // developer.log("Utils.ImgUrl>>${Utils.ProductImgUrl+Utils.ImgUrlKey}");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>   BlocProvider(
                              //           create: (context) => ProductBloc(),
                              //           child: ProductsDetails(
                              //             img: repImag,
                              //             subImgUrl: '${Utils.ProductImgUrl+Utils.ImgUrlKey}',
                              //             label:  items[index].images[0].label.toString(),
                              //             regPrice: items[index].priceInfo.regularPrice.toString(),
                              //             minPrice: items[index].priceInfo.minimalPrice.toString(),
                              //             productId: productdata,
                              //           ),
                              //         )));
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
                                                Utils.trendingMap![index].imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Utils.trendingMap![index].name,
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
                                                        text: '${Utils.currencySymbol}${Utils.trendingMap![index].listPrice.toStringAsFixed(2)}',
                                                        style: FTextStyle
                                                            .prizeStyle5,
                                                      ),
                                                      TextSpan(
                                                        text: '  ${Utils.currencySymbol}${Utils.trendingMap![index].price.toStringAsFixed(2)}',
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

                    /// FASHION STORIES
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Container(
                        child:
                            NWidgets.kheadinghome(context,jsonData["FashionStory"]["title"] /*"FASHION STORIES"*/),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),


                    SizedBox(

                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: ScrollController(keepScrollOffset: true),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 0.80,
                        ),

                        itemCount: jsonData["FashionStory"]["items"].length,
                        itemBuilder: (context, index) {

                          jsonData["FashionStory"]["items"][index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                var urlkey = jsonData["FashionStory"]["items"][index]["url_key"];
                                var title  = jsonData["FashionStory"]["items"][index]["name"];
                                var Subfield ;
                                var Subvalue;
                                var kcategory_id;
                                List url = [];



                                developer.log("urlkey>>>>${urlkey}");

                                if(urlkey.toString().contains('/')) {
                                  url = urlkey?.split('/') ?? [];
                                } else {
                                  url.add(urlkey);
                                }

                                // url = urlkey.split('/');
                                developer.log("urllist>>>>${url}");
                                for (var ds in Utils.UrlKeyData) {

                                  if (url[0] == ds["url_key"]) {
                                    kcategory_id = ds["entity_id"] ??'';
                                  }
                                  if (url[1] == ds["url_key"]) {
                                    Subfield = ds["attribute_code"] ??'';
                                    Subvalue = ds["entity_id"] ??'';


                                  }
                                }
                                developer.log("Utils.category_id>>>>${kcategory_id}");
                                developer.log("Subfield2>>>>${Subfield??''}");
                                developer.log("Subvalue2>>>>${Subvalue??''}");



                               /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  MultiBlocProvider(

                                          providers: [
                                            BlocProvider(
                                              create: (context) => ShopBloc(),)
                                          ],
                                          child: MixCategoryLandigPage(
                                            heding: title,
                                            storeId: '2',
                                            currencyCode: 'INR',
                                            CriteriapageSize: '20',
                                            conditionType: 'eq',
                                            field: 'category_id',
                                            value:  kcategory_id,
                                            Subfield: Subfield??'',
                                            Subvalue: Subvalue??'',
                                            Count: Utils.product_count,
                                            currentPage: '',
                                            pageSize: '',
                                            condition_type: 'eq',
                                            SubCondition_type: 'eq',

                                          ),
                                        )));*/
                              },
                              child: Container(
                                width: width,
                                height: height / 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          jsonData["FashionStory"]["items"][index]['img_url']),
                                      fit: BoxFit.fill,
                                    )),
                                alignment: Alignment.bottomCenter,

                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    ///RECENTLY VIEWED
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Container(
                        child:
                            NWidgets.kheadinghome(context," RECENTLY VIEWED"),
                            // NWidgets.kheadinghome(context," ${Utils.recentlyViewed_tital}"),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),

                    SizedBox(
                      // color: Colors.cyan,
                      height: 350,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: Utils.trendingMap!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ProductsDetails(
                              //               img: img,
                              //               label: '',
                              //               regPrice: '',
                              //               minPrice: '',
                              //               productId: '', subImgUrl: '',
                              //             )));

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
                                                Utils.trendingMap![index].imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  Utils.trendingMap![index].name,
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
                                                        text: '${Utils.currencySymbol}${Utils.trendingMap![index].listPrice.toStringAsFixed(2)}',
                                                        style: FTextStyle
                                                            .prizeStyle5,
                                                      ),
                                                      TextSpan(
                                                        text: '  ${Utils.currencySymbol}${Utils.trendingMap![index].price.toStringAsFixed(2)}',
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

                    ///HIDDEN GEMS
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Container(
                        child: NWidgets.kheadinghome(context, jsonData["HiddenGems"]["title"]),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.010,
                    ),

                    SizedBox(
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
                        // itemCount: _hidengemMap['hidenGem'].length,
                        itemCount: jsonData["HiddenGems"]["items"].length,
                        itemBuilder: (context, index) {
                          // _hidengemMap['hidenGem'][index];
                          jsonData["HiddenGems"]["items"][index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                var urlkey = jsonData["HiddenGems"]["items"][index]["url_key"];
                                var title  = jsonData["HiddenGems"]["items"][index]["name"];
                                var Subfield ;
                                var Subvalue;
                                var kcategory_id;
                                List url = [];



                                developer.log("urlkey>>>>${urlkey}");

                                if(urlkey.toString().contains('/')) {
                                  url = urlkey?.split('/') ?? [];
                                } else {
                                  url.add(urlkey);
                                }

                                // url = urlkey.split('/');
                                developer.log("urllist>>>>${url}");
                                for (var ds in Utils.UrlKeyData) {

                                  if (url[0] == ds["url_key"]) {
                                    kcategory_id = ds["entity_id"] ??'';
                                  }
                                  if (url[1] == ds["url_key"]) {
                                    Subfield = ds["attribute_code"] ??'';
                                    Subvalue = ds["entity_id"] ??'';


                                  }
                                }
                                developer.log("Utils.category_id>>>>${kcategory_id}");
                                developer.log("Subfield2>>>>${Subfield??''}");
                                developer.log("Subvalue2>>>>${Subvalue??''}");



                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  MultiBlocProvider(

                                          providers: [
                                            BlocProvider(
                                              create: (context) => ShopBloc(),)
                                          ],
                                          child: MixCategoryLandigPage(
                                            heding: title,
                                            storeId: '2',
                                            currencyCode: 'INR',
                                            CriteriapageSize: '20',
                                            conditionType: 'eq',
                                            field: 'category_id',
                                            value:  kcategory_id,
                                            Subfield: Subfield??'',
                                            Subvalue: Subvalue??'',
                                            Count: Utils.product_count,
                                            currentPage: '',
                                            pageSize: '',
                                            condition_type: 'eq',
                                            SubCondition_type: 'eq',

                                          ),
                                        )));*/
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(jsonData["HiddenGems"]
                                          ["items"][index]['img']),
                                      fit: BoxFit.fill,
                                    )),
                                alignment: Alignment.bottomCenter,
                                // child: ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     elevation: 0,
                                //     backgroundColor: AppColors.white,
                                //     minimumSize: const Size(100, 20),
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(0),
                                //     ),
                                //   ),
                                //   onPressed: () {},
                                //   child: Text(
                                //     _hidengemMap['hidenGem'][index]['name'],
                                //     style: FTextStyle.khomesubheadingStyle,
                                //   ),
                                // ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
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
                          height: height * 0.040,
                          width: height * 0.040,
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

                    ///#MYFASHIONUTSAV

                    const Text(
                      "#MYFASHIONUTSAV",
                      style: FTextStyle.khomeheadingStyle,
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.025, right: width * 0.025),
                      child: const Text.rich(
                        TextSpan(
                          text:
                              'Show us how you celebrate with utsav and get featured. We are celebrating your love for Indian Fashion Follow us & get a ',
                          style: FTextStyle.khomesubheadingStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: '₹500 Off Coupon.',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColorpink,
                                // decoration: TextDecoration
                                //     .lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' To claim, message us on Instagram!',
                              style: FTextStyle.khomesubheadingStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    SizedBox(
                      height: height / 4,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/bannerImg/insta.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: height * 0.020,
                    ),

                    ///#CUSTOMER REVIEWS
                    const Text(
                      "CUSTOMER REVIEWS",
                      style: FTextStyle.khomeheadingStyle,
                    ),

                    SizedBox(
                      height: height * 0.010,
                    ),
                    SizedBox(
                      height: height / 4,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.010),
                              child: Container(
                                width: width / 1.3,
                                height: height / width / 1.3,
                                color: Colors.grey.shade200,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  star,
                                                  color: Colors.green,
                                                ),
                                                Icon(
                                                  star,
                                                  color: Colors.green,
                                                ),
                                                Icon(
                                                  star,
                                                  color: Colors.green,
                                                ),
                                                Icon(
                                                  star,
                                                  color: Colors.green,
                                                ),
                                                Icon(
                                                  star,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.verified,
                                                  size: 20,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  "Verified",
                                                  style: FTextStyle
                                                      .khomesubheadingStyle,
                                                ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Good Quality",
                                            style: TextStyle(
                                              // color: AppColors.pricecolor,
                                              fontSize: 16,
                                              fontFamily: "SourceSansPro",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                          "Clothing came witin a few Discount ordering and was good quality",
                                          style:
                                              FTextStyle.khomesubheadingStyle),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Woody wood , 2 days ago",
                                              style: FTextStyle
                                                  .khomesubheadingStyle)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.025, right: width * 0.025),
                      child: const Text.rich(
                        TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Rated ',
                                style: FTextStyle.khomesubheadingStyle),
                            TextSpan(
                              text: '4.4 ',
                              style: TextStyle(
                                // color: AppColors.pricecolor,
                                fontSize: 16,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text: ' out of 5 based on ',
                                style: FTextStyle.khomesubheadingStyle),
                            TextSpan(
                              text: '2319 reviews',
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: AppColors.Textcolorheadingblack,
                                      offset: Offset(0, -2))
                                ],
                                decoration: TextDecoration.underline,
                                fontFamily: 'SourceSansPro',
                                color: Colors.transparent,
                                fontWeight: FontWeight.w600,
                                decorationColor:
                                    AppColors.Textcolorheadingblack,
                                decorationThickness: 1.5,
                                fontSize: 17,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                            TextSpan(
                              text: ' Showing Our 4 & 5 stars Review',
                              style: FTextStyle.khomesubheadingStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          star,
                          color: Colors.green,
                        ),
                        Text(
                          "Trustpilot",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: height * 0.020,
                    ),
                  ],
                ),
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white10,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          controller: _pageController,
                          // itemCount: _ListviewMap['list'].length,
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // final category = json["CategoryList"]["list"][index];
                            return GestureDetector(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors
                                          .primaryColorpink
                                          .withOpacity(0.10),
                                      radius: 30,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('category',
                                        style: FTextStyle.khomesubheadingStyle),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Column(
                        children: [
                          Stack(
                            children: [
                              CarouselSlider.builder(
                                itemCount: 4,
                                options: CarouselOptions(
                                    height: height / 2.5,
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
                                        Container(
                                          height: height * 0.400,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'images/carouselImage/car2.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 0.0,
                                          left: 0,
                                          // top: 0,
                                          child: Align(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    height: height * 0.040,
                                                    width: 100,
                                                    child: const Center(
                                                      child: Text('NEW',
                                                          style: FTextStyle
                                                              .khomesubheadingStyle),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MixCategoryLandigPage(
                                                                  heding: "End of Season Sale",

                                                                  Subattribute_Id:
                                                                  '',

                                                                  field: '',
                                                                  value: '',
                                                                  Count: 1,
                                                                  Sunatrribute_code: '',
                                                                  pageSize: '',
                                                                  condition_type:
                                                                  '',
                                                                  SubCondition_type:
                                                                  '',
                                                                  Subfield: '',
                                                                  Subvalue: '', filterdata: [],
                                                                )

                                                    ));
                                                  },
                                                ),
                                                const SizedBox(width: 5),
                                                InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    height: height * 0.040,
                                                    width: 100,
                                                    child: const Center(
                                                      child: Text(
                                                          'BEST SELLERS',
                                                          style: FTextStyle
                                                              .khomesubheadingStyle),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                MixCategoryLandigPage(
                                                                  heding: "End of Season Sale",

                                                                  Subattribute_Id:
                                                                  '',

                                                                  field: '',
                                                                  value: '',
                                                                  Count: 1,
                                                                  Sunatrribute_code: '',
                                                                  pageSize: '',
                                                                  condition_type:
                                                                  '',
                                                                  SubCondition_type:
                                                                  '',
                                                                  Subfield: '',
                                                                  Subvalue: '', filterdata: [],
                                                                )
                                                        ));
                                                  },
                                                ),
                                                const SizedBox(width: 5),
                                                InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                    ),
                                                    height: height * 0.040,
                                                    width: 100,
                                                    child: const Center(
                                                      child: Text(
                                                          'READY TO SHIP',
                                                          style: FTextStyle
                                                              .khomesubheadingStyle),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ReadyToShip()));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: AnimatedSmoothIndicator(
                                activeIndex: activeIndex,
                                count: 4,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: height * 0.040,
                          width: 310,
                          child: Image.asset(
                            'images/bannerImg/ban1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      ///SHOP BY ROLE
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          child: NWidgets.kheadinghome(context, "SHOP BY ROLE"),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      SizedBox(
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
                          itemCount: _brideInfoMap['bride'].length,
                          itemBuilder: (context, index) {
                            _brideInfoMap['bride'][index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  var img = mapdata['data'][index]['img'];
                                  var name = mapdata['data'][index]['name'];
                                  var imglist =
                                      _brideInfoMap['bride'][index]['img'];
                                  var bnrimg = mapdata['data'][index]['bnrimg'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ConceptPage(
                                                img: imglist,
                                                bnrimg: bnrimg,
                                                name: '$name',
                                                imglist: const [],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            _brideInfoMap['bride'][index]
                                                ['img']),
                                        fit: BoxFit.fill,
                                      )),
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: AppColors.white,
                                      minimumSize: const Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    onPressed: () {
                                      var img = mapdata['data'][index]['img'];
                                      var name = mapdata['data'][index]['name'];
                                      var imglist =
                                          _brideInfoMap['bride'][index]['img'];
                                      var bnrimg =
                                          mapdata['data'][index]['bnrimg'];

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ConceptPage(
                                                    img: imglist,
                                                    bnrimg: bnrimg,
                                                    name: '$name',
                                                    imglist: const [],
                                                  )));
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                          _brideInfoMap['bride'][index]['name'],
                                          style:
                                              FTextStyle.khomesubheadingStyle),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      ///READY-TO-SHIP COLLECTION
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          child: NWidgets.kheadinghome(
                              context, "READY-TO-SHIP COLLECTION"),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Stack(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NavBarBottom(selectedIndex: 0),
                                ));
                          },
                          child: Container(
                              width: width,
                              height: height / 2,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'images/bannerImg/rom.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                        ),
                      ]),

                      SizedBox(
                        height: height * 0.010,
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          color: Colors.grey,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 1.0,
                            physics: const NeverScrollableScrollPhysics(),
                            controller:
                                ScrollController(keepScrollOffset: true),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: List.generate(4, (index) {
                              switch (index) {
                                case 0:
                                  return InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/girdIcon/giftg.png',
                                            height: height * 0.050,
                                            width: height * 0.050,
                                          ),
                                          SizedBox(height: height * 0.010),
                                          const Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text.rich(
                                            TextSpan(
                                              text: '',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Get ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "SourceSansPro",
                                                    fontWeight: FontWeight.w400,
                                                    // decoration: TextDecoration.lineThrough,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'INR500',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "SourceSansPro",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' off*',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "SourceSansPro",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
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
                                                  const CreateAccount()));
                                    },
                                  );

                                case 1:
                                  return InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/girdIcon/flowg.png',
                                            height: height * 0.050,
                                            width: height * 0.050,
                                          ),
                                          SizedBox(height: height * 0.010),
                                          const Text('JUST ARRIVED',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('Stylish Trends',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListingLandingPage(
                                                    imglist: const [],
                                                    name: 'Arrived This Week',
                                                    more: '',
                                                  )));
                                    },
                                  );

                                case 2:
                                  return InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/girdIcon/birdg.png',
                                            height: height * 0.050,
                                            width: height * 0.050,
                                          ),
                                          SizedBox(height: height * 0.010),
                                          const Text('READY TO SHIP',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('Save your Time',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ReadyToShip()));
                                    },
                                  );

                                case 3:
                                  return InkWell(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/girdIcon/star.png',
                                            height: height * 0.050,
                                            width: height * 0.050,
                                          ),
                                          SizedBox(height: height * 0.010),
                                          const Text('BESTSELLERS',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('The Global Favs',
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MixCategoryLandigPage(
                                                    heding: "End of Season Sale",

                                                    Subattribute_Id:
                                                    '',

                                                    field: '',
                                                    value: '',
                                                    Count: 1,
                                                    Sunatrribute_code: '',
                                                    pageSize: '',
                                                    condition_type:
                                                    '',
                                                    SubCondition_type:
                                                    '',
                                                    Subfield: '',
                                                    Subvalue: '', filterdata: [],
                                                  )
                                          ));
                                    },
                                  );

                                default:
                                  return Container();
                              }
                            }),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: height * 0.010,
                      ),

                      SizedBox(
                        height: height * 0.020,
                      ),


                      SizedBox(
                        height: height * 0.020,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: AppColors.primaryColorblue),
          height: height * 0.035,
          width: 75,
          child: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()));
            },
            label: const Text('Help'),
            icon: Image.asset(
              'images/flotbuttonicon.png',
              height: height * 0.020,
              width: height * 0.020,
            ),
            backgroundColor: AppColors.primaryColorblue,
          ),
        ),
      ),
    );
  }
}
