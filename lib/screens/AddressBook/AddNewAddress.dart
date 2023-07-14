import 'package:flutter/material.dart';
import 'package:utsav/screens/Explore_more/ExploreMorePayment.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  var type = '';

  @override
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
            title: NWidgets.kappbarheading(context, "ADD NEW ADDRESS")),
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
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact Information",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.030,
                      ),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }
                                return null;
                              },
                              // onSaved: (val) => _password = val,
                              obscureText: passwordVisible,
                              decoration: const InputDecoration(
                                hintText: 'Enter First Name',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
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
                              decoration: const InputDecoration(
                                hintText: 'Enter Last Name',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
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
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'XXXXXXXXXX',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height * 0.040,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 16,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            Divider(
                              height: height * 0.020,
                            ),

                            SizedBox(
                              height: height * 0.020,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "Street Address",
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
                              decoration: const InputDecoration(
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
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
                              decoration: const InputDecoration(
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
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
                                  'Please select a region',
                                  'Please select a state or province.',
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
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     suffixIcon: Icon(Icons.keyboard_arrow_down),
                            //     hintText: '',
                            //     hintStyle: FTextStyle.formfieldhintStyle,
                            //   ),
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'This is a required field.';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            SizedBox(
                              height: height * 0.020,
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
                              decoration: const InputDecoration(
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
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
                            TextFormField(
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                hintText: '',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      SizedBox(
                        // height: 67,
                        // width: 362,
                        height: height * 0.067,
                        width: width * 362,
                        child: ElevatedButton(
                          onPressed: () {
                            // (Route<dynamic> route) => false);
                            //
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExploreMorePayment()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColorpink, // background
                          ),
                          child: const Align(
                              child: Text(
                            "SAVE ADDRESS",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),

                  // Curation by Occasion
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
