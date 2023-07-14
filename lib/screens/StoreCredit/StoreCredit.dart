import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';


class StoreCredit extends StatefulWidget {
  const StoreCredit({Key? key}) : super(key: key);

  @override
  State<StoreCredit> createState() => _StoreCreditState();
}

class _StoreCreditState extends State<StoreCredit> {
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
          title: NWidgets.kappbarheading(context, "STORE CREDIT"),
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
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 16,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            const Divider(
                              height: 10,
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                              Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Your current balance is:${Utils.currencySymbol}0.00",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
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
