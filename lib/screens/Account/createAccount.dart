import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/Login/login_screen.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/Welcome/welcome_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool passwordVisible = false;
  bool cnfpasswordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    cnfpasswordVisible = true;
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
        body: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "images/welcome_icon.png",
                      height: height * 0.065,
                      width: height * 0.070,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.010,
                ),
                const Text(
                  "Create an Account",
                  textAlign: TextAlign.center,
                  style: FTextStyle.headingStyle,
                ),
                SizedBox(
                  height: height * 0.020,
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
                                hintText: 'First  Name',
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
                                hintText: 'Last Name',
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
                                  return 'Invalid email address';
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
                                    "Password",
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Text(
                        "Or Easily Using",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          // fontSize: 20,
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              child: Container(
                                width: height * 0.060,
                                height: height * 0.060,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  // border: Border.all(color: Colors.grey, width: 1),
                                  shape: BoxShape.circle,
                                  // color: Colors.white
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 72.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                        'images/socialImg/Facebook.png'),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomeScreen()));
                              }),
                          const SizedBox(
                            width: 25,
                          ),
                          InkWell(
                              child: Container(
                                width: height * 0.060,
                                height: height * 0.060,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 72.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                        'images/socialImg/Google.png'),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomeScreen()));
                              }),
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
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // (Route<dynamic> route) => false);
                                //
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavBarBottom(
                                                  selectedIndex: 0)));
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
                                "REGISTER",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 18,
                                    color: AppColors.buttongrey,
                                    fontWeight: FontWeight.w700),
                              )),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.underlineTextcolorheading
                                  // fontSize: 20
                                  ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const loginScreen()));
                              // (Route<dynamic> route) => false);
                              //signup screen
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
