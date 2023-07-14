import 'package:flutter/material.dart';
import 'package:utsav/screens/Explore_more/ExploreMorePayment.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';



class JustAskScreen extends StatefulWidget {
  const JustAskScreen({Key? key}) : super(key: key);

  @override
  State<JustAskScreen> createState() => _JustAskScreenState();
}

class _JustAskScreenState extends State<JustAskScreen> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

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
          elevation: 0,
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
          title: const Text(
            "Ask a question",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Container(
              width: width/8,
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {

                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(30, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(

              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Divider(
                      height: height*0.010,
                    ),
                    SizedBox(
                      height: height*0.010,
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "We’re listening",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height*0.010,
                    ),

                  ],
                ),
                Column(
                  children: [
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
                                  "My email id",
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

                            obscureText: passwordVisible,
                            decoration: const InputDecoration(
                              hintText: 'Umair',
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
                                  "I’d like to know about",
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
                              hintText: 'Siddiqui',
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
                                  "I need help at",
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
                              hintText: 'Already Place Order',
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
                                  "More details",
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
                              hintText: '9936595085',
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
                              "SUBMIT",
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 18,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height*0.010,
                    ),
                   SizedBox(
                      height: height*0.020,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.020,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

