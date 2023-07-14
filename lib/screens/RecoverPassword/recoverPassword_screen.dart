import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/RecoverPassword/resetPassword.dart';
import 'package:utsav/screens/login/login_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
          // title: Text(
          //   "",
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              // padding: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "images/welcome_icon.png",
                  height:55,
                  width: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Forgot Your Password",
              style: FTextStyle.headingStyle,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 20,
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.020,
                  ),
                  const Text(
                    "Please enter your email address below. You will receive a link to reset your password.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,

                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: height*0.020,
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
                            }
                            else if(EmailValidator.validate(value)==false){
                              return 'Invalid email address.' ;

                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*0.020,
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
                                      const ResetPassword()));

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
                                "SEND RESET LINK",
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 20,
                                  // color: Colors.black,
                                  // fontWeight: FontWeight.bold
                                ),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: height*0.020,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const loginScreen()));
                      },
                      child: const Text(
                        'Back to Login',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: AppColors.underlineTextcolorheading,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
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
