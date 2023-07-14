import 'package:flutter/material.dart';
import 'package:utsav/screens/Login/login_confirm.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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

        ),
        body: ListView(
          children: <Widget>[
            Padding(
              // padding: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "images/welcome_icon.png",
                  height: height*0.055,
                  width: height*0.060,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.020,
            ),
            const Text(
              "Reset a Password",
              style: FTextStyle.headingStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.030,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                                "New Password",
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
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
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
                                "Confirm New Password",
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
                                    passwordVisible1 = !passwordVisible1;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  SizedBox(
                    height: height * 0.067,
                    width: width * 362,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginConfirm()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColorpink, // background
                          ),
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          label: const Align(
                              child: Text(
                            "RESET PASSWORD",
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              // color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          )),
                        )),
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
