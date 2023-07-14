import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
 import 'package:utsav/screens/ShoppingBag/viewDetails.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';

import '../NavScreen/navBarbottom.dart';
import 'SelectAddress/billingAddressSelected.dart';


class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  var dio = Dio();
  bool passwordVisible = false;
  bool isChecked = false;
  var type = '';
  var selection = true;
  var selection1 = true;
  var selection2 = true;
  var select = true;
  var type2 = 'Choose State...';
  Map<String, Map<String, dynamic>> addBillingAddressdata = {};

  Future refresh() async {
    setState(() {
      getBillingAddress();

    });
  }

  @override
  void initState() {
    super.initState();
    getBillingAddress();
    passwordVisible = true;
  }

  getBillingAddress() async {
    print("Get billing add:-${AppUrl.carts_cartId_billing}${Utils.usercartkey}/billing-address");

    Response response = await dio.get("${AppUrl.carts_cartId_billing}${Utils.usercartkey}/billing-address",
    );
    if (response.statusCode == 200) {
      Utils.BillingData = response.data;
      print("Get billing add::-${response.data}");
      print("Get billing add Utils.BillingData::-${Utils.BillingData}");
      print(Utils.BillingData);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  final formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  TextEditingController _Fname = TextEditingController();
  TextEditingController _Lname = TextEditingController();
  TextEditingController _Mob = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _postcode = TextEditingController();
  TextEditingController _country_id = TextEditingController();

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavBarBottom(
                          selectedIndex: 0,
                        )));
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SHIPPING ADDRESS",
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
                    Column(
                      children: [
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
                                  print(Utils.StateList[0]["available_regions"]);
                                  print(Utils.StateList[0]["available_regions"][0]
                                  ["name"]);
                                  // ShowStates();
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
                                    child: const Icon(Icons.arrow_drop_down_sharp)

                                  // DropdownButtonFormField<String>(
                                  //   icon: const Icon(Icons.keyboard_arrow_down),
                                  //   decoration: const InputDecoration(
                                  //     isDense: true, // Added this
                                  //     border: UnderlineInputBorder(
                                  //         borderSide:
                                  //             BorderSide(color: Colors.black)),
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
                                  //   ].map<DropdownMenuItem<String>>((String value) {
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
                                  //   validator: (value) =>
                                  //       value == null ? 'field required' : null,
                                  // ),
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
                                      // width: 1.0,
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
                        SizedBox(
                          height: height * 0.020,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
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
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '₹6,500.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              color: AppColors.Textcolorheading,
                              // decoration: TextDecoration.lineThrough,
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewDetails(
                                    viewTotalModel: {},
                                  )));
                        },
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text.rich(
                            TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                  text: '2 Items',
                                  style: TextStyle(
                                    color: AppColors.Textcolorheading,
                                    fontSize: 14,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '       View Details',
                                  style: TextStyle(
                                    color: Color(0xFF2C8FEB),

                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                        addBillingAddressdata = {
                          "address": {
                            "region": "California",
                            "region_id": 15,
                            "region_code": "CA",
                            "country_id": "US",
                            "street": [_street.text],
                            "postcode": _postcode.text,
                            "city": _city.text,
                            "firstname": _Fname.text,
                            "lastname": _Lname.text,
                            "email": '',
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
                                  builder: (context) =>
                                    BillingAddressSelected()));
                          // getBillingAddress();
                        }
                        // (Route<dynamic> route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        AppColors.primaryColorpink, // background
                      ),
                      child:  Text(
                        "Add Address".toUpperCase(),
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
}
