import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/Account/accountDashboard.dart';
import 'package:utsav/screens/AddressBook/AddressBook.dart';
import 'package:utsav/screens/Measurement/Mymeasurement.dart';
import 'package:utsav/screens/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:utsav/screens/StoreCredit/StoreCredit.dart';
import 'package:utsav/screens/TermAndCondition/TermAndCondition.dart';
import 'package:utsav/screens/Welcome/welcome_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isExpanded = false;
  List<String> images2 = [
    "images/whishListGridImg/lady1.png",
    "images/whishListGridImg/lady2.png",
    "images/whishListGridImg/lady1.png",
    "images/whishListGridImg/lady2.png",
  ];


  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(100),
                        color: AppColors.primaryColorpink,
                        strokeWidth: 1,
                        dashPattern: const [10, 3],
                        child: InkWell(
                          onTap: () {
                            // handle onTap event
                          },
                          child: SizedBox(
                            width: height * 0.110,
                            height: height * 0.110,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              child: const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    const Text(
                      "Umair Siddiqui",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                    const Text(
                      "de-umair@mobiloitte.com",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 14,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/man.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Account Dashboard",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountDashBoard()));
                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/mesu.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "My Measurements",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyMeasurement()));
                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/sc.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Store Credit",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoreCredit()));


                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/dir.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Address Book",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddressBook()));
                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/pp.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()));
                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                InkWell(
                  child: ListTile(
                    leading: Image.asset(
                      "images/accountIcon/t&c.png",
                      height: 20,
                      width: 20,
                      // color: Colors.grey,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      "Terms and Conditions",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 15,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermAndCondition()));
                  },
                ),
                Divider(
                  height: height * 0.010,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: height * 0.067,
                  width: width * 362,
                  child: ElevatedButton(
                    onPressed: () {
                      // (Route<dynamic> route) => false);
                      //
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                              (Route<dynamic> route) => false
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColorpink, // background
                    ),
                    child:Text(
                      Utils.checkLogin==true?"Logout":"Login",
                      style: const TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 18,
                          color: AppColors.buttongrey,
                          fontWeight: FontWeight.w700),
                    ),
                    // icon: const Icon(
                    //   Icons.arrow_back,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
