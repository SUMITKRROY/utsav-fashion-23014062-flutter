import 'dart:core';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Amzonpay/providers/payment_provider.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Amzonpay/views/payment_screen.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Paypal/paypalpay.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Paytm/paytmScreen.dart';
import 'package:utsav/screens/Payment/PaymentGateways/ccAvenue/ccAvenuePayment.dart';
import 'package:utsav/screens/Payment/thankYou.dart';
import 'package:utsav/screens/welcome/welcome_screen.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';
import '../../../utils/utils.dart';
import '../../ShoppingBag/viewDetails.dart';
import 'dart:developer' as developer;

class BillingAddressSelected extends StatefulWidget {
  const BillingAddressSelected({Key? key}) : super(key: key);

  @override
  State<BillingAddressSelected> createState() => _BillingAddressSelectedState();
}

class _BillingAddressSelectedState extends State<BillingAddressSelected> {
  var dio = Dio();

  TextEditingController _Fname = TextEditingController();
  TextEditingController _Lname = TextEditingController();
  TextEditingController _Mob = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _postcode = TextEditingController();
  TextEditingController _country_id = TextEditingController();
  Map<String, Map<String, dynamic>> addBillingAddressdata = {};

  addBillingAddress(addBillingAddressdata) async {
    print(
        "Add billing add:-${AppUrl.carts_cartId_billing}${Utils.usercartkey}/billing-address");
    print("Add billing add:-${addBillingAddressdata}");
    Response response = await dio.post(
      "${AppUrl.carts_cartId_billing}${Utils.usercartkey}/billing-address",
      options: Options(headers: {"Content-Type": "application/json"}),
      data: addBillingAddressdata,
    );
    if (response.statusCode == 200) {
      print("RespBybilling:-${response.data}");
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  bool passwordVisible = false;
  bool isChecked = false;
  var AmazonPay = true;
  var paytm = true;
  var ccavenue = true;
  // var select = false;
  var selectpaypal = true;
  var type2 = 'Choose State...';
  List<String> stateListData = [];

  var type = '';

  @override
  void initState() {
    super.initState();
    passwordVisible = true;

    print(
        "Utils.StateList[0]['available_regions']===${Utils.StateList[0]['available_regions'].length}");
    print(
        "Utils.StateList[0]['available_regions'].length${Utils.StateList[0]['available_regions'].length}");
    for (int i = 0; i < Utils.StateList[0]['available_regions'].length; i++) {
      setState(() {
        stateListData
            .add(Utils.StateList[0]['available_regions'][i]['name'].toString());
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    print("stateListData===$stateListData");
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
          title: Text(
            "Select a payment method".toUpperCase(),
            style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16,
                color: AppColors.Textcolorheading,
                fontWeight: FontWeight.w500),
          ),
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Secure Checkout",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 18,
                          color: AppColors.Textcolorheading,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  (Utils.checkLogin == true)
                      ? Column(
                          children: [
                            SizedBox(
                              height: height * 0.010,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome, Umair Siddiqui",
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
                                "SHIPPING ADDRESS",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 14,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
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
                            Divider(
                              height: height * 0.010,
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Already Registered?",
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        color: AppColors.Textcolorheading,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: height * 0.033,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      child: const Text(
                                        'Log In',
                                        style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 16,
                                            color: AppColors
                                                .underlineTextcolorheading,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WelcomeScreen()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                  NWidgets.ksizedBox(context),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "SHIPPING ADDRESS".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      SizedBox(height: height * 0.010),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "First Name",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _Fname,
                              decoration: const InputDecoration(
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Field';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Last Name",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _Lname,
                              decoration: const InputDecoration(
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Field';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Mobile Number",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _Mob,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: ' ',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid Mobile Number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Email Address",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Example@gmail.com',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                } else if (EmailValidator.validate(value) ==
                                    false) {
                                  return 'Invalid email address.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Address",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _street,
                              decoration: const InputDecoration(
                                hintText: ' ',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Field';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "City",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _city,
                              decoration: const InputDecoration(
                                hintText: ' ',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required Field';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "State/Province",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                developer
                                    .log("States List :-${Utils.StateList}");
                                print(Utils.StateList[0]["available_regions"]);
                                print(Utils.StateList[0]["available_regions"][0]
                                    ["name"]);
                                ShowStates();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      // width: 1.0,
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.all(5),
                                child: DropdownButtonFormField<String>(
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  /*decoration: const InputDecoration(
                                    isDense: true, // Added this
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                  ),*/

                                  value: type,
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  iconSize: 20,
                                  style: FTextStyle.assetstypeStyle,
                                  items: [],
                                  onChanged: (salutation) {
                                    setState(() {
                                      type = salutation!;
                                    });
                                  },
                                  /* items: stateListData.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (salutation) {
                                    setState(() {
                                      type = salutation!;
                                    });
                                  },
                                  //value: dropdownProject,
                                  validator: (value) =>
                                      value == null ? 'field required' : null,*/
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Zip/Postal Code",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _postcode,
                              decoration: const InputDecoration(
                                hintText: ' ',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Country",
                                    style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                                border: Border(
                                  bottom: BorderSide(
                                    //                   <--- left side
                                    color: Colors.grey,
                                    // width: 1.0,s
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              child: DropdownButtonFormField<String>(
                                icon: const Icon(Icons.keyboard_arrow_down),
                                decoration: const InputDecoration(
                                  isDense: true, // Added this
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                ),

                                value: type,
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                iconSize: 20,
                                style: FTextStyle.assetstypeStyle,
                                items: [
                                  '',
                                  'INDIA'.toUpperCase(),
                                  'United States'.toUpperCase(),
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (salutation) {
                                  setState(() {
                                    type = salutation!;
                                  });
                                },
                                //value: dropdownProject,
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Form(
                      //   key: formKey,
                      //   child: Column(
                      //     children: [
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "First Name",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         controller: _Fname,
                      //         decoration: const InputDecoration(
                      //           hintText: 'Umair',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Invalid email address';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "Last Name",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         controller: _Lname,
                      //         decoration: const InputDecoration(
                      //           hintText: 'Siddiqui',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Required Field';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "Mobile Number",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         controller: _Mob,
                      //         decoration: const InputDecoration(
                      //           hintText: ' ',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Required Field';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "Address",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         controller: _street,
                      //         decoration: const InputDecoration(
                      //           hintText: ' ',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Required Field';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "City",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         decoration: const InputDecoration(
                      //           hintText: ' ',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Invalid email address';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "State/Province",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //           decoration: const BoxDecoration(
                      //             // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                      //             border: Border(
                      //               bottom: BorderSide(
                      //                 color: Colors.grey,
                      //                 // width: 1.0,
                      //               ),
                      //             ),
                      //           ),
                      //           width: MediaQuery.of(context).size.width,
                      //           height: 50,
                      //           padding: const EdgeInsets.all(5),
                      //           child: InkWell(
                      //               onTap: () {
                      //                 ShowStates();
                      //               },
                      //               child: Icon(Icons.keyboard_arrow_down))
                      //
                      //           // DropdownButtonFormField<String>(
                      //           //   icon: const Icon(Icons.keyboard_arrow_down),
                      //           //   decoration: const InputDecoration(
                      //           //     isDense: true, // Added this
                      //           //     border: UnderlineInputBorder(
                      //           //         borderSide:
                      //           //             BorderSide(color: Colors.black)),
                      //           //     contentPadding: EdgeInsets.symmetric(
                      //           //         horizontal: 15, vertical: 7),
                      //           //     focusedBorder: InputBorder.none,
                      //           //     enabledBorder: InputBorder.none,
                      //           //     errorBorder: InputBorder.none,
                      //           //   ),
                      //           //
                      //           //   value: type,
                      //           //   dropdownColor: Colors.white,
                      //           //   isExpanded: true,
                      //           //   iconSize: 20,
                      //           //   style: FTextStyle.assetstypeStyle,
                      //           //
                      //           //   items: [
                      //           //     '',
                      //           //     'DELHI',
                      //           //     'UTTAR PRADESH',
                      //           //   ].map<DropdownMenuItem<String>>((String value) {
                      //           //     return DropdownMenuItem<String>(
                      //           //       value: value,
                      //           //       child: Text(value),
                      //           //     );
                      //           //   }).toList(),
                      //           //   onChanged: (salutation) {
                      //           //     setState(() {
                      //           //       type = salutation!;
                      //           //     });
                      //           //   },
                      //           //   //value: dropdownProject,
                      //           //   validator: (value) =>
                      //           //       value == null ? 'field required' : null,
                      //           // ),
                      //           ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "Zip/Postal Code",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         decoration: const InputDecoration(
                      //           hintText: ' ',
                      //           hintStyle: FTextStyle.formfieldhintStyle,
                      //         ),
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Invalid email address';
                      //           }
                      //           return null;
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "Country",
                      //               style: FTextStyle.formfieldHeadingText,
                      //             ),
                      //             Text(
                      //               "*",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Container(
                      //         decoration: const BoxDecoration(
                      //           // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                      //           border: Border(
                      //             bottom: BorderSide(
                      //               //                   <--- left side
                      //               color: Colors.grey,
                      //               // width: 1.0,
                      //             ),
                      //           ),
                      //         ),
                      //         width: MediaQuery.of(context).size.width,
                      //         height: 50,
                      //         padding: const EdgeInsets.all(5),
                      //         child: DropdownButtonFormField<String>(
                      //           icon: const Icon(Icons.keyboard_arrow_down),
                      //           decoration: const InputDecoration(
                      //             isDense: true, // Added this
                      //             border: UnderlineInputBorder(
                      //                 borderSide:
                      //                     BorderSide(color: Colors.black)),
                      //             contentPadding: EdgeInsets.symmetric(
                      //                 horizontal: 15, vertical: 7),
                      //             focusedBorder: InputBorder.none,
                      //             enabledBorder: InputBorder.none,
                      //             errorBorder: InputBorder.none,
                      //           ),
                      //
                      //           value: type,
                      //           dropdownColor: Colors.white,
                      //           isExpanded: true,
                      //           iconSize: 20,
                      //           style: FTextStyle.assetstypeStyle,
                      //
                      //           items: [
                      //             '',
                      //             'INDIA'.toUpperCase(),
                      //             'United States'.toUpperCase(),
                      //           ].map<DropdownMenuItem<String>>((String value) {
                      //             return DropdownMenuItem<String>(
                      //               value: value,
                      //               child: Text(value),
                      //             );
                      //           }).toList(),
                      //           onChanged: (salutation) {
                      //             setState(() {
                      //               type = salutation!;
                      //             });
                      //           },
                      //           //value: dropdownProject,
                      //           validator: (value) =>
                      //               value == null ? 'field required' : null,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(
                        height: height * 0.020,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: width * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My billing and shipping address are the same",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  _isChecked
                      ? const SizedBox()
                      : Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "BILLING ADDRESS",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 18,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                            SizedBox(height: height * 0.010),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "First Name",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Umair',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Last Name",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Siddiqui',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Mobile Number",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: ' ',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Address",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: ' ',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "City",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: ' ',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "State/Province",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          // width: 1.0,
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                        onTap: () {
                                          ShowStates();
                                        },
                                        child: const Icon(
                                            Icons.keyboard_arrow_down)),

                                    // DropdownButtonFormField<String>(
                                    //   icon:
                                    //       const Icon(Icons.keyboard_arrow_down),
                                    //   decoration: const InputDecoration(
                                    //     isDense: true, // Added this
                                    //     border: UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             color: Colors.black)),
                                    //     contentPadding: EdgeInsets.symmetric(
                                    //         horizontal: 15, vertical: 7),
                                    //     focusedBorder: InputBorder.none,
                                    //     enabledBorder: InputBorder.none,
                                    //     errorBorder: InputBorder.none,
                                    //   ),
                                    //
                                    //   value: type,
                                    //   dropdownColor: Colors.white,
                                    //   isExpanded: true,
                                    //   iconSize: 20,
                                    //   style: FTextStyle.assetstypeStyle,
                                    //
                                    //   items: [
                                    //     '',
                                    //     'DELHI',
                                    //     'UTTAR PRADESH',
                                    //   ].map<DropdownMenuItem<String>>(
                                    //       (String value) {
                                    //     return DropdownMenuItem<String>(
                                    //       value: value,
                                    //       child: Text(value),
                                    //     );
                                    //   }).toList(),
                                    //   onChanged: (salutation) {
                                    //     setState(() {
                                    //       type = salutation!;
                                    //     });
                                    //   },
                                    //   //value: dropdownProject,
                                    //   validator: (value) => value == null
                                    //       ? 'field required'
                                    //       : null,
                                    // ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Zip/Postal Code",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: ' ',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Country",
                                          style:
                                              FTextStyle.formfieldHeadingText,
                                        ),
                                        Text(
                                          "*",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                                      border: Border(
                                        bottom: BorderSide(
                                          //                   <--- left side
                                          color: Colors.grey,
                                          // width: 1.0,
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: const EdgeInsets.all(5),
                                    child: const SizedBox(
                                      height: 0,
                                    ),
                                    // DropdownButtonFormField<String>(
                                    //   icon:
                                    //       const Icon(Icons.keyboard_arrow_down),
                                    //   decoration: const InputDecoration(
                                    //     isDense: true, // Added this
                                    //     border: UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             color: Colors.black)),
                                    //     contentPadding: EdgeInsets.symmetric(
                                    //         horizontal: 15, vertical: 7),
                                    //     focusedBorder: InputBorder.none,
                                    //     enabledBorder: InputBorder.none,
                                    //     errorBorder: InputBorder.none,
                                    //   ),
                                    //
                                    //   value: type,
                                    //   dropdownColor: Colors.white,
                                    //   isExpanded: true,
                                    //   iconSize: 20,
                                    //   style: FTextStyle.assetstypeStyle,
                                    //
                                    //   items: stateListData.map<DropdownMenuItem<String>>(
                                    //       (String value) {
                                    //     return DropdownMenuItem<String>(
                                    //       value: value,
                                    //       child: Text(value),
                                    //     );
                                    //   }).toList(),
                                    //   onChanged: (salutation) {
                                    //     setState(() {
                                    //       type = salutation!;
                                    //     });
                                    //   },
                                    //   //value: dropdownProject,
                                    //   validator: (value) => value == null
                                    //       ? 'field required'
                                    //       : null,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                  Divider(
                    height: height * 0.010,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            AmazonPay = !AmazonPay;
                            paytm = true;
                            selectpaypal = true;
                            ccavenue = true;
                          });
                        },
                        child: Row(
                          children: [
                            AmazonPay
                                ? const Icon(Icons.radio_button_off)
                                : const Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.primaryColorpink,
                                  ),
                            SizedBox(
                              width: width * 0.010,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/payment/amazon.png",
                                  height: 33,
                                  width: 92,
                                  // color: Colors.grey,
                                ),
                                const Text(
                                  "Get flat Rs.150 Cashback/T&C Apply",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans',
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            paytm = !paytm;
                            selectpaypal = true;
                            AmazonPay = true;
                            ccavenue = true;
                          });
                        },
                        child: Row(
                          children: [
                            paytm
                                ? const Icon(Icons.radio_button_off)
                                : const Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.primaryColorpink,
                                  ),
                            SizedBox(
                              width: width * 0.020,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Paytm",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                                Image.asset(
                                  "images/payment/paytm.png",
                                  height: 33,
                                  width: 140,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            ccavenue = !ccavenue;
                            AmazonPay = true;
                            paytm = true;
                            selectpaypal = true;
                          });
                        },
                        child: Row(
                          children: [
                            ccavenue
                                ? const Icon(Icons.radio_button_off)
                                : const Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.primaryColorpink,
                                  ),
                            SizedBox(
                              width: width * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "CCAvenue",
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
                        height: height * 0.010,
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectpaypal = !selectpaypal;
                            ccavenue = true;
                            AmazonPay = true;
                            paytm = true;
                          });
                        },
                        child: Row(
                          children: [
                            selectpaypal
                                ? const Icon(Icons.radio_button_off)
                                : const Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.primaryColorpink,
                                  ),
                            SizedBox(
                              width: width * 0.020,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Paypal",
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
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 1,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            // '',
                            '${Utils.currencySymbol + Utils.viewTotalModel!['grand_total'].toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              color: AppColors.Textcolorheading,
                              // decoration: TextDecoration.lineThrough,
                            ),
                          )),
                      InkWell(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text.rich(
                            TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${Utils.viewTotalModel!['items_qty'].toString()} Items',
                                  style: const TextStyle(
                                    color: AppColors.Textcolorheading,
                                    fontSize: 14,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const TextSpan(
                                  text: '          View Details',
                                  style: TextStyle(
                                    color: Color(0xFF2C8FEB),

                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewDetails(
                                        viewTotalModel: Utils.viewTotalModel,
                                      )));
                        },
                      ),
                      // Align(
                      //     alignment: Alignment.centerLeft,
                      //     child: Text("(Inclusive of all taxes)",
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //         ))),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox(
                    height: 56,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {
                        if (AmazonPay == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChangeNotifierProvider(
                                        create: (context) => PaymentProvider(),
                                        child: const PaymentScreen(),
                                      )));
                        }
                        if (selectpaypal == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaypalPay()));
                        }
                        if (ccavenue == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CcAvenuePaymentScreen()));
                          // CCAvenuePayment(merchantId: '2', accessCode: '4YRUXLSRO20O8NIH', orderId: '519', amount: '10', workingKey: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp',)));
                        }
                        if (paytm == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaytmScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //              MyApp()));
                        }

                        addBillingAddressdata = {
                          "address": {
                            "region": "Andaman and Nicobar Islands",
                            "region_id": 569,
                            "region_code": "AN",
                            "country_id": "IN",
                            "street": [_street.text],
                            "postcode": _postcode.text,
                            "city": _city.text,
                            "firstname": _Fname.text,
                            "lastname": _Lname.text,
                            "email": "johndoe@example.com",
                            "telephone": _Mob.text,
                            "company": "Utsav Fashion"
                          },
                          // "useForShipping": true,
                        };

                        if (formKey.currentState!.validate()) {
                          addBillingAddress(addBillingAddressdata);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThankYou()));
                          // getBillingAddress();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColorpink, // background
                      ),
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  ShowStates() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            child: SizedBox(
              height: height / 1.8,
              width: 200,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    // width: width ,
                    color: AppColors.primaryColorpink,
                    child: Row(
                      children: [
                        const Text(
                          '   Choose State',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: InkWell(
                            child: Image.asset(
                              "images/ccrossIcon.png",
                              height: 22,
                              width: 22,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: height / 2,
                      // width: width,
                      child: ListView.builder(
                        // itemCount: size.length,
                        itemCount: Utils
                            .StateList[0]["available_regions"][0]["name"]
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    type2 =
                                        "${Utils.StateList[0]["available_regions"][index]["name"]}";
                                  });

                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${Utils.StateList[0]["available_regions"][index]["name"]}",
                                    style: FTextStyle.H1Headings,
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
