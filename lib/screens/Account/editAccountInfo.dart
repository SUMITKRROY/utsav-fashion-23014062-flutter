import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class EditAccountInfo extends StatefulWidget {
  const EditAccountInfo({Key? key}) : super(key: key);

  @override
  State<EditAccountInfo> createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {
  bool? check1 = false;
  bool passwordVisible = false;
  bool passwordVisible1 = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisible1 = true;
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

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
            title: NWidgets.kappbarheading(context, "ACCOUNT INFORMATION")),
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
                          "ACCOUNT INFORMATION",
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
                              decoration: const InputDecoration(
                                hintText: 'Enter First Name',
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
                              height: height * 0.020,
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
                            TextFormField(
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
                                    "Current Password",
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
                              height: height * 0.030,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    // color: Colors.cyan,
                                    height: 30,
                                    width: 30,
                                    child: Checkbox(
                                        //only check box
                                        value: check1, //unchecked
                                        onChanged: (bool? value) {
                                          //value returned when checkbox is clicked
                                          setState(() {
                                            check1 = value;
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    width: width * 0.020,
                                  ),
                                  const Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color:
                                          AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            if (check1 == true)
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Change Password".toUpperCase(),
                                      style: const TextStyle(
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 16,
                                          color: AppColors.Textcolorheading,
                                          fontWeight: FontWeight.w600),
                                    ),
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
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: const [
                                        Text(
                                          "New Password",
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This is a required field.';
                                      }
                                      return null;
                                    },
                                    // onSaved: (val) => _password = val,
                                    obscureText: passwordVisible,
                                    decoration: InputDecoration(
                                      hintText: 'XXXXXXXXXX',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                      suffixIcon: IconButton(
                                        color: Colors.grey,
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible =
                                                  !passwordVisible;
                                            },
                                          );
                                        },
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
                                          "Confirm New Password",
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please make sure your passwords match';
                                      }
                                      return null;
                                    },
                                    // onSaved: (val) => _password = val,
                                    obscureText: passwordVisible1,
                                    decoration: InputDecoration(
                                      hintText: 'XXXXXXXXXX',
                                      hintStyle: FTextStyle.formfieldhintStyle,
                                      suffixIcon: IconButton(
                                        color: Colors.grey,
                                        icon: Icon(passwordVisible1
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible1 =
                                                  !passwordVisible1;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      // Row(
                      //   children: [
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Container(
                      //         // padding: EdgeInsets.all(20),
                      //         child: DottedBorder(
                      //           borderType: BorderType.RRect,
                      //           radius: Radius.circular(100),
                      //           color: Colors.black,
                      //           strokeWidth: 1,
                      //           dashPattern: [3, 3],
                      //           child: InkWell(
                      //             onTap: () {
                      //               // handle onTap event
                      //             },
                      //             child: Container(
                      //               width: height * 0.03,
                      //               height: height * 0.03,
                      //               decoration: BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: Colors.white,
                      //               ),
                      //               child: Icon(
                      //                 Icons.add,
                      //                 // color: Colors.blue,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: width * 0.020,
                      //     ),
                      //     Text(
                      //       "Attach a file",
                      //       style: TextStyle(
                      //           fontFamily: 'SourceSansPro',
                      //           fontSize: 14,
                      //           color: AppColors.Textcolorheading,
                      //           fontWeight: FontWeight.w400),
                      //     )
                      //   ],
                      // ),
                      // RoundCheckBox(
                      //   checkedColor: AppColors.primaryColorpink,
                      //   size: 15,
                      //   onTap: (selected) {},
                      // ),

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
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColorpink, // background
                            // primary: Color(0xFFE5E5E5),
                            // background
                          ),
                          child: const Align(
                              child: Text(
                            "Save",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: Colors.white,
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
