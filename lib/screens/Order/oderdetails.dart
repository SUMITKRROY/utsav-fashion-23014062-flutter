import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';



class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  MediaQuery(
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
            title: NWidgets.kappbarheading(context,"My order")

        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 250,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "ORDER #M120000014 - Payment Pending",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 20,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),

                          Image.asset("images/printer.png",height: 20,)
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(height:height*0.010 ,),
                      SizedBox(
                        height: height * 0.010,
                      ),


                      Row(
                        children: [
                          const Text(
                            'Order Date:',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: width*0.010,),

                          const Text(
                            'Oct 14, 2022',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              // color: AppColors.underlineTextcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: height * 0.020,
                      ),


                      Row(
                        children: const [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,

                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Shipping Method',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          // SizedBox(width: width*0.080,),

                        ],
                      ),
                      Divider(height:height*0.020 ,),



                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Umair Siddiqui",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Spacer(),

                              Text(
                                "Fixed",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "D-115",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Okhla Phase-1",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "NEW DELHI,DELHI, 110020",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "India",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone number: 9936595085",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: height * 0.010,
                      ),



                      Row(
                        children: const [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,

                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Shipping Method',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          // SizedBox(width: width*0.080,),

                        ],
                      ),

                      Divider(height: height*0.010,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Umair Siddiqui",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "D-115",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Okhla Phase-1",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "NEW DELHI,DELHI, 110020",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "India",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone number: 9936595085",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),

                          SizedBox(
                            height:  height*0.010,
                          ),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Items Ordered",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Divider(height: height*0.010,),
                          SizedBox(
                            height: 175,
                            width: width,
                            child: Card(
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/trendImg/trend.png',
                                    fit: BoxFit.cover,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Embroidered Chiffon Saree in Red",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 5,),
                                        const Text(
                                          "Status : Status Not Available",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 5,),
                                        const Text(
                                          "SKU : TUT868",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 5,),
                                        const Text(
                                          "Price : INR 1050.00",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Qty :  1",
                                              style: TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(width: 10,),
                                          ],
                                        ),
                                        const SizedBox(height: 5,),
                                        const Text(
                                          "Subtotal : INR 1050.00",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 5,),
                                        // SizedBox(height: 5,),
                                        const SizedBox(height: 5,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: height*0.010,),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Row(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Spacer(),

                          Text(
                            "INR 1050.00",
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 14,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Shipping & Handling",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Spacer(),

                          Text(
                            "INR 150.00",
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 14,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      Divider(height: height*0.010,),
                      SizedBox(
                        height: height * 0.010,
                      ),

                      Row(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Grand Total",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 16,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Spacer(),

                          Text(
                            "INR 1200.00",
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 16,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(height: height*0.010,),
                      SizedBox(
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
