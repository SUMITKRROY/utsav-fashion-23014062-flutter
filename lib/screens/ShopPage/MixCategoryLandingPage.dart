import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:utsav/Model/ProdRendInfoModel.dart';
import 'package:utsav/screens/Filter/FilterBloc/filter_bloc.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'dart:developer' as developer;
import 'package:utsav/screens/Home/ProductDetails/ProductDetails.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/screens/Filter/filterList.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/utils/constants.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import '../../Model/LinkCreateRequested.dart';
import '../../Model/ProductSimilarModel.dart';
import '../../Model/RequestFilterModel.dart';
import '../Login/login_screen.dart';
import 'ShopBloc/shop_bloc.dart';

class MixCategoryLandigPage extends StatefulWidget {

  // void setupScrollController(context) {
  //   scrollController.addListener(() {
  //     if (scrollController.position.atEdge) {
  //       if (scrollController.position.pixels != 0) {
  //         BlocProvider.of<ShopBloc>(context).loadPosts();
  //       }
  //     }
  //   });
  // }


  String Subattribute_Id  ;
  String Sunatrribute_code  ;
  String condition_type ;
  String SubCondition_type ;
  String field  ;
  String Subfield  ;
  var value  ;
  String Subvalue  ;
  String heding;
  int Count;
  String pageSize;
  List<RequestDatum> filterdata;


  MixCategoryLandigPage(
      {Key? key,


      required this.Subattribute_Id,
      required this.Sunatrribute_code,
      required this.condition_type,
      required this.SubCondition_type,
      required this.field,
      required this.Subfield,
      required this.value,
      required this.Subvalue,
      required this.heding,
      required this.Count,
      required this.pageSize,
      required this.filterdata,
       })
      : super(key: key);

  @override
  State<MixCategoryLandigPage> createState() => _MixCategoryLandigPageState();
}

class _MixCategoryLandigPageState extends State<MixCategoryLandigPage> {
  final Dio dio = Dio();

  int value = 1;


  ///
  late ScrollController _controller;
  int _page = 0;


  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;

  late Future<ProdRendInfoModel?> prodRendInfoModel;
  List<LinkCreateRequested> linkCreateRequestedData =[];
  List<Item> items =[];


   var SmallImg  ;

   StringBuffer filteredDataApi = StringBuffer();


  List<PositionValue> mergeData(List<RequestDatum> dataList) {
    Map<String, PositionValue> mergedData = {};

    for (var data in dataList) {
      final int position = data.index;
      final String categoryName = data.categoryName;
      final String value = data.value;

      final key = "$position-$categoryName";

      if (!mergedData.containsKey(key)) {
        mergedData[key] = PositionValue(
          position: position,
          categoryName: categoryName,
          values: [value],
        );
      } else {
        mergedData[key]!.values.add(value);
      }
    }

    List<PositionValue> mergedList = mergedData.values.toList();

    return mergedList;
  }

  @override
  void initState() {


    if(widget.filterdata.isNotEmpty) {
      List<PositionValue> mergedList = mergeData(widget.filterdata);
      String type = "";
      if(mergedList.length>=0) {
        type = "in";
      } else {
        type = "finset";
      }

      for(int i = 0; i < mergedList.length; i++) {
        filteredDataApi.write(
            "&searchCriteria[filter_groups][${i+1}][filters][0][field]=${mergedList[i].categoryName}");
        filteredDataApi.write(
            "&searchCriteria[filter_groups][${i+1}][filters][0][value]=${mergedList[i].values.toString().replaceAll("[", "").replaceAll("]", "")}");
        filteredDataApi.write(
            "&searchCriteria[filter_groups][${i+1}][filters][0][condition_type]=$type");

      }

      prodRendInfoModel = firstLoad(value, filteredDataApi.toString());
      prodRendInfoModel.then((value) {
        // var url =   value!.items[0].url;
        items.addAll(value!.items);

        developer.log('items ${items}');
      });


    } else {
      prodRendInfoModel = firstLoad(value, "");
      prodRendInfoModel.then((value) {
        // var url =   value!.items[0].url;
        items.addAll(value!.items);

        developer.log('items ${items}');
      });

      developer.log('api call');
      developer.log('value ${widget.value}');
    }
    _controller = ScrollController()
      ..addListener(pagination);

    super.initState();
  }



  void pagination() {
    // developer.log(_controller.position.extentAfter.toString());
    if (  _controller.position.extentAfter <= 300 /*&& (items.length.isOdd)*/){

      setState(() {
        _isLoadMoreRunning = true;
        value += 1;
        developer.log("valueUpdated>>>>>>>$value");

        prodRendInfoModel = firstLoad(value,filteredDataApi.toString());
        prodRendInfoModel.then((value) {
          developer.log('appi hitt pagination');
          items.addAll(value!.items);
        });

      });
    }else{
      // setState(() {
      //   _hasNextPage = false;
      // });

    }
  }

  Future refresh() async {
    setState(() {
    });
  }



  Future<ProdRendInfoModel?> firstLoad(CriteriacurrentPage, String apiUrl) async {
    if(apiUrl.isNotEmpty) {
      StringBuffer filteredApi = StringBuffer();
      filteredApi.write(AppUrl.products_render_info);
      filteredApi.write("?storeId=${RenderDatavalues.storeId}");
      filteredApi.write("&currencyCode=${Utils.currencyName}");
      filteredApi.write("&searchCriteria[pageSize]=${RenderDatavalues.CriteriapageSize}");
      filteredApi.write("&searchCriteria[currentPage]=$value");
      filteredApi.write("&searchCriteria[filter_groups][0][filters][0][field]=${widget.field}");
      filteredApi.write("&searchCriteria[filter_groups][0][filters][0][value]=${widget.value}");
      filteredApi.write( "&searchCriteria[filter_groups][0][filters][0][condition_type]=${widget.condition_type}");
      filteredApi.write(filteredDataApi.toString());
      print("====filteredApi===== ${filteredApi.toString()}");
      Response response = await dio.get(filteredApi.toString());



      developer.log('response-statusCode-- ${response.statusCode}');
      // developer.log('ProdRendInfoModel.data--- ${response.data}');
      if (response.statusCode == 200) {

        // setState(() {
        //   _isLoadMoreRunning = true;
        // });
        return ProdRendInfoModel.fromJson(response.data);
      }
      else{
        print("====other===== ${""}");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.data)));

      }
    } else {
      developer.log('response-currencyCode-- ${Utils.currencyName}');
      print("${AppUrl.products_render_info}"
          "?storeId=${RenderDatavalues.storeId}"
          "&currencyCode=${Utils.currencyName}"
          "&searchCriteria[pageSize]=${RenderDatavalues.CriteriapageSize}"
          "&searchCriteria[currentPage]=$CriteriacurrentPage"
          "&searchCriteria[filter_groups][0][filters][0][field]=${RenderDatavalues
          .field}"
          "&searchCriteria[filter_groups][0][filters][0][value]=${widget.value}"
          "&searchCriteria[filter_groups][0][filters][0][condition_type]=${RenderDatavalues
          .conditionType}"
          "&searchCriteria[filter_groups][1][filters][0][field]=${widget
          .Subfield}"
          "&searchCriteria[filter_groups][1][filters][0][value]=${widget
          .Subvalue}"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=${widget
          .SubCondition_type}");

      var Appurlkey = "${AppUrl.products_render_info}"
          "?storeId=${RenderDatavalues.storeId}"
          "&currencyCode=${Utils.currencyName}"
          "&searchCriteria[pageSize]=${RenderDatavalues.CriteriapageSize}"
          "&searchCriteria[currentPage]=$CriteriacurrentPage"
          "&searchCriteria[filter_groups][0][filters][0][field]=${widget.field}"
          "&searchCriteria[filter_groups][0][filters][0][value]=${widget.value}"
          "&searchCriteria[filter_groups][0][filters][0][condition_type]=${widget
          .condition_type}";

      var AppurlkeyWithAttribute = "${AppUrl.products_render_info}"
          "?storeId=${RenderDatavalues.storeId}"
          "&currencyCode=${Utils.currencyName}"
          "&searchCriteria[pageSize]=${RenderDatavalues.CriteriapageSize}"
          "&searchCriteria[currentPage]=$CriteriacurrentPage"
          "&searchCriteria[filter_groups][0][filters][0][field]=${widget.field}"
          "&searchCriteria[filter_groups][0][filters][0][value]=${widget.value}"
          "&searchCriteria[filter_groups][0][filters][0][condition_type]=${widget
          .condition_type}"
          "&searchCriteria[filter_groups][1][filters][0][field]=${widget
          .Subfield}"
          "&searchCriteria[filter_groups][1][filters][0][value]=${widget
          .Subvalue}"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=${widget
          .SubCondition_type}";
      var AppUrlWithSubAttribute = "${AppUrl.products_render_info}"
          "?storeId=${RenderDatavalues.storeId}"
          "&currencyCode=${Utils.currencyName}"
          "&searchCriteria[pageSize]=${RenderDatavalues.CriteriapageSize}"
          "&searchCriteria[currentPage]=$CriteriacurrentPage"
          "&searchCriteria[filter_groups][0][filters][0][field]=${widget.field}"
          "&searchCriteria[filter_groups][0][filters][0][value]=${widget.value}"
          "&searchCriteria[filter_groups][0][filters][0][condition_type]=${widget
          .condition_type}"
          "&searchCriteria[filter_groups][1][filters][0][field]=${widget
          .Subfield}"
          "&searchCriteria[filter_groups][1][filters][0][value]=${widget
          .Subvalue}"
          "&searchCriteria[filter_groups][1][filters][0][conditionType]=${widget
          .SubCondition_type}"
          "&searchCriteria[filter_groups][2][filters][0][field]=${widget
          .Sunatrribute_code}"
          "&searchCriteria[filter_groups][2][filters][0][value]=${widget
          .Subattribute_Id}"
          "&searchCriteria[filter_groups][2][filters][0][conditionType]=${widget
          .condition_type}";


      Response response = await dio.get(
          widget.Subfield == '' ? Appurlkey : widget.Sunatrribute_code == ''
              ? AppurlkeyWithAttribute
              : AppUrlWithSubAttribute);


      developer.log('response-statusCode-- ${response.statusCode}');
      // developer.log('ProdRendInfoModel.data--- ${response.data}');
      if (response.statusCode == 200) {
        // setState(() {
        //   _isLoadMoreRunning = true;
        // });
        return ProdRendInfoModel.fromJson(response.data);
      }
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.data)));
      }
    }
  }


  AnimationController? animationController;
  @override
  void dispose() {
    // _controller.removeListener(firstLoad(value) as VoidCallback);
    animationController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: widget.heding == "Shop"
            ? null
            : AppBar(
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
                                      builder: (context) =>
                                            ShoppingBag(addToCartData1: {},)));
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
        body:RefreshIndicator(
          onRefresh: refresh,
          child: ListView(
            controller: _controller,

            children: [
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
                          BlocProvider.of<ShopBloc>(context).add(ShipInFilterdata(Utils.userkey));
                          showPickerShipin(context);
                          // Utils.showPickerShipin(context);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BlocProvider(
                                       create: (context) => FilterBloc(),
                                       child: FilterList(
                                       heding: widget.heding,
                                       field: widget.field,
                                       value:  widget.value,
                                       Subfield: widget.Subfield,
                                       Subvalue: widget.Subvalue,
                                       Count: Utils.product_count,
                                       Sunatrribute_code: widget.Sunatrribute_code,
                                       Subattribute_Id: widget.Subattribute_Id,
                                       pageSize: widget.pageSize,
                                       condition_type: widget.condition_type,
                                       SubCondition_type: widget.SubCondition_type,),
                                      ),

                          ));
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
              SizedBox(
                height: height * 0.010,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    NWidgets.ksizedBox(context),
                    Row(
                      children: [
                        Text(
                          widget.heding,
                          style: FTextStyle.H1Headings,
                          textAlign: TextAlign.left,
                        ),
                        const Spacer(),
                        Text(
                          'Found ${widget.Count.toString()} items',
                          style: FTextStyle.SkUStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    NWidgets.ksizedBox(context),
                    const SizedBox(
                      height: 10,
                    ),

                    FutureBuilder<ProdRendInfoModel?>(
                        future: prodRendInfoModel,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                SizedBox(
                                  child: GridView.builder(

                                    physics: const NeverScrollableScrollPhysics(),

                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.48,

                                    ),

                                    itemCount:  items.length,
                                    itemBuilder: (context, index) {

                                      return InkWell(
                                        onTap: () {
                                          SmallImg =  items[index].images[0].url;

                                          var img =  items[index].images[0].url;

                                          var id =  items[index].id;
                                          var repImag =     Utils.imageConverter(img);
                                          var producturl =  items[index].url;
                                          var productdata= Utils.Urlparser(producturl);
                                          developer.log("productindx>>$productdata");
                                          developer.log("producturl>>$producturl");
                                          developer.log("idid>>$id");
                                          developer.log("items>>$items");



                                          var arr = img.split('/');
                                          var ind = arr.indexOf("small_image");
                                          arr[ind] = "image";
                                          arr[ind + 1] = "1000x";
                                          var urlKey = arr[ind + 2];

                                          developer.log("arrindexurl>>>${arr[ind+2]}");
                                          var urlrImag ;
                                          var urlImg = arr.toString().replaceAll(",", "/");
                                          urlImg = urlImg.replaceAll(" ", "");
                                          urlImg = urlImg.replaceAll("[", "");
                                          urlImg = urlImg.replaceAll("]", "");
                                          developer.log("urlrImag>>$urlImg");
                                          var splitValue = urlImg.split(urlKey);
                                          Utils.ProductImgUrl = splitValue[0];
                                          Utils.ImgUrlKey = urlKey;
                                          Utils.SmallImg = SmallImg;
                                          developer.log("Utils.ProductImgUrl>>${Utils.ProductImgUrl}");
                                          developer.log("Utils.ImgUrlKey>>${Utils.ImgUrlKey}");
                                          developer.log("Utils.ImgUrl>>${Utils.ProductImgUrl+Utils.ImgUrlKey}");
                                          developer.log("Utils.SmallImg>>${Utils.SmallImg}");
                                          developer.log("AppUrl.ImgBaseUrl>>${AppUrl.ImgBaseUrl}");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>   BlocProvider(
                                                    create: (context) => ProductBloc(),
                                                    child: ProductsDetails(
                                                      img: repImag,
                                                      smallimg: items[index].images[0].url,
                                                      // subImgUrl: '${Utils.ProductImgUrl+Utils.ImgUrlKey}',
                                                      subImgUrl: AppUrl.ImgBaseUrl,
                                                      label:  items[index].images[0].label.toString(),
                                                      regPrice: Utils.parseHtmlString(items[index].priceInfo.formattedPrices.regularPrice.toString()),
                                                      minPrice: Utils.parseHtmlString(items[index].priceInfo.formattedPrices.minimalPrice.toString()),
                                                      productId: productdata,
                                                    ),
                                                  )));
                                        },

                                        child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0.0),
                                          ),
                                          elevation: 0.5,
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Image.network(
                                                     items[index].images[0].url,
                                                    height: (height / 3.1),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Positioned(
                                                    bottom: 2.0,
                                                    // right: 0.0,
                                                    left: 5.0,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: InkWell(
                                                          child: Container(
                                                            width: 32,
                                                            height: height * 0.052,
                                                            decoration: const BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: Colors.white),
                                                            child: Image.asset(
                                                              'images/mcards.png',
                                                              scale: 4,
                                                              width: width * 0.060,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            BlocProvider.of<ProductBloc>(context).add(NostoApiSimilarProduct(items[index].id.toString()));

                                                            Future.delayed(const Duration(seconds: 2),
                                                                    () {
                                                                  print('One second has passed.');
                                                                  developer.log(
                                                                      "length>>>${Utils.productPrimaryList!.length}");
                                                                  showPickerBottom(
                                                                      context,
                                                                      Utils
                                                                          .productPrimaryList); // Prints after 1 second.
                                                                });
                                                          }),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 5.0,
                                                    // right: 0.0,
                                                    right: 5.0,
                                                    child:   SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Align(
                                                        alignment:
                                                        const FractionalOffset(0.6, 1.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                    const loginScreen()));
                                                          },
                                                          child: Container(
                                                            width: 32,
                                                            height: height * 0.052,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors.grey.shade200,
                                                                    width: 1),
                                                                shape: BoxShape.circle,
                                                                color: Colors.white),
                                                            child: Image.asset(
                                                              'images/navBarIcon/navWishlist.png',
                                                              scale: 5,
                                                              width: width * 0.060,
                                                              // height: 20,
                                                              color: AppColors.primaryColorpink,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 10.0,
                                                    right: -10.0,
                                                    left: 0.0,
                                                    top: 10.0,
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Container(
                                                            decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(40),
                                                                bottomLeft: Radius.circular(40),
                                                                bottomRight: Radius.circular(40),
                                                                topRight: Radius.circular(40),
                                                              ),
                                                              color: AppColors.primaryColorblue,
                                                            ),
                                                            height: height * 0.035,
                                                            width: null,
                                                            child: FloatingActionButton.extended(
                                                              elevation: 0,
                                                              onPressed: () {},
                                                              label:  Text('New'.toUpperCase() ,style: TextStyle(
                                                                fontFamily: 'SourceSansPro',
                                                                color: AppColors.primaryColorblue,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 14,
                                                              ),),
                                                              backgroundColor:Colors.white ,
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                         items[index].images[0].label,
                                                        // prodRendInfoModel['items'][index]['images'][0]['label'],
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
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
                                                              text:
                                                              '${Utils.parseHtmlString(items[index].priceInfo.formattedPrices.regularPrice.toString())}',
                                                              style: FTextStyle
                                                                  .prizeStyle5,
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                ' ${Utils.parseHtmlString(items[index].priceInfo.formattedPrices.minimalPrice.toString())}',
                                                                style: FTextStyle
                                                                    .prizeStyle3),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Column(
                                                      children:   [
                                                        Align(
                                                          alignment:
                                                          Alignment.bottomLeft,
                                                          child: Text.rich(
                                                            TextSpan(
                                                              text: '',
                                                              children: <TextSpan>[
                                                                TextSpan(
                                                                  text:calculatePercentageDecrease(items[index].priceInfo.regularPrice.toString(),items[index].priceInfo.maxRegularPrice.toString()),
                                                                   // '10% Off',
                                                                  style: FTextStyle
                                                                      .offprizeStyle,
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
                                            ],
                                          ),
                                          // margin: EdgeInsets.all(10),
                                        ),

                                      );
                                    },
                                  ),
                                ),
                                if (_isLoadMoreRunning == true)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 40),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                if (_hasNextPage == false)
                                  Container(
                                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                                    color: Colors.amber,
                                    child: const Center(
                                      child: Text('You have fetched all of the content'),
                                    ),
                                  ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              height:height,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller:
                                  ScrollController(keepScrollOffset: true),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.50,
                                    // childAspectRatio: 270/340,
                                  ),
                                  // itemCount: widget.mapdata['hidenGem'].length,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),

                                      elevation: 1.0,

                                      child: const SizedBox(height: 80),
                                    );
                                  },
                                ),
                              ),
                            );

                          }
                        }),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
            ],
          ),
        )
      ),
    );
  }
  String calculatePercentageDecrease(String initialAmount, String finalAmount) {
    double initialAmountfinal = double.parse(initialAmount) ;
    double finalAmountfinal= double.parse(finalAmount);
    double decreasePercentage = ((initialAmountfinal - finalAmountfinal) / initialAmountfinal) * 100;
    return decreasePercentage.toStringAsFixed(0) + '% Off';
  }
  showPickerBottom(context, List<ProductPrimary> similarModel) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext bc) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SizedBox(
                height: height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Align(
                            child: Container(
                              height: 5,
                              width: 30,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                // border: Border.all(color: Colors.grey, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(100, 50)),
                              ),
                              child: const Text(''),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const Text('SIMILAR PRODUCT',
                          textScaleFactor: 1.0,
                          style: FTextStyle.decStyle,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.300,
                          child: ListView.builder(
                            itemCount: Utils.productPrimaryList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) =>
                                                ProductBloc(),
                                            child: ProductsDetails(
                                              img: Utils.productPrimaryList[index].imageUrl,
                                              subImgUrl: '${Utils.ProductImgUrl + Utils.ImgUrlKey}',
                                              label: Utils.productPrimaryList[index].name.toString(),
                                              regPrice: Utils.productPrimaryList[index].listPrice.toStringAsFixed(2),
                                              minPrice: Utils.productPrimaryList[index].price.toStringAsFixed(2),
                                              productId: Utils.productPrimaryList[index].name,
                                              smallimg: SmallImg,
                                            ),
                                          )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        Utils.productPrimaryList[index].imageUrl,
                                        // '',
                                        fit: BoxFit.fill,
                                        height: height / 3.1,
                                        width: width / 2,
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        width: width / 2,
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // '',
                                              Utils.productPrimaryList[index].name,
                                              textAlign: TextAlign.start,
                                              style: FTextStyle.decStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: '',
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    // text:  '',
                                                    text: Utils
                                                        .productPrimaryList[index]
                                                        .listPrice
                                                        .toStringAsFixed(2),
                                                    style:
                                                    FTextStyle.prizeStyle5,
                                                  ),
                                                  TextSpan(
                                                    // text: '  ',
                                                    text:
                                                    ' ${Utils.currencySymbol + Utils.productPrimaryList[index].price.toStringAsFixed(2)}',
                                                    style:
                                                    FTextStyle.prizeStyle3,
                                                  ),
                                                ],
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
                      )
                    ]),
              ),
            ),
          );
        });
  }


  showPickerShipin(context,) {
    // const dataItems = [
    //   'Ready to Ship',
    //   'Within 2 days',
    //   'Within 7 days',
    //   'Within 10 days',
    //   'Within 15 days',
    //   'More than 15 days',
    // ];
    final dataItems = Utils.shipinfilter;

    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (BuildContext bc) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(

              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(

                    height: 5,
                  ),
                  const SizedBox(

                      width: 40,
                      child: Divider(
                        thickness: 3,
                      )),
                  const SizedBox(

                    height: 5,
                  ),
                  const Text("SHIPS IN",
                      textScaleFactor: 1.0,
                      style: FTextStyle.H1Headings15,
                      textAlign: TextAlign.start),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(
                              height: 1,
                            ),
                            Visibility(
                              visible: dataItems[index]["label"].toString() ==' ' ? false : true,
                              child: InkWell(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Container(
                                    child: Text(
                                      // 'Within 2 days',
                                        dataItems[index]["label"],
                                        textScaleFactor: 1.0,
                                        style: FTextStyle.decStyle,
                                        textAlign: TextAlign.start),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class PositionValue {
  final int position;
  final String categoryName;
  final List<String> values;

  PositionValue({required this.position, required this.categoryName, required this.values});
}
