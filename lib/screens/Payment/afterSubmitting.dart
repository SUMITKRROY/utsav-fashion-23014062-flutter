import "package:flutter/material.dart";
import "package:utsav/utils/app_colors.dart";
import 'package:utsav/screens/NavScreen/navBarbottom.dart';



class AfterSubmitting extends StatefulWidget {
  const AfterSubmitting({Key? key}) : super(key: key);

  @override
  State<AfterSubmitting> createState() => _AfterSubmittingState();
}

class _AfterSubmittingState extends State<AfterSubmitting> {
  bool passwordVisible = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final formKey = GlobalKey<FormState>();


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
          // IconButton(
          //   onPressed: () {
          //
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          // ),
          // title: Text(
          //   "Select a payment method".toUpperCase(),
          //   style: TextStyle(
          //       fontFamily: 'NotoSans',
          //       fontSize: 16,
          //       color: AppColors.Textcolorheading,
          //       fontWeight: FontWeight.w500),
          // ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Image.asset(
          //       "images/welcome_icon.png",
          //       height: 33,
          //       width: 36,
          //       // color: Colors.grey,
          //     ),
          //     onPressed: () {},
          //   ),
          // ],
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
                        height: height * 0.030,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Thank You !",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 21,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.030,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your order number # is : MU3800000202",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 15,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.030,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "An order confirmation email containing all necessary details is already on its way to your inbox. Our customer care team will reach out to you in case they need any further details.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 15,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Instruction for Shipment saved succesfully",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  Divider(
                    height: height * 0.010,
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SizedBox(
                      height: 56,
                      width: width,
                      child: ElevatedButton(
                        onPressed: () {

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => const NavBarBottom(selectedIndex: 0)),
                                  (Route<dynamic> route) => false
                          );
                          // (Route<dynamic> route) => false);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColorpink, // background
                        ),
                        child: const Text(
                          "CONTINUE SHOPPING",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              // color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
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
