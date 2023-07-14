import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';




class TrackYourOrder extends StatefulWidget {
  const TrackYourOrder({Key? key}) : super(key: key);

  @override
  State<TrackYourOrder> createState() => _TrackYourOrderState();
}

class _TrackYourOrderState extends State<TrackYourOrder> {
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
          title: NWidgets.kappbarheading(context,"Track your order")
        ),
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
                          "Please enter the below details to know about the status of your current order.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                             Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Order Number",
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
                                hintText: '123456asd',
                                hintStyle: FTextStyle.formfieldhintStyle,

                              ),
                            ),
                            SizedBox(height: height*0.010,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
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
                              decoration: InputDecoration(
                                hintText: 'Example@gmail.com',
                                hintStyle: FTextStyle.formfieldhintStyle,
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
                            // TextFormField(
                            //   keyboardType: TextInputType.emailAddress,
                            //   decoration: InputDecoration(
                            //     hintText: 'Example@gmail.com',
                            //
                            //   ),
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'This is a required field.';
                            //     }
                            //     else if(EmailValidator.validate(value)==false){
                            //       return 'Invalid email address.' ;
                            //
                            //     }
                            //     return null;
                            //   },
                            // ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
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
                              Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         const ExploreMoreContactUS()));

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
