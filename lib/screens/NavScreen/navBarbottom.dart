import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/Model/CategoriesModel.dart';
import 'package:utsav/screens/Account/account.dart';
import 'package:utsav/screens/Account/accountDashboard.dart';
import 'package:utsav/screens/CMS/ConceptLandingPagesec.dart';
import 'package:utsav/screens/CMS/ConceptPage.dart';
import 'package:utsav/screens/CMS/ListingLandingPage.dart';
import 'package:utsav/screens/CMS/PersonalisedStore.dart';
import 'package:utsav/screens/CMS/readyToShip.dart';
import 'package:utsav/screens/CMS/whatsnow.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreAccount.dart';
import 'package:utsav/screens/Home/HomeBloc/home_bloc.dart';
import 'package:utsav/screens/Home/MyPersonalStore.dart';
import 'package:utsav/screens/Home/Plusesize.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'package:utsav/screens/Home/TLove.dart';
import 'package:utsav/screens/Home/WeddingShop.dart';
import 'package:utsav/screens/Home/WedingShop.dart';
import 'package:utsav/screens/Home/homeScreen.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/MyNotification/MyNotificationExplore.dart';
import 'package:utsav/screens/Order/myorder.dart';
import 'package:utsav/screens/ShopPage/ShopBloc/shop_bloc.dart';
import 'package:utsav/screens/ShoppingBag/ShoppingBloc/shopping_bloc.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/screens/WhishList/wishListHome.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';
import '../../utils/utils.dart';
import '../Home/FashionStory.dart';
import '../Home/Trends.dart';
import '../Home/sessionScreen.dart';
import '../Home/whatsnow.dart';
import '../ShopPage/MixCategoryLandingPage.dart';
import 'dart:developer' as developer;

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({Key? key, required int selectedIndex}) : super(key: key);

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  bool isExpanded = false;
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: MixCategoryLandigPage(
        heding: "Shop",
        Subattribute_Id: '20',
        field: 'category_id',
        value: Utils.category_id,
        Count: Utils.product_count,
        Sunatrribute_code: '',
        pageSize: '',
        condition_type: 'eq',
        SubCondition_type: 'finset',
        Subfield: 'occasion',
        Subvalue: '201',
        filterdata: [],
      ),
    ),
    WishListHome(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        key: scaffoldKey,
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
                scaffoldKey.currentState?.openDrawer();
              },
            );
          }),
          title: InkWell(
            onTap: () {},
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
        drawer: const FirstDrawer(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: SizedBox(
            // height: height*0.10,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              // iconSize: 25,
              onTap: _onItemTapped,
              elevation: 0,
              selectedItemColor: AppColors.primaryColorpink,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 14),
              // fixedColor: Colors.red,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/navBarIcon/home.png',
                    scale: 1.5,
                    width: width * 0.060,
                    // height: 20,
                    color: _selectedIndex == 0
                        ? AppColors.primaryColorpink
                        : Colors.grey,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/navBarIcon/navShop.png',
                    scale: 1.5,
                    width: width * 0.060,
                    // height: 20,
                    color: _selectedIndex == 1
                        ? AppColors.primaryColorpink
                        : Colors.grey,
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/navBarIcon/navWishlist.png',
                    scale: 1.5,
                    width: width * 0.060,
                    // height: 20,
                    color: _selectedIndex == 2
                        ? AppColors.primaryColorpink
                        : Colors.grey,
                  ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/navBarIcon/navAccount.png',
                    scale: 1.7,
                    width: width * 0.060,
                    // height: 20,
                    color: _selectedIndex == 3
                        ? AppColors.primaryColorpink
                        : Colors.grey,
                  ),
                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _notificationBadge() {
  //   return Badge(
  //     position: BadgePosition.topEnd(top: 0, end: 3),
  //     animationDuration: const Duration(milliseconds: 300),
  //     animationType: BadgeAnimationType.slide,
  //     badgeContent: Text(
  //       _counter.toString(),
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     child: IconButton(
  //         icon: const Icon(Icons.notifications_active_outlined),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             PageTransition(
  //                 child: const NotificationScreen(),
  //                 type: PageTransitionType.fade,
  //                 duration: const Duration(milliseconds: 900),
  //                 reverseDuration: (const Duration(milliseconds: 900))),
  //           );
  //         }),
  //   );
  // }
}

class FirstDrawer extends StatefulWidget {
  const FirstDrawer({Key? key}) : super(key: key);

  @override
  State<FirstDrawer> createState() => _FirstDrawerState();
}

class _FirstDrawerState extends State<FirstDrawer> {
  bool isExpanded = false;

  var category_id;

  function() {
    setState(() {});
  }

  var boxheight = 0;
  String foos = 'One';
  var _key;

  _collapse() {
    var newKey;
    do {
      _key = Random().nextInt(10000);
    } while (newKey == _key);
  }

  @override
  void initState() {
    super.initState();
    _collapse();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColorpink.withOpacity(0.10),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 50.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  (Utils.checkLogin == true)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Umair Siddiqui",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "de-umair@mobiloitte.com",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.textgreyordersummaary,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Guest User",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  'images/ccrossIcon.png',
                  scale: 4,
                  width: 60,
                  color: AppColors.primaryColorpink,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            automaticallyImplyLeading: false, // hide hamburger icon
          ),
          drawer: const SecondDrawer(),
          body: Builder(builder: (context) {
            return ListView(
              children: [
                SizedBox(
                  // height: 47.0 * Utils.menu.length,
                  height: 48.0 * Utils.sidemenu.length - 1,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Utils.sidemenu.length - 1,
                    // itemCount: Utils.menu.length,
                    itemBuilder: (context, index) {
                      // boxheight = Utils.menu[index]['Menu'].length;
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            // color: Colors.cyan,
                            // height: 42,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 15.0),
                              dense: true,
                              onTap: () {
                                Utils.indexname =
                                    Utils.sidemenu[index].categoryName;
                                developer.log(
                                    'id>>>${Utils.sidemenu[index].categoryName}');

                                Utils.subCategory.clear();
                                Utils.subCategory
                                    .addAll(Utils.sidemenu[index].subCategory);
                                for (int j = 0;
                                    j < Utils.UrlKeyData.length;
                                    j++) {
                                  if (Utils.sidemenu[index].categoryName ==
                                      'Salwar Kameez') {
                                    setState(() {
                                      category_id = 'salwar';
                                    });
                                  } else if (Utils
                                          .sidemenu[index].categoryName ==
                                      'Plus') {
                                    setState(() {
                                      category_id = 'plus-size';
                                    });
                                  } else {
                                    setState(() {
                                      category_id =
                                          Utils.sidemenu[index].categoryName;
                                    });
                                  }

                                  if (category_id.toLowerCase() ==
                                      Utils.UrlKeyData[j]["url_key"]
                                          .toLowerCase()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                      create: (context) =>
                                                          ShopBloc(),
                                                    ),
                                                    BlocProvider(
                                                      create: (context) =>
                                                          ProductBloc(),
                                                    )
                                                  ],
                                                  child: MixCategoryLandigPage(
                                                    heding: Utils.indexname,

                                                    Subattribute_Id: '20',

                                                    field: 'category_id',
                                                    // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                                    value: Utils.UrlKeyData[j]
                                                        ["entity_id"],
                                                    Subfield: '',
                                                    Subvalue: '',
                                                    Count: Utils.product_count,
                                                    Sunatrribute_code: '',
                                                    pageSize: '',
                                                    condition_type: 'eq',
                                                    SubCondition_type: '',
                                                    filterdata: [],
                                                  ),
                                                )));
                                  }
                                }
                              },
                              title: Text(
                                Utils.sidemenu[index].categoryName,
                                textAlign: TextAlign.start,
                                style: FTextStyle.SidemenuTextStyle,
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Utils.indexname =
                                      Utils.sidemenu[index].categoryName;

                                  Utils.subCategory.clear();
                                  Utils.subCategory.addAll(
                                      Utils.sidemenu[index].subCategory);

                                  Scaffold.of(context).openDrawer();
                                },
                                child: SizedBox(
                                  width: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      SizedBox(
                                          height: 25,
                                          child: VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 0.5,
                                          )),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.cyan,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 5,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15, 10, 15),
                      child: Column(
                        children: [
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Account",
                                style: FTextStyle.drwerStyle500,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountDashBoard()));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Order",
                                style: FTextStyle.drwerStyle500,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Myorder()));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Explore More",
                                style: FTextStyle.drwerStyle500,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExploreMoreAccount()));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Notifications",
                                style: FTextStyle.drwerStyle500,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyNotificationExplore()));
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 5,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 5, 10, 5),
                      child: SizedBox(
                        // height: 47.0 * Utils.menu.length,
                        height: 30.0 * Utils.discover[0].subCategory.length,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: Utils.discover[0].subCategory.length,
                          itemBuilder: (context, ind) {
                            Utils.discover[0].subCategory;

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 5, 10, 5),
                              child: InkWell(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    Utils.discover[0].subCategory[ind]
                                        .subCategoryName,
                                    style: const TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                onTap: () {
                                  developer.log(
                                      "${Utils.discover[0].subCategory[ind].subCategoryData}");
                                  developer.log(
                                      "${Utils.discover[0].subCategory[ind].id}");
                                  developer.log(
                                      "${Utils.discover[0].subCategory[ind].subCategoryName}");
                                  var cmspage =
                                      "${Utils.discover[0].subCategory[ind].subCategoryName}";
                                  switch (cmspage) {
                                    case "What's Now":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WhatsNowScreen(
                                                      // imglist: const [],
                                                      // more: '',
                                                      mapdata: Utils.whatsnow,
                                                    )));
                                      }
                                      break;
                                    case "Arrived this Week":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                      providers: [
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ShopBloc(),
                                                        ),
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ProductBloc(),
                                                        ),
                                                      ],
                                                      child:
                                                          MixCategoryLandigPage(
                                                        heding:
                                                            'Arrived this Week',
                                                        Subattribute_Id: '20',
                                                        field: 'news_from_date',
                                                        value:
                                                            '2023-01-03 00:00:00',
                                                        // value:  '499',
                                                        Subfield:
                                                            'news_to_date',
                                                        Subvalue:
                                                            '2023-01-03 00:00:00',
                                                        Count:
                                                            Utils.product_count,
                                                        Sunatrribute_code: '',
                                                        pageSize: '',
                                                        condition_type: 'gt',
                                                        SubCondition_type: 'gt',
                                                        filterdata: [],
                                                      ),
                                                    )));
                                      }
                                      break;

                                    case "Sale":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                      providers: [
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ShopBloc(),
                                                        ),
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ProductBloc(),
                                                        ),
                                                      ],
                                                      child:
                                                          MixCategoryLandigPage(
                                                        heding: 'Sale',
                                                        Subattribute_Id: '20',
                                                        field: 'discount',
                                                        value:
                                                            '[494,495,496,497,498,499,500,501]',
                                                        // value:  '499',
                                                        Subfield: '',
                                                        Subvalue: '',
                                                        Count:
                                                            Utils.product_count,
                                                        Sunatrribute_code: '',
                                                        pageSize: '',
                                                        condition_type: 'in',
                                                        SubCondition_type: 'in',
                                                        filterdata: [],
                                                      ),
                                                    )));
                                      }
                                      break;
                                    case "Ready to Ship":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WeddingPage(
                                                      // imglist: const [],
                                                      // name: Utils.discover[0].subCategory[ind].subCategoryName,
                                                      // more: '',
                                                      mapdata:
                                                          Utils.readytoshipcms,
                                                    )));
                                      }
                                      break;
                                    case "Weekly Bestsellers":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                      providers: [
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ShopBloc(),
                                                        ),
                                                        BlocProvider(
                                                          create: (context) =>
                                                              ProductBloc(),
                                                        ),
                                                      ],
                                                      child:
                                                          MixCategoryLandigPage(
                                                        heding:
                                                            'Weekly Bestsellers',
                                                        Subattribute_Id: '20',
                                                        field: 'feature',
                                                        value: '378',
                                                        Subfield: '',
                                                        Subvalue: '',
                                                        Count:
                                                            Utils.product_count,
                                                        Sunatrribute_code: '',
                                                        pageSize: '',
                                                        condition_type:
                                                            'finset',
                                                        SubCondition_type: ' ',
                                                        filterdata: [],
                                                      ),
                                                    )));
                                      }
                                      break;
                                    case "Fashion Stories":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FashionStory(
                                                      mapdata:
                                                          Utils.fashionstory,
                                                    )));
                                      }
                                      break;
                                    case "Trends We Love":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrendsWeLove(
                                                      mapdata:
                                                          Utils.TrendsWeLove,
                                                    )));
                                      }
                                      break;
                                    case "Wedding Shop":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyWeddingShop(
                                                      mapdata:
                                                          Utils.Weddingshop,
                                                    )));
                                      }
                                      break;
                                    case "Winter Trends":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Trends(
                                                      mapdata: Utils.Trends,
                                                    )));
                                      }
                                      break;
                                    case "My Personalized Store":
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyPersonalStore(
                                                      mapdata:
                                                          Utils.MyPersonalStore,
                                                    )));
                                      }
                                      break;

                                    default:
                                      {
                                        print("Invalid choice");
                                      }
                                      break;
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class SecondDrawer extends StatefulWidget {
  const SecondDrawer({Key? key}) : super(key: key);

  @override
  State<SecondDrawer> createState() => _SecondDrawerState();
}

class _SecondDrawerState extends State<SecondDrawer> {
  var isExpend;
  var selected;

  var urlname;
  var weltpixelname, Arrayweltpixelname;

  var Subfield;
  var Subvalue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.white,
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
          backgroundColor: AppColors.primaryColorpink.withOpacity(0.10),

          automaticallyImplyLeading: false, // hide hamburger icon
        ),
        body: ListView(
          children: [
            Container(
              height: 50,
              color: Colors.cyan,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Utils.indexname,
                      style: const TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
            SizedBox(
              // color: Colors.pink,
              height: height - 150,
              // height: height,
              child: ListView.builder(
                key: Key('builder ${selected.toString()}'), //attention
                itemCount: Utils.subCategory.length + 1,
                itemBuilder: (context, idx) {
                  if (idx >= Utils.subCategory.length) {
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.grey.shade300,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Shop Collection:",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                        InkWell(
                          child: const SizedBox(
                            height: 50,
                            // color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "New Arrivals",
                                    style: FTextStyle.SidemenuTextStyle,
                                  )),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => ShopBloc(),
                                      ),
                                      BlocProvider(
                                        create: (context) => ProductBloc(),
                                      ),
                                    ],
                                    child: MixCategoryLandigPage(
                                      heding: "New Arrivals",
                                      Subattribute_Id: '20',
                                      field: 'category_id',
                                      value: Utils.category_id,
                                      Count: Utils.product_count,
                                      Sunatrribute_code: '',
                                      pageSize: '',
                                      condition_type: 'eq',
                                      SubCondition_type: 'eq',
                                      Subfield: '',
                                      Subvalue: '',
                                      filterdata: [],
                                    ),
                                  ),
                                ));
                          },
                        ),
                        const Divider(
                          height: 1,
                        ),
                        InkWell(
                          child: const SizedBox(
                            height: 50,
                            // color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Best Sellers",
                                    style: FTextStyle.SidemenuTextStyle,
                                  )),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => ShopBloc(),
                                      ),
                                      BlocProvider(
                                        create: (context) => ProductBloc(),
                                      ),
                                    ],
                                    child: MixCategoryLandigPage(
                                      heding: "This Week's Best Sellers",
                                      Subattribute_Id: '20',
                                      field: 'category_id',
                                      value: Utils.category_id,
                                      Count: Utils.product_count,
                                      Sunatrribute_code: '',
                                      pageSize: '',
                                      condition_type: 'eq',
                                      SubCondition_type: 'eq',
                                      Subfield: '',
                                      Subvalue: '',
                                      filterdata: [],
                                    ),
                                  ),
                                ));
                          },
                        ),
                        const Divider(
                          height: 1,
                        ),
                        InkWell(
                          child: const SizedBox(
                            height: 50,
                            // color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Ready To Ship",
                                    style: FTextStyle.SidemenuTextStyle,
                                  )),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ReadyToShip()));
                          },
                        ),
                        const Divider(
                          height: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      ListTileTheme(
                        dense: true,
                        child: ExpansionTile(
                            iconColor: Colors.cyan,
                            collapsedIconColor: Colors.cyan,
                            key: Key(idx.toString()),
                            initiallyExpanded: idx == selected,
                            title: Text(
                              Utils.subCategory[idx].subCategoryName,
                              // Utils.submenu[idx]['subname'],
                              style: FTextStyle.SidemenuTextStyle,
                            ),
                            onExpansionChanged: ((newState) {
                              if (newState) {
                                setState(() {
                                  selected = idx;
                                });
                              } else {
                                setState(() {
                                  selected = -1;
                                });
                              }
                            }),
                            children: [
                              SizedBox(
                                height: 52.0 *
                                    Utils.subCategory[idx].subCategoryData
                                        .length,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: Utils
                                      .subCategory[idx].subCategoryData.length,
                                  // Utils.submenu[idx]['submenu'].length,
                                  itemBuilder: (context, ind) {
                                    return Column(
                                      children: [
                                        const Divider(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: ListTileTheme(
                                            dense: true,
                                            child: ListTile(
                                              onTap: () {
                                                Utils
                                                    .subCategory[idx]
                                                    .subCategoryData[ind]
                                                    .customAttributes[0];

                                                for (int i = 0;
                                                    i <
                                                        Utils
                                                            .subCategory[idx]
                                                            .subCategoryData[
                                                                ind]
                                                            .customAttributes
                                                            .length;
                                                    i++) {
                                                  if (Utils
                                                          .subCategory[idx]
                                                          .subCategoryData[ind]
                                                          .customAttributes[i]
                                                          .attributeCode ==
                                                      'url_key') {
                                                    urlname = Utils
                                                        .subCategory[idx]
                                                        .subCategoryData[ind]
                                                        .customAttributes[i]
                                                        .value;
                                                    developer.log(
                                                        "url_Value>>>>${Utils.subCategory[idx].subCategoryData[ind].customAttributes[i].value}");
                                                  }
                                                  if (Utils
                                                          .subCategory[idx]
                                                          .subCategoryData[ind]
                                                          .customAttributes[i]
                                                          .attributeCode ==
                                                      'weltpixel_category_url') {
                                                    weltpixelname = Utils
                                                        .subCategory[idx]
                                                        .subCategoryData[ind]
                                                        .customAttributes[i]
                                                        .value;
                                                    Arrayweltpixelname =
                                                        weltpixelname
                                                            .split('/');
                                                    developer.log(
                                                        "weltpixelname>>>>${Utils.subCategory[idx].subCategoryData[ind].customAttributes[i].value}");
                                                    developer.log(
                                                        "Arrayweltpixelname>>>>${weltpixelname.split('/')}");
                                                    developer.log(
                                                        "Arrayweltpixelname1>>>>${Arrayweltpixelname[0]}");
                                                    developer.log(
                                                        "Arrayweltpixelname2>>>>${Arrayweltpixelname[1]}");
                                                  }
                                                }
                                                for (int j = 0;
                                                    j < Utils.UrlKeyData.length;
                                                    j++) {
                                                  if (Arrayweltpixelname[0] ==
                                                      Utils.UrlKeyData[j]
                                                              ["url_key"]
                                                          .toLowerCase()) {
                                                    var Subfield =
                                                        Utils.UrlKeyData[j]
                                                            ["attribute_code"];
                                                    Utils.category_id =
                                                        Utils.UrlKeyData[j]
                                                            ["entity_id"];
                                                  }
                                                  if (Arrayweltpixelname[1] ==
                                                      Utils.UrlKeyData[j]
                                                          ["url_key"]) {
                                                    Subfield =
                                                        Utils.UrlKeyData[j]
                                                            ["attribute_code"];
                                                    Subvalue =
                                                        Utils.UrlKeyData[j]
                                                            ["entity_id"];

                                                    developer.log(
                                                        "Utils.category_id>>>>${Utils.category_id}");
                                                    developer.log(
                                                        "2_Subfield2>>>>${Subfield}");
                                                    developer.log(
                                                        "2_Subvalue2>>>>${Subvalue}");
                                                  }
                                                }

                                                String str = weltpixelname;
                                                List<String> arr =
                                                    str.split("/");
                                                print(
                                                    arr); // Output: [saree, wedding]

                                                var childrenId = Utils
                                                    .subCategory[idx]
                                                    .subCategoryData[ind]
                                                    .id;
                                                print(
                                                    "Utils.position>>>${Utils.category_id}");
                                                print(
                                                    "childrenId>>>${childrenId}");

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MultiBlocProvider(
                                                              providers: [
                                                                BlocProvider(
                                                                  create: (context) =>
                                                                      ShopBloc(),
                                                                ),
                                                                BlocProvider(
                                                                  create: (context) =>
                                                                      ProductBloc(),
                                                                )
                                                              ],
                                                              child:
                                                                  MixCategoryLandigPage(
                                                                heding: Utils
                                                                    .subCategory[
                                                                        idx]
                                                                    .subCategoryData[
                                                                        ind]
                                                                    .subClidName,

                                                                Subattribute_Id:
                                                                    '20',

                                                                field:
                                                                    'category_id',
                                                                // value: childrenId==0?Utils.category_id:childrenId.toString(),
                                                                value: Utils
                                                                    .category_id,
                                                                Subfield:
                                                                    Subfield,
                                                                Subvalue:
                                                                    Subvalue,
                                                                Count: Utils
                                                                    .product_count,
                                                                Sunatrribute_code:
                                                                    '',
                                                                pageSize: '',
                                                                condition_type:
                                                                    'eq',
                                                                SubCondition_type:
                                                                    'eq',
                                                                filterdata: [],
                                                              ),
                                                            )));
                                              },
                                              title: Text(
                                                Utils
                                                    .subCategory[idx]
                                                    .subCategoryData[ind]
                                                    .subClidName,
                                                // Utils.submenu[idx]['submenu'][ind]['name'],
                                                style: const TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ]),
                      ),
                      const Divider(
                        // color: Colors.grey,
                        height: 0.5,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
