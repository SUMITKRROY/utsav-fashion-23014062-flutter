import 'package:flutter/material.dart';
import 'package:utsav/screens/Payment/SelectAddress/selectAdress.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';


class CustomPayment extends StatefulWidget {
  const CustomPayment({Key? key}) : super(key: key);

  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
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
          title: NWidgets.kappbarheading(context, "CUSTOM Payment"),

          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/welcome_icon.png",
                height: 33,
                width: 36,
                // color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: width,
                height: height/4,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFEFC03E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/shoppingbag/custompay.png",
                      height: 50,
                      width: 50,
                      // color: Colors.grey,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Custom Payment".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.020),
            const Align(
              // alignment: Alignment.centerLeft,
              child: Text(
                "Store Credit Value in INR",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 16,
                    color: AppColors.Textcolorheading,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 30,),


            Padding(
              padding:   EdgeInsets.fromLTRB(20,0,20,0),
              child: Column(
                children: [
                  Row(

                    children: [
                      Text(
                        "Minimum:${Utils.currencySymbol}1.00",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "Maximum:${Utils.currencySymbol}100,000.00",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  const SizedBox(
                    // width: 220,
                    height: 40,
                    child: TextField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: ElevatedButton(
                      child: Text(
                        "ADD TO SHOPPING BAG",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SelectAddress()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColorpink, // background
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Expanded(
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       hintText: '',
            //     ),
            //   ),
            // ),




          ],
        ),

      ),
    );
  }
}
