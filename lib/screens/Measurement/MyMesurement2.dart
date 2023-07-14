import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'dart:ui';

import 'package:utsav/utils/widgets.dart';

class MyMesurementtwo extends StatefulWidget {
  const MyMesurementtwo({Key? key}) : super(key: key);

  @override
  State<MyMesurementtwo> createState() => _MyMesurementtwoState();
}

class _MyMesurementtwoState extends State<MyMesurementtwo> {
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
          title: NWidgets.kappbarheading(context, "MY MEASUREMENT"),

        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          // color: Colors.grey,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Measurement ID:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  // SizedBox(width: width*0.150,),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '9141030',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Name:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Umair',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Category:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Saree',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Used in Order:",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '16 May 2019',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Details:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        child: const Text(
                                          'View Details',
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            color: AppColors
                                                .underlineTextcolorheading,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                                child: Dialog(
                                                  child: SizedBox(
                                                    height: height / 2,
                                                    width: width,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          width: width,
                                                          color: AppColors
                                                              .primaryColorpink,
                                                          child: Row(
                                                            children: [
                                                              const Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                    8,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'SAREE',
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'SourceSansPro',
                                                                    color:
                                                                    AppColors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize: 16,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Padding(
                                                                padding: const EdgeInsets.fromLTRB(0,0,5,0),
                                                                child: InkWell(
                                                                  child: Image.asset(
                                                                    "images/ccrossIcon.png",
                                                                    height: 22,
                                                                    width: 22,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Container(
                                                          height: 40,
                                                          width: width,
                                                          color:
                                                          const Color(0xFFD9D9D9),
                                                          child: const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                8, 8, 0, 0),
                                                            child: Text(
                                                              'Blouse',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'SourceSansPro',
                                                                color: AppColors
                                                                    .Textcolorheading,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .fromLTRB(10,0,30,0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Bust:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '31 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Above Waist:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '23 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Blouse Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '15 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),

                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Classic Round',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Depth:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Back Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Bow Tie And Dori',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Half Sleeve',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Arm:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '10 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Closing Side:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'back',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Lining:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'yes',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          // color: Colors.grey,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Measurement ID :',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  // SizedBox(width: width*0.150,),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '9141030',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Name:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Umair',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Category:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Saree',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Used in Order:",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '16 May 2019',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Details:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        child: const Text(
                                          'View Details',
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            color: AppColors
                                                .underlineTextcolorheading,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                                child: Dialog(
                                                  child: SizedBox(
                                                    height: height / 2,
                                                    width: width,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          width: width,
                                                          color: AppColors
                                                              .primaryColorpink,
                                                          child: Row(
                                                            children: [
                                                              const Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                    8,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'SAREE',
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'SourceSansPro',
                                                                    color:
                                                                    AppColors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize: 16,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Padding(
                                                                padding: const EdgeInsets.fromLTRB(0,0,5,0),
                                                                child: InkWell(
                                                                  child: Image.asset(
                                                                    "images/ccrossIcon.png",
                                                                    height: 22,
                                                                    width: 22,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Container(
                                                          height: 40,
                                                          width: width,
                                                          color:
                                                          const Color(0xFFD9D9D9),
                                                          child: const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                8, 8, 0, 0),
                                                            child: Text(
                                                              'Blouse',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'SourceSansPro',
                                                                color: AppColors
                                                                    .Textcolorheading,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .fromLTRB(10,0,30,0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Bust:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '31 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Above Waist:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '23 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Blouse Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '15 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),

                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Classic Round',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Depth:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Back Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Bow Tie And Dori',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Half Sleeve',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Arm:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '10 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Closing Side:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'back',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Lining:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'yes',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          // color: Colors.grey,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Measurement ID :',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  // SizedBox(width: width*0.150,),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '9141030',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Name:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Umair',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Category:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Saree',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Used in Order:",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '16 May 2019',
                                        style: TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          // color: AppColors.underlineTextcolorheading,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Details:',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width / 4,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        child: const Text(
                                          'View Details',
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            color: AppColors
                                                .underlineTextcolorheading,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                                child: Dialog(
                                                  child: SizedBox(
                                                    height: height / 2,
                                                    width: width,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          width: width,
                                                          color: AppColors
                                                              .primaryColorpink,
                                                          child: Row(
                                                            children: [
                                                              const Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                    8,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'SAREE',
                                                                  style:
                                                                  TextStyle(
                                                                    fontFamily:
                                                                    'SourceSansPro',
                                                                    color:
                                                                    AppColors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize: 16,
                                                                  ),
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Padding(
                                                                padding: const EdgeInsets.fromLTRB(0,0,5,0),
                                                                child: InkWell(
                                                                  child: Image.asset(
                                                                    "images/ccrossIcon.png",
                                                                    height: 22,
                                                                    width: 22,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Container(
                                                          height: 40,
                                                          width: width,
                                                          color:
                                                          const Color(0xFFD9D9D9),
                                                          child: const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                8, 8, 0, 0),
                                                            child: Text(
                                                              'Blouse',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'SourceSansPro',
                                                                color: AppColors
                                                                    .Textcolorheading,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.010,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .fromLTRB(10,0,30,0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Bust:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '31 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Above Waist:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '23 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Blouse Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '15 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),

                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Classic Round',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Front Neck Depth:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Back Neck Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Bow Tie And Dori',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Style:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'Half Sleeve',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Sleeve Length:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '6 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Around Arm:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  // SizedBox(width: width*0.150,),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        '10 inch',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Closing Side:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'back',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'Lining:',
                                                                    style:
                                                                    TextStyle(
                                                                      fontFamily:
                                                                      'SourceSansPro',
                                                                      color: AppColors
                                                                          .Textcolorheading,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width:
                                                                    width / 4,
                                                                    child: const Align(
                                                                      alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                      child: Text(
                                                                        'yes',
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'SourceSansPro',
                                                                          // color: AppColors.underlineTextcolorheading,
                                                                          fontWeight:
                                                                          FontWeight.w400,
                                                                          fontSize:
                                                                          13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.010,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.020,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
