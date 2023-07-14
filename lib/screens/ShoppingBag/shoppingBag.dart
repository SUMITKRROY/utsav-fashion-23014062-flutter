import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/Model/CartItemModel.dart';
import 'package:utsav/Model/ViewTotalModel.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/Payment/SelectAddress/billingAddressSelected.dart';
import 'package:utsav/screens/ShoppingBag/viewDetails.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'dart:developer' as developer;

import '../../Model/CartItemModel.dart';
import 'ShoppingBloc/shopping_bloc.dart';

class ShoppingBag extends StatefulWidget {
  Map<String, dynamic> addToCartData1;

  ShoppingBag({Key? key, required this.addToCartData1}) : super(key: key);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  final dio = Dio();
  String dropdownvalue = '1';
  String dropdownvalue2 = '1';
  var items2 = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List<String> QtyUpdate = [];
  // late Future<List<GetcartListModel>?> itemModel;
  late Future<List<dynamic>?> itemModel;
  late Future<ViewTotalModel?> viewTotalModel;
  late Future<List<dynamic>?> getpaymentinfo;

  var grandTotal;
  var Totalitems;
  List<String> images2 = [
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/g/a/gadwal-pure-silk-handloom-saree-in-red-v1-smua137.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-light-purple-v1-ssf16661.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/b/e/beaded-enamel-filled-jhumka-style-earrings-v1-jkc4408.jpg",
    "https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/s/t/stone-studded-peacock-style-brahmi-nath-v1-jpm5901.jpg",
  ];
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.4);
  Map<String, Map<String, dynamic>> addToCartData = {};
  // List<ItemModel> itemModel =[] ;
  @override
  void initState() {
    // getCartItems();
    itemModel = getCartItems();

    // getpaymentinfo=getPaymentInfo();
    // getCartItemsgfg();
    getPaymentInfo();
    // itemModel.then((value) {
    //   developer.log("name>>>${value!.length}");
    //   Totalitems = value!.length;
    // });
    // viewTotalModel.then((value) {
    //   developer.log("name>>>${value?.grandTotal}");
    //   // addToModelList.addAll(value as Iterable<AddToModel>);
    // });

    super.initState();
  }

 getPaymentInfo() async {
    var dio = Dio();
    print("GetPaymentInfo Api:-${AppUrl.guest_payment_information}${Utils.usercartkey}/payment-information");
    Response response = await dio.get("${AppUrl.guest_payment_information}${Utils.usercartkey}/payment-information");
    if (response.statusCode == 200) {
      print("GetPaymentInfo Api Response:-:-${response.data}");
      print("GetPaymentInfo Api Response:-:-${response.data.runtimeType}");
      Utils.getpaymentinfo = response.data["payment_methods"];
      print("GetPaymentInfo Api Response:-:-${Utils.getpaymentinfo}");
      print("Utils.usercartkey:-:-${Utils.usercartkey}");

      // List<dynamic> CartItems = jsonDecode(response.data);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => BlocProvider(
      //               create: (context) => ShoppingBloc(),
      //               child: ShoppingBag(addToCartData1: response.data),
      //             )));
      // print(response.data);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<List<dynamic>?> getCartItems() async {
    try {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Utils.showLoader(context));
      final url =
          // '${AppUrl.guest_carts_cartId_items}${Utils.usercartkey}/items';
          '${AppUrl.guest_carts_cartApi}${Utils.usercartkey}';
      // 'http://172.16.1.247:9020/rest/default/V1/utsav/cartApi?cartId=${Utils.usercartkey}';
      developer.log('Get CartItems Url: $url');
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
        Utils.CartItems = response.data;
        List<dynamic> CartItems = jsonDecode(response.data);
        developer.log('  CartItemsruntimeType: ${response.data.runtimeType}');
        developer.log('  response.data: ${response.data}');
        developer.log('Get CartItems: ${CartItems.runtimeType}');
        developer.log('Get CartItems: ${CartItems}');

        BlocProvider.of<ShoppingBloc>(context).add(ViewDetailsCartEvent());
        return CartItems;
        return List<GetcartListModel>.from(
            response.data.map((x) => GetcartListModel.fromJson(x)));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
        developer.log('Enter Data Failure');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<void> getCartItemsgfg() async {
    try {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Utils.showLoader(context));
      final url = '${AppUrl.guest_carts_cartApi}${Utils.usercartkey}';
      // 'http://172.16.1.247:9020/rest/default/V1/utsav/cartApi?cartId=${Utils.usercartkey}';
      developer.log('guest_carts_cartApi: $url');
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
        // Utils.CartItems = response.data;
        developer.log('listdata: ${response.data}');

        // BlocProvider.of<ShoppingBloc>(context).add(ViewDetailsCartEvent());
        // return List<ItemModel>.from(response.data.map((x) => ItemModel.fromJson(x)));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
        developer.log('Enter Data Failure');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // return null;
  }

  // Future<ViewTotalModel?> getViewDetailsItems() async {
  //   try {
  //     WidgetsBinding.instance.addPostFrameCallback((_) => Utils.showLoader(context));
  //     final url = '${AppUrl.guest_carts_ViewTotal}${Utils.usercartkey}/totals';
  //     developer.log('Get_totals_Url: $url');
  //     final response = await dio.get(
  //       url,
  //     );
  //     if (response.statusCode == 200) {
  //       // Utils.CartItems = response.data;
  //       developer.log('Get_totals: ${response.data}');
  //       developer.log('Get_totals: ${response.data['grand_total']}');
  //
  //       Utils.viewTotalModel = response.data;
  //       return ViewTotalModel.fromJson(response.data);
  //       // WidgetsBinding.instance
  //       //     .addPostFrameCallback((_) => Utils.hideLoader());
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Something went wrong!'),
  //       ));
  //       WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //   return null;
  // }
  Future<void> UpdateQyt(productData, itemsId) async {
    print(
        "UpdateQyt Api:-${AppUrl.guest_cartQyt}${Utils.usercartkey}/items/$itemsId");
    print("UpdateQyt productData:-${productData}");
    Response response = await dio.put(
      "${AppUrl.guest_cartQyt}${Utils.usercartkey}/items/$itemsId",
      options: Options(headers: {"Content-Type": "application/json"}),
      data: productData,
    );
    if (response.statusCode == 200) {
      print("RespByAbbToCart:-${response.data}");
      itemModel = getCartItems();
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  DeleteItemFCart(item) async {
    var dio = Dio();
    developer.log(
        "delete Cart Api:-${AppUrl.guest_delete_item}${Utils.usercartkey}/items/${item}");
    Response response = await dio.delete(
        "${AppUrl.guest_delete_item}${Utils.usercartkey}/items/${item}");
    if (response.statusCode == 200) {
      developer.log("PrintDeleteItem:-$response");
      refresh();
      // print(response.data);
    } else {
      developer.log('Error: ${response.statusCode}');
    }
  }

  Future refresh() async {
    setState(() {
      itemModel = getCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: FutureBuilder<List<dynamic>?>(
          future: itemModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
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
                  title: NWidgets.kappbarheading(context, "SHOPPING BAG"),
                  actions: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        "images/welcome_icon.png",
                        height: 33,
                        width: 36,
                        // color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavBarBottom(
                                      selectedIndex: 0,
                                    )));
                      },
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.all(width * 0.015),
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: Column(
                      children: [
                        Totalitems != 0
                            ? Expanded(
                                child: SizedBox(
                                  height: height,
                                  child: ListView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length + 1,
                                    // The number of items in the list
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      QtyUpdate = List.generate(
                                          snapshot.data!.length,
                                          (index) => snapshot.data![index]
                                                  ['qty']
                                              .toString());

                                      Totalitems = snapshot.data!.length;
                                      if (index >= snapshot.data!.length) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                height: 50,
                                                width: width,
                                                margin:
                                                    const EdgeInsets.all(15.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFF5F5F5),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .bordergrey)),
                                                child: const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          'Add items from Wishlist',
                                                          style: FTextStyle
                                                              .H1Headings15)),
                                                ),
                                              ),
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) => const BillingAddress()));
                                              },
                                            ),
                                            SizedBox(
                                              height: height * 0.020,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    "Recommended Accessories"
                                                        .toUpperCase(),
                                                    style:
                                                        FTextStyle.H1Headings),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.020,
                                            ),
                                            SizedBox(
                                              // color: Colors.cyan,
                                              height: 350,
                                              child: ListView.builder(
                                                controller: _pageController,
                                                itemCount: Utils
                                                    .productPrimaryList!.length,
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          2.5, 0, 0, 0),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            width: width / 2,
                                                            child: Column(
                                                              children: [
                                                                Card(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: const RoundedRectangleBorder(
                                                                      // borderRadius: BorderRadius.circular(10.0),
                                                                      ),
                                                                  elevation: 0,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Image
                                                                          .network(
                                                                        Utils
                                                                            .productPrimaryList[index]
                                                                            .imageUrl,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        // '',
                                                                        Utils
                                                                            .productPrimaryList[index]
                                                                            .name,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FTextStyle
                                                                            .decStyle,
                                                                        // overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text.rich(
                                                                        TextSpan(
                                                                          text:
                                                                              '',
                                                                          children: <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                              // text:  '',
                                                                              text: '${Utils.currencySymbol + Utils.productPrimaryList[index].listPrice.toStringAsFixed(2)}',
                                                                              style: FTextStyle.prizeStyle5,
                                                                            ),
                                                                            TextSpan(
                                                                              // text: '  ',
                                                                              text: ' ${Utils.currencySymbol + Utils.productPrimaryList[index].price.toStringAsFixed(2)}',
                                                                              style: FTextStyle.prizeStyle3,
                                                                            ),
                                                                          ],
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
                                          ],
                                        );
                                      }
                                      return SizedBox(
                                        height: 230,
                                        width: width,
                                        child: Card(
                                          color: Colors.white,
                                          shape: const RoundedRectangleBorder(),
                                          elevation: 0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.network(
                                                '${AppUrl.ImgBaseUrl + snapshot.data![index]['media_gallery_entries'][0]['file']}',
                                                // 'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-saree-in-pink-v1-sbha1722.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      width * 0.010),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              snapshot.data![
                                                                      index]
                                                                  ['name'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              softWrap: false,
                                                              // "Embroidered Net Scalloped Saree in Red",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: FTextStyle
                                                                  .decStyle,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              DeleteItemFCart(
                                                                snapshot.data![
                                                                        index]
                                                                    ['item_id'],
                                                              );
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .clear_rounded,
                                                              size: 22,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text: '',
                                                            children: <
                                                                TextSpan>[
                                                              const TextSpan(
                                                                text: '',
                                                                style: FTextStyle
                                                                    .prizeStyle5,
                                                              ),
                                                              TextSpan(
                                                                // text:'',
                                                                text:
                                                                    '  ${Utils.currencySymbol + snapshot.data![index]['price'].toString()}',
                                                                style: FTextStyle
                                                                    .prizeStyle3,
                                                              ),
                                                              const TextSpan(
                                                                text:
                                                                    '  (25% Off)',
                                                                style: FTextStyle
                                                                    .offprizeStyle,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 5,
                                                      // ),
                                                      // const Text(
                                                      //   "Unstitched Fabric",
                                                      //   textAlign: TextAlign.left,
                                                      //   style: FTextStyle.decStyle,
                                                      // ),
                                                      // const SizedBox(
                                                      //   height: 5,
                                                      // ),
                                                      // const Text(
                                                      //   "Ships in 2 days",
                                                      //   // textAlign: TextAlign.left,
                                                      //   style: FTextStyle.decStyle,
                                                      // ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            "Qty",
                                                            style: FTextStyle
                                                                .decStyle,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.030,
                                                            width: 45,
                                                            // margin: const EdgeInsets.all(5.0),
                                                            // padding: const EdgeInsets.all(3.0),
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            0)), //here
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .bordergrey)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child:
                                                                  DropdownButton(
                                                                underline:
                                                                    const SizedBox(),

                                                                // Initial Value
                                                                value:
                                                                    QtyUpdate[
                                                                        index],

                                                                // Down Arrow Icon
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  size: 20,
                                                                ),
                                                                items: items2
                                                                    .map((String
                                                                        items) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        items,
                                                                    child: Text(
                                                                      items,
                                                                      style: FTextStyle
                                                                          .decStyle,
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    QtyUpdate[
                                                                            index] =
                                                                        newValue!;
                                                                    addToCartData =
                                                                        {
                                                                      "cartItem":
                                                                          {
                                                                        "sku": snapshot.data![index]
                                                                            [
                                                                            'sku'],
                                                                        "qty": QtyUpdate[
                                                                            index],
                                                                        "quote_id":
                                                                            snapshot.data![index]['quoteId']
                                                                      }
                                                                    };

                                                                    UpdateQyt(
                                                                        addToCartData,
                                                                        snapshot.data![index]
                                                                            [
                                                                            'item_id']);
                                                                  });

                                                                  Future.delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                    refresh();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        'Move TO Wishlist'
                                                                            .toUpperCase(),
                                                                        style: FTextStyle
                                                                            .decStyle,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          const NavBarBottom(
                                                                              selectedIndex: 2)));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            "Subtotal :${Utils.currencySymbol + snapshot.data![index]['price'].toString()}",
                                                            style: FTextStyle
                                                                .decStyle,
                                                          )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                              )
                            : shopingbag(),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Totalitems != 0
                    ? BlocBuilder<ShoppingBloc, ShoppingState>(
                        builder: (context, state) {
                          if (state is ViewDetailsSuccess) {
                            return Container(
                              decoration: const BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: BottomNavigationBar(
                                elevation: 1,
                                items: <BottomNavigationBarItem>[
                                  BottomNavigationBarItem(
                                    icon: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                // '',
                                                '${Utils.currencySymbol + Utils.viewTotalModel!['grand_total'].toString()}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "SourceSansPro",
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  // decoration: TextDecoration.lineThrough,
                                                ),
                                              )),
                                          InkWell(
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text.rich(
                                                TextSpan(
                                                  text: '',
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          '${Utils.viewTotalModel!['items_qty'].toString()} Items',
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            "SourceSansPro",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text:
                                                          '          View Details',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF2C8FEB),

                                                        // decoration: TextDecoration.lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetails(
                                                            viewTotalModel:
                                                                state
                                                                    .addToModel,
                                                          )));
                                            },
                                          ),
                                          // Align(
                                          //     alignment: Alignment.centerLeft,
                                          //     child: Text("(Inclusive of all taxes)",
                                          //         style: TextStyle(
                                          //           color: Colors.grey,
                                          //         ))),
                                        ],
                                      ),
                                    ),
                                    label: '',
                                  ),
                                  BottomNavigationBarItem(
                                    icon: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: SizedBox(
                                        height: 56,
                                        width: 320,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // (Route<dynamic> route) => false);
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //              SelectAddress(productId: '', sku: '', price: '', type: " ", name: '',)));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BillingAddressSelected(
                                                            // productId: '',
                                                            // sku: '',
                                                            // price: '',
                                                            // type: " ",
                                                            // name: '',
                                                            )));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors
                                                .primaryColorpink, // background
                                          ),
                                          child: const Text(
                                            "GO TO CHECKOUT",
                                            style: TextStyle(
                                                fontFamily: 'SourceSansPro',
                                                fontSize: 16,
                                                // color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                    label: '',
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container(
                            decoration: const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: BottomNavigationBar(
                              elevation: 1,
                              items: <BottomNavigationBarItem>[
                                const BottomNavigationBarItem(
                                  icon: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  ),
                                  label: 'Please Wait',
                                ),
                                BottomNavigationBarItem(
                                  icon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: SizedBox(
                                      height: 56,
                                      width: 320,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // (Route<dynamic> route) => false);
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //              SelectAddress(productId: '', sku: '', price: '', type: " ", name: '',)));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BillingAddressSelected()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors
                                              .primaryColorpink, // background
                                        ),
                                        child: const Text(
                                          "GO TO CHECKOUT",
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 16,
                                              // color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                  label: '',
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : SizedBox(),
              );
            } else {
              return Scaffold(
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
                    title: NWidgets.kappbarheading(context, "SHOPPING BAG"),
                    actions: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          "images/welcome_icon.png",
                          height: 33,
                          width: 36,
                          // color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarBottom(
                                        selectedIndex: 0,
                                      )));
                        },
                      ),
                    ],
                  ),
                  body: shopingbag());
            }
          }),
    );
  }

  Widget shopingbag() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                  // border: Border.all(color: Colors.grey, width: 1),
                  shape: BoxShape.circle,
                  color: AppColors.bordergrey),
              child: Image.asset(
                'images/cart/cartbag.png',
                scale: 4,
                // width: width * 0.060,
                width: 30,
                height: 25,
                // color: AppColors
                //     .primaryColorpink,
                color: Colors.black,
              ),
            ),
            NWidgets.ksizedBox(context),
            NWidgets.ksizedBox10(context),
            const Text(
              "You have nothing in BAG!",
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            NWidgets.ksizedBox10(context),
            SizedBox(
              width: width / 1.8,
              child: const Text(
                "Please continue shopping to see your products here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            NWidgets.ksizedBox(context),
            NWidgets.ksizedBox(context),
            SizedBox(
              // height: 67,
              // width: 362,
              height: height * 0.067,
              width: width * 362,
              child: ElevatedButton(
                onPressed: () {
                  // Utils.cartitems="1";
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColorpink, // background
                ),
                child: const Text(
                  "CONTINUE SHOPPING",
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 18,
                      color: AppColors.buttongrey,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Utils.CartItems[0]
