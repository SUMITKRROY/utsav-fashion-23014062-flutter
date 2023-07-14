import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  bool isExpanded = false;
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
            title: NWidgets.kappbarheading(context,"Testimonials")
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Image.asset("images/appBarIcon/baner1love.png",
                      height: height * 0.260, width: width
                      // color: Colors.grey,
                      ),
                  Image.asset("images/appBarIcon/testi.png",
                      height: height * 0.260, width: width
                      // color: Colors.grey,
                      ),

                  SizedBox(
                    height: height * 0.020,
                  ),
                  Divider(
                    height: height * 0.010,
                  ),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What our customers say about us",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "I have bought a WOW piece of long necklace from Utsav that made my heart feel Utsav Ullas. WELL DONE!! The quality, looks, workmanship and price were great!! Greatly appreciate UTSAV'S longstanding commitments towards showcasing nice products and extending excellent customer service. Continue with your great business ethics and spread WOW expression in the buyer's face!! Jan 24, 2023.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 14,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
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
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They answered my questions quickly and delivered faster than I expected. Jan 22, 2023.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Phane United States",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They answered my questions quickly and delivered faster than I expected. Jan 22, 2023.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Phane United States",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They answered my questions quickly and delivered faster than I expected. Jan 22, 2023.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Phane United States",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They answered my questions quickly and delivered faster than I expected. Jan 22, 2023.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Phane United States",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They answered my questions quickly and delivered faster than I expected. Jan 22, 2023.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Phane United States",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.010,
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                        child: const Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.010,
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.010,
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                        child: const Center(
                          child: Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.020,
                      ),
                      Container(
                        height: height * 0.030,
                        width: 60,
                        // color: Color(0xFFF5F5F5),
                        // margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text('Next',
                                        style: TextStyle(
                                          color:
                                              AppColors.Textcolorheadingblack,
                                          fontSize: 12,
                                          fontFamily: "SourceSansPro",
                                          fontWeight: FontWeight.w400,
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
