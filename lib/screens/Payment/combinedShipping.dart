import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:utsav/screens/Payment/afterSubmitting.dart';
import 'package:utsav/utils/app_colors.dart';

class CombinedShipping extends StatefulWidget {
  const CombinedShipping({Key? key}) : super(key: key);

  @override
  State<CombinedShipping> createState() => _CombinedShippingState();
}

class _CombinedShippingState extends State<CombinedShipping> {
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
                  Divider(
                    height: height * 0.010,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You must be aware that there could be customs duty impact for shipments to your country.",
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
                          "As there are multiple items in your order. instead of shipping the items as and when they are ready. we recommend shipping them all together or in groups 3 or 4 item to reduce the amount you would have to pay as duty charges. We request you to select your preference from the option given below:-",
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
                  Row(
                    children: [
                      RoundCheckBox(
                        checkedColor: AppColors.primaryColorpink,
                        size: 15,
                        onTap: (selected) {},
                      ),
                      SizedBox(
                        width: width * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Club Shippment (In case we may group and ship \nthe items irrespective of the time to ship)",
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
                  Row(
                    children: [
                      RoundCheckBox(
                        checkedColor: AppColors.primaryColorpink,
                        size: 15,
                        onTap: (selected) {},
                      ),
                      SizedBox(
                        width: width * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Portial Shippment (In case you want us to ship \nthe items as and when ready)",
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
                    height: height * 0.040,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SizedBox(
                      height: 56,
                      width: width,
                      child: ElevatedButton(
                        onPressed: () {
                          // (Route<dynamic> route) => false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AfterSubmitting()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColorpink, // background
                        ),
                        child: const Text(
                          "SUBMIT",
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
