import 'package:dotted_border/dotted_border.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/Explore_more/ExploreMorePayment.dart';

import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ExploreMoreContactUS extends StatefulWidget {
  String heding;
    ExploreMoreContactUS({Key? key, required this.heding}) : super(key: key);

  @override
  State<ExploreMoreContactUS> createState() => _ExploreMoreContactUSState();
}

class _ExploreMoreContactUSState extends State<ExploreMoreContactUS> {
  bool passwordVisible = false;

  var type ='';

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
            title: NWidgets.kappbarheading(context, widget.heding)),
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
                        child: Text(
                          "We’re listening",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
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
                                children: [
                                  Text(
                                    "My Email ID",
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
                              decoration: InputDecoration(
                                hintText: 'Example@gmail.com',

                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }
                                else if(EmailValidator.validate(value)==false){
                                  return 'Invalid email address.' ;

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
                                children: [
                                  Text(
                                    "I'd like to know about",
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
                              decoration: InputDecoration(
                                // hintText: '123456asd',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
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
                            Container(
                              decoration: BoxDecoration(
                                // borderRadius: const BorderRadius.only(Radius.circular(Dimensions.dp10_0)),
                                border: Border(
                                  bottom: BorderSide( //                   <--- left side
                                    color: Colors.grey,
                                    // width: 1.0,
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              child: DropdownButtonFormField<String>(

                                decoration:   const InputDecoration(

                                  isDense: true, // Added this
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder:InputBorder.none,
                                ),

                                value: type,
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                iconSize: 20,
                                style: FTextStyle.assetstypeStyle,


                                items: [
                                  '',
                                  'I am Yet To Place Order',
                                  'Already Placed Order',
                                  'None',

                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
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
                            //     // hintText: 'de-umair@mobiloitte.com',
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
                                children: [
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
                              decoration: InputDecoration(
                                // hintText: 'de-umair@mobiloitte.com',
                                hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(100),
                                color: Colors.black,
                                strokeWidth: 1,
                                dashPattern: [3, 3],
                                child: InkWell(
                                  onTap: () {
                                    // handle onTap event
                                  },
                                  child: Container(
                                    width: height * 0.03,
                                    height: height * 0.03,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      // color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.020,
                          ),
                          Text(
                            "Attach a file",
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 14,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w400),
                          )
                        ],
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
                          child: const Align(
                              child: Text(
                            "Submit",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: AppColors.buttongrey,
                                fontWeight: FontWeight.w700),
                          )),
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
