import 'package:flutter/material.dart';
import 'package:utsav/screens/Account/NewsLetterSubscription.dart';
import 'package:utsav/screens/Account/editAccountInfo.dart';
import 'package:utsav/screens/AddressBook/AddNewAddress.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class AccountDashBoard extends StatefulWidget {
  const AccountDashBoard({Key? key}) : super(key: key);

  @override
  State<AccountDashBoard> createState() => _AccountDashBoardState();
}

class _AccountDashBoardState extends State<AccountDashBoard> {
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: NWidgets.kappbarheading(context, "MY DASHBOARD"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hello, Umair Siddiqui",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome to your personal account on Utsav Fashion. This is a single point window that will help you track your journey with us across orders, wishlisted items, gift cards, deliveries and much more. Don't be a stranger and update your personal details to receive exclusive deals and offers.",
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
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ACCOUNT INFORMATION",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Contact Information',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.underlineTextcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditAccountInfo()));
                            },
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Umair Siddiqui",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "de-umair@mobiloitte.com",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "9936595085",
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
                      InkWell(
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.underlineTextcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditAccountInfo()));
                        },
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Newsletters',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.underlineTextcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NewLetterSubscription()));
                              // const AddNewAddress()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You don't subscribe to our newsletter.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Address Book',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          // const EditAccountInfo()));
                                          const AddNewAddress()));
                            },
                            child: const Text(
                              'Manage Address',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                color: AppColors.underlineTextcolorheading,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
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
                        child: Text(
                          "Default Billing Address".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You have not set a default billing address.",
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Default shipping Address".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You have not set a default shipping address.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
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
