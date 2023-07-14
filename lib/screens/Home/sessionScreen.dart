// import 'package:bottom_drawer/bottom_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:utsav/screens/Home/Wishlist_withOutLogin/soldoutprdwithoutlogin.dart';
// import 'package:utsav/screens/Home/Wishlist_withlogin/soldoutprdwithlogin.dart';
// import 'package:utsav/screens/Home/searchScreen.dart';
// import 'package:utsav/screens/NavScreen/navBarbottom.dart';
// import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
// import 'package:utsav/utils/app_colors.dart';
// import 'package:utsav/utils/utils.dart';
//
// import '../../utils/widgets.dart';
// import '../Filter/filterList.dart';
//
//
// class SeasonScreen extends StatefulWidget {
//   String heding;
//   Map<String, dynamic> mapdata;
//   SeasonScreen({Key? key, required this.heding, required this.mapdata})
//       : super(key: key);
//
//   @override
//   State<SeasonScreen> createState() => _SeasonScreenState();
// }
//
// class _SeasonScreenState extends State<SeasonScreen> {
//   List<String> images = [
//     "images/gridImg/bride.png",
//     "images/gridImg/bridemom.png",
//     "images/gridImg/bridemates.png",
//     "images/gridImg/groom.png"
//   ];
//   static const items = [
//     'Must have',
//     "Month's Best Look",
//     'Top Rated Styles',
//   ];
//
//   Map<String, dynamic> mapdata = {
//     "data": [
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_04.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/ring-ceremony-concept.jpg",
//         "name": "Ring "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_05.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/sangeet-gala-concept.jpg",
//         "name": "Sangeet "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_07.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/mehendi-funtion-concept.jpg",
//         "name": "Mehendi "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_08.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/haldi-ritual-concept.jpg",
//         "name": "Haldi "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_10.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/cocktail-party-concept.jpg",
//         "name": "Cocktail "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_11.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-pheras-concept.jpg",
//         "name": "Wedding "
//       },
//       {
//         "img":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/wedding-occasions-2feb-2023_12.jpg",
//         "bnrimg":
//             "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0202/reception-revelry-concept.jpg",
//         "name": "Reception "
//       },
//     ]
//   };
//
//   var img =
//       "https://medias.utsavfashion.com/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f/e/m/embroidered-organza-saree-in-navy-blue-v1-syc11090.jpg";
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return MediaQuery(
//       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//       child: Scaffold(
//         backgroundColor: AppColors.white,
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 1,
//           backgroundColor: Colors.white,
//           leading: Builder(builder: (BuildContext context) {
//             return IconButton(
//               icon: Image.asset(
//                 "images/appBarIcon/menuIcon.png",
//                 height: 14,
//                 width: 22,
//                 // color: Colors.grey,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             );
//           }),
//           title: InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NavBarBottom(
//                             selectedIndex: 0,
//                           )));
//             },
//             child: Image.asset(
//               "images/welcome_icon.png",
//               height: 40,
//               width: 55,
//               // color: Colors.grey,
//             ),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: Image.asset(
//                 "images/appBarIcon/search.png",
//                 height: 20,
//                 width: 20,
//                 // color: Colors.grey,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const SearchScreen()));
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//               child: Stack(
//                 children: <Widget>[
//                   InkWell(
//                       child: Container(
//                         // color: Colors.cyan,
//                         width: 30,
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           "images/appBarIcon/cart.png",
//                           height: 25,
//                           width: 25,
//                           // color: Colors.grey,
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const ShoppingBag()));
//                         // (Route<dynamic> route) => false);
//                       }),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: const Text(
//                         '5',
//                         style: TextStyle(
//                             color: AppColors.primaryColorpink,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 10.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // body: bottomNavigationBar,
//         body: ListView(
//           children: [
//             // Text("Mob"),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColors.bordergrey,
//                   width: 1.0,
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/filterIcon/shipin.png",
//                               height: height * 0.020,
//                               width: height * 0.020,
//                               // color: Colors.grey,
//                             ),
//                             const SizedBox(width: 10.0),
//                             const Text(
//                               'SHIPS IN',
//                               style: TextStyle(
//                                 fontFamily: 'SourceSansPro',
//                                 color: AppColors.Textcolorheading,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                         Utils.showPickerShipin(context);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: InkWell(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           border: Border(
//                             right: BorderSide(
//                                 width: 1.0, color: AppColors.bordergrey),
//                             left: BorderSide(
//                                 width: 1.0, color: AppColors.bordergrey),
//                           ),
//                           color: Colors.white,
//                         ),
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/filterIcon/filter.png",
//                               height: height * 0.020,
//                               width: height * 0.020,
//                               // color: Colors.grey,
//                             ),
//                             const SizedBox(width: 10.0),
//                             const Text(
//                               'FILTER',
//                               style: TextStyle(
//                                 fontFamily: 'SourceSansPro',
//                                 color: AppColors.Textcolorheading,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const FilterList()));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: InkWell(
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/filterIcon/sort.png",
//                               height: height * 0.020,
//                               width: height * 0.020,
//                               // color: Colors.grey,
//                             ),
//                             const SizedBox(width: 10.0),
//                             const Text(
//                               'SORT',
//                               style: TextStyle(
//                                 fontFamily: 'SourceSansPro',
//                                 color: AppColors.Textcolorheading,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                         Utils.showPickershort(
//                           context,
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height * 0.010,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "SPRING-SUMMER TRENDS PREVIEW",
//                         style: FTextStyle.H1Headings,
//                       ),
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                   Image.network(
//                       "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0902/ss23-preview-page_02.jpg"),
//                   NWidgets.ksizedBox(context),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 8.0),
//                     child: Text(
//                       'This year, when the bloom is at its peak, exude an elegant charm in all Black. Yes! Fashion in Black is going to dominate the upcoming seasons of sunny bliss. Thus, we’ve curated the best Embroidered Sarees, Pakistani Suits, Lehengas, Top-Bottom Sets, etc., for you. They all are decorated with the allure of the dark shade– Claim now!',
//                       textAlign: TextAlign.justify,
//                       style: FTextStyle.paragrphStyle,
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                   Image.network(
//                       "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/2302/ss23-preview-page-23feb_05.jpg"),
//                   NWidgets.ksizedBox(context),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 8.0),
//                     child: Text(
//                       'The time to welcome Spring-Summer fashion has come. Yes! The trends for the upcoming seasons are here. Global fashion experts have picked floral prints, sheer fabrics, '
//                       'asymmetrical styles, and metallic shades. Stop wasting time! Build the perfect SS ‘23 closet with trending styles right now!',
//                       textAlign: TextAlign.justify,
//                       style: FTextStyle.paragrphStyle,
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                   NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
//                   NWidgets.ksizedBox(context),
//                   SizedBox(
//                     // color: Colors.cyan,
//                     height: height / 2.3,
//                     child: ListView.builder(
//                       itemCount: widget.mapdata['trending'].length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         final category = widget.mapdata['trending'][index];
//                         return GestureDetector(
//                           onTap: () {
//                             if (Utils.checkLogin == true) {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SoldPrdWithLogin(
//                                           img: category['img'])));
//                             } else {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SoldPrdWtLogin(
//                                           img: category['img'])));
//                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   width: width / 2,
//                                   child: Column(
//                                     children: [
//                                       Card(
//                                         color: Colors.white,
//                                         shape: const RoundedRectangleBorder(),
//                                         elevation: 0,
//                                         child: Column(
//                                           children: [
//                                             Image.network(
//                                               category['img'],
//                                               fit: BoxFit.cover,
//                                             ),
//                                             NWidgets.ksizedBox5(context),
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 category['name'],
//                                                 textAlign: TextAlign.left,
//                                                 style: FTextStyle.decStyle,
//                                               ),
//                                             ),
//                                             NWidgets.ksizedBox5(context),
//                                               Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Text.rich(
//                                                 TextSpan(
//                                                   text: '',
//                                                   children: <TextSpan>[
//                                                     TextSpan(
//                                                       text: '₹5000.00',
//                                                       style: FTextStyle
//                                                           .prizeStyle5,
//                                                     ),
//                                                     TextSpan(
//                                                       text: ' ${Utils.currencySymbol}3000.00',
//                                                       style: FTextStyle
//                                                           .prizeStyle3,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         // margin: EdgeInsets.all(10),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                   Image.network(
//                       "https://medias.utsavfashion.com/media/wysiwyg/promotions/2023/0902/ss23-preview-page_04.jpg"),
//                   NWidgets.ksizedBox(context),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 8.0),
//                     child: Text(
//                       'The bloom is back to steal the spotlight. Although, there is something special this year. Your favorite ethnic & fusion styles are decorated with playful floral designs. From Pakistani Suits to Top-Bottom Sets, all match the season’s bloom.',
//                       textAlign: TextAlign.justify,
//                       style: FTextStyle.paragrphStyle,
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                   NWidgets.kheadinghome(context, 'COLLECTION PREVIEW'),
//                   NWidgets.ksizedBox(context),
//                   SizedBox(
//                     // color: Colors.cyan,
//                     height: height / 2.3,
//                     child: ListView.builder(
//                       itemCount: widget.mapdata['trending'].length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         final category = widget.mapdata['trending'][index];
//                         return GestureDetector(
//                           onTap: () {
//                             if (Utils.checkLogin == true) {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SoldPrdWithLogin(
//                                           img: category['img'])));
//                             } else {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SoldPrdWtLogin(
//                                           img: category['img'])));
//                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(2.5, 0, 0, 0),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   width: width / 2,
//                                   child: Column(
//                                     children: [
//                                       Card(
//                                         color: Colors.white,
//                                         shape: const RoundedRectangleBorder(),
//                                         elevation: 0,
//                                         child: Column(
//                                           children: [
//                                             Image.network(
//                                               category['img'],
//                                               fit: BoxFit.cover,
//                                             ),
//                                             NWidgets.ksizedBox5(context),
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 category['name'],
//                                                 textAlign: TextAlign.left,
//                                                 style: FTextStyle.decStyle,
//                                               ),
//                                             ),
//                                             NWidgets.ksizedBox5(context),
//                                               Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Text.rich(
//                                                 TextSpan(
//                                                   text: '',
//                                                   children: <TextSpan>[
//                                                     TextSpan(
//                                                       text: '₹5000.00',
//                                                       style: FTextStyle
//                                                           .prizeStyle5,
//                                                     ),
//                                                     TextSpan(
//                                                       text: ' ${Utils.currencySymbol}3000.00',
//                                                       style: FTextStyle
//                                                           .prizeStyle3,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         // margin: EdgeInsets.all(10),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   NWidgets.ksizedBox(context),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
