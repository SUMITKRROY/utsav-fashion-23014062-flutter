import 'package:flutter/material.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreAboutUs.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreContactUs.dart';
import 'package:utsav/screens/Explore_more/ExploreMorePayment.dart';
import 'package:utsav/screens/Explore_more/Testimmonials.dart';
import 'package:utsav/screens/Explore_more/trackYourOrder.dart';
import 'package:utsav/screens/Home/returnScreen.dart';
import 'package:utsav/screens/Home/shipping.dart';
 import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ExploreMoreAccount extends StatefulWidget {
  const ExploreMoreAccount({Key? key}) : super(key: key);

  @override
  State<ExploreMoreAccount> createState() => _ExploreMoreAccountState();
}

class _ExploreMoreAccountState extends State<ExploreMoreAccount> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
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
            title: NWidgets.kappbarheading(context,"Explore More")

        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ExpansionTile(
                    leading: Image.asset(
                      "images/accountIcon/Explore.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Explore",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      // Add your list items here
                      // For example:
                      Divider(
                        height: height * 0.010,
                      ),
                      ListTile(
                        title: InkWell(
                          child: const Text('About Us',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExploreMoreAboutUs()));
                          },
                        ),
                      ),

                      Divider(
                        height: height * 0.010,
                      ),
                      const ListTile(
                        title: Text('Utsavpedia',
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400)),
                      ),
                      Divider(
                        height: height * 0.010,
                      ),

                      ListTile(
                        title: InkWell(
                          child: const Text('Testimonials',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Testimonials()));
                          },
                        ),
                      ),
                    ],
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded = value;
                      });
                    },
                  ),


                  ExpansionTile(
                    leading: Image.asset(
                      "images/accountIcon/H&S.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: Icon(
                      isExpanded1
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Help & Support",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      // Add your list items here
                      // For example:
                      Divider(
                        height: height * 0.010,
                      ),
                      const ListTile(
                        title: Text('FAQ’s',
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400)),
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      InkWell(
                        child: const ListTile(
                          title: Text('Track Order',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TrackYourOrder()));
                        },
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      InkWell(
                        child: const ListTile(
                          title: Text('Contact Us',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                        ExploreMoreContactUS(heding: 'contact Us',)));
                        },
                      ),
                    ],
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded1 = value;
                      });
                    },
                  ),

                  ExpansionTile(
                    leading: Image.asset(
                      "images/accountIcon/i.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: Icon(
                      isExpanded2
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Useful Info",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                    children: <Widget>[
                      // Add your list items here
                      // For example:
                      Divider(
                        height: height * 0.010,
                      ),
                      InkWell(
                        child: const ListTile(
                          title: Text('Payments',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ExploreMorePayment()));
                        },
                      ),

                      // Divider(
                      //   height: height * 0.010,
                      // ),
                      //
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => SelectAddress()));
                      //   },
                      //   title: const Text('Payments',
                      //       style: TextStyle(
                      //           fontFamily: 'NotoSans',
                      //           fontSize: 12,
                      //           color: AppColors.Textcolorheading,
                      //           fontWeight: FontWeight.w400)),
                      // ),
                      Divider(
                        height: height * 0.010,
                      ),
                      InkWell(
                        child: const ListTile(
                          title: Text('Shipping',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const Shipping()));
                        },
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const ReturnsScreen()));
                        },
                        child: const ListTile(
                          title: Text('Returns',
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded2 = value;
                      });
                    },
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
