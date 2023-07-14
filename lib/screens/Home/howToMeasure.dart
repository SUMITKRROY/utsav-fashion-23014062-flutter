import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import '../../utils/widgets.dart';
import 'dart:developer' as developer;

class HowToMeasure extends StatefulWidget {
  const HowToMeasure({Key? key}) : super(key: key);

  @override
  State<HowToMeasure> createState() => _HowToMeasureState();
}



class _HowToMeasureState extends State<HowToMeasure> {
  Map<String, dynamic> MeasurementWomenjsonData ={};

  @override
  void initState() {
     MeasurementWomenjsonData = json.decode(Utils.MeasurementWomen);
    developer.log("MeasurementWomenjsonData:-${MeasurementWomenjsonData}");
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
          title: Text(
            "How to Measure Saree Blouse".toUpperCase(),
            style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16,
                color: AppColors.Textcolorheading,
                fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/ccrossIcon.png",
                height: 22,
                width: 22,
                // color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            // padding: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, bottom: 30, top: 0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.cyan,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          MeasurementWomenjsonData["mes_img"],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    MeasurementWomenjsonData["heading_text"],
                    style: FTextStyle.H1Headings15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MeasurementWomenjsonData["subheading_text"]
                        .length, // The number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      // This function is called for each item in the list
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              child: Text(
                                '${index+1}.${MeasurementWomenjsonData["subheading_text"][index]}',
                                style: FTextStyle.paragrphStyle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),



                Container(
                  height: 250,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MeasurementWomenjsonData["mes_data"]
                        .length, // The number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      // This function is called for each item in the list
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text.rich(
                              TextSpan(
                                text: MeasurementWomenjsonData["mes_data"][index]
                                ["title"],
                                style: FTextStyle.H1Headings15,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: MeasurementWomenjsonData["mes_data"]
                                    [index]["message_text"],
                                    style: FTextStyle.paragrphStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     MeasurementWomenjsonData["list"][0]["title"],
                //     style: FTextStyle.H1Headings15,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   child: SizedBox(
                //     child: Text(
                //       MeasurementWomenjsonData["list"][0]["message_text"],
                //       style: FTextStyle.paragrphStyle,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                //
                // Column(
                //   children: [
                //     Align(
                //       alignment: Alignment.bottomLeft,
                //       child: Text.rich(
                //         TextSpan(
                //           text: MeasurementWomenjsonData["list"][1]["title"],
                //           style: FTextStyle.H1Headings15,
                //           children: <TextSpan>[
                //             TextSpan(
                //               text: MeasurementWomenjsonData["list"][1]
                //                   ["message_text"],
                //               style: FTextStyle.paragrphStyle,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Text.rich(
                //     TextSpan(
                //       text: MeasurementWomenjsonData["list"][2]["title"],
                //       style: FTextStyle.H1Headings15,
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: MeasurementWomenjsonData["list"][2]
                //               ["message_text"],
                //           style: FTextStyle.paragrphStyle,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Text.rich(
                //     TextSpan(
                //       text: MeasurementWomenjsonData["list"][3]["title"],
                //       style: FTextStyle.H1Headings15,
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: MeasurementWomenjsonData["list"][3]
                //               ["message_text"],
                //           style: FTextStyle.paragrphStyle,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Text.rich(
                //     TextSpan(
                //       text: MeasurementWomenjsonData["list"][4]["title"],
                //       style: FTextStyle.H1Headings15,
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: MeasurementWomenjsonData["list"][4]
                //               ["message_text"],
                //           style: FTextStyle.paragrphStyle,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: Text.rich(
                //     TextSpan(
                //       text: MeasurementWomenjsonData["list"][5]["title"],
                //       style: FTextStyle.H1Headings15,
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: MeasurementWomenjsonData["list"][5]
                //               ["message_text"],
                //           style: FTextStyle.paragrphStyle,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
