import 'dart:convert';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'package:utsav/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:utsav/utils/app_colors.dart';
import '../../../utils/widgets.dart';
import 'dart:developer' as developer;

class SizeChartCm extends StatefulWidget {
  const SizeChartCm({Key? key}) : super(key: key);

  @override
  State<SizeChartCm> createState() => _SizeChartCmState();
}

class _SizeChartCmState extends State<SizeChartCm> {
  var iscecked = false;
  var iscecked1 = false;
  var iscecked2 = false;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetsizeChart("UNJ985", "XDfdUdd213oedY0", "10005", "cm", "inches"));
    super.initState();
  }

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
          title: NWidgets.kappbarheading(context, "Size Chart"),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is SizeChartDataSuccess) {
              var sizechatDatacm = state.SizeChartDatajsoncm;
              var sizechatDatainch = state.SizeChartDatajsoninch;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Divider(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Garment measurement shown may have tolerance of 0.5 inch to 1 inch.",
                              style: FTextStyle.H1Headings15,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 38,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        RoundCheckBox(
                                          isChecked: iscecked1,
                                          checkedColor:
                                          AppColors.primaryColorpink,
                                          size: 15,
                                          onTap: (selected) {
                                            iscecked1 = selected!;
                                            iscecked2 = false;
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Size in cm",
                                            style:
                                            TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      iscecked = !iscecked;
                                      iscecked2 = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: width / 20),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 38,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        RoundCheckBox(
                                          isChecked: iscecked2,
                                          checkedColor:
                                          AppColors.primaryColorpink,
                                          size: 15,
                                          onTap: (selected) {
                                            iscecked2 = selected!;
                                            iscecked1 = false;
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Size in inches",
                                            style:
                                            TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      iscecked = !iscecked;
                                      iscecked1 = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          iscecked
                              ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.bordergrey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Size cm',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Chest',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Around Above Waist',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: sizechatDatacm["size"]
                                  ["options"]
                                      .length, // The number of items in the list
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // This function is called for each item in the list
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.bordergrey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatacm[
                                                      "size"]
                                                      ["options"]
                                                      [index]["tag"],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                    left: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatacm["size"]
                                                      [
                                                      "options"]
                                                      [index]
                                                      ["values"]
                                                      [1]["value"],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell test");
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatacm["size"]
                                                      [
                                                      "options"]
                                                      [index]
                                                      ["values"]
                                                      [2]["value"],
                                                      style:
                                                      const TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                              : Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.bordergrey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Size Inches',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          print("tap inkwell");
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Chest',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          print("tap inkwell");
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: AppColors.bordergrey,
                                        padding:
                                        const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Around Above Waist',
                                              style: TextStyle(
                                                fontFamily:
                                                'SourceSansPro',
                                                color: AppColors
                                                    .Textcolorheading,
                                                fontWeight:
                                                FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: sizechatDatainch["size"]
                                  ["options"]
                                      .length, // The number of items in the list
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // This function is called for each item in the list
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.bordergrey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatainch[
                                                      "size"]
                                                      ["options"]
                                                      [index]["tag"],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                    left: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatainch[
                                                      "size"]
                                                      [
                                                      "options"]
                                                      [
                                                      index]["values"]
                                                      [1]["value"],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell test");
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      sizechatDatainch[
                                                      "size"]
                                                      [
                                                      "options"]
                                                      [
                                                      index]["values"]
                                                      [2]["value"],
                                                      style:
                                                      const TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            else if(state is SizeChartDataFailure){
              return Center(
                child: Container(
                  child: Text('Data not Found'),
                ),
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                child: Padding(
                  // padding: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Divider(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "",
                              style: FTextStyle.H1Headings15,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 38,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        RoundCheckBox(
                                          isChecked: iscecked1,
                                          checkedColor:
                                          AppColors.primaryColorpink,
                                          size: 15,
                                          onTap: (selected) {
                                            iscecked1 = selected!;
                                            iscecked2 = false;
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Size in cm",
                                            style:
                                            TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      iscecked = !iscecked;
                                      iscecked2 = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: width / 20),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    height: 38,
                                    width: 145,
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        RoundCheckBox(
                                          isChecked: iscecked2,
                                          checkedColor:
                                          AppColors.primaryColorpink,
                                          size: 15,
                                          onTap: (selected) {
                                            iscecked2 = selected!;
                                            iscecked1 = false;
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("Size in inches",
                                            style:
                                            TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      iscecked = !iscecked;
                                      iscecked1 = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          iscecked
                              ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.bordergrey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Size cm',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Chest',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Around Above Waist',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // This function is called for each item in the list
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.bordergrey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      "",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                    left: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      "",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell test");
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      "",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                              : Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.bordergrey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Size Inches',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          print("tap inkwell");
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        child: Container(
                                          color: AppColors.bordergrey,
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Chest',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'SourceSansPro',
                                                  color: AppColors
                                                      .Textcolorheading,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          print("tap inkwell");
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: AppColors.bordergrey,
                                        padding:
                                        const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Around Above Waist',
                                              style: TextStyle(
                                                fontFamily:
                                                'SourceSansPro',
                                                color: AppColors
                                                    .Textcolorheading,
                                                fontWeight:
                                                FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                  1, // The number of items in the list
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // This function is called for each item in the list
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.bordergrey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                    left: BorderSide(
                                                        width: 1.0,
                                                        color: AppColors
                                                            .bordergrey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      " ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell test");
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(
                                                    10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: const [
                                                    Text(
                                                      "",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'SourceSansPro',
                                                        color: AppColors
                                                            .Textcolorheading,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                print("tap inkwell");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
