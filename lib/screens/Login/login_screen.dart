import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsav/screens/Account/createAccount.dart';
import 'package:utsav/screens/RecoverPassword/recoverPassword_screen.dart';
import 'package:utsav/screens/Welcome/welcome_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.primaryColorpink;
    }

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
                  height: 55,
                  width: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Login to Utsav Fashion",
              style: FTextStyle.headingStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.040,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                        SizedBox(
                          height: height * 0.010,
                        ),
                        TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10),
                            // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'))
                          ],
                          keyboardType: TextInputType.text,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'XXXXXXXXXXX',
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
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.050,
                      ),
                      SizedBox(
                        height: height * 0.033,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: const Text(
                              'Recover Password ?',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 16,
                                  color: AppColors.underlineTextcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RecoverPassword()));
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: const Text(
                            'Create an Account',
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 16,
                                color: AppColors.underlineTextcolorheading,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()));
                          },
                        ),
                      ),
                    ],
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
                            setState(() {
                              Utils.checkLogin = true;
                            });
                            if (formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavBarBottom(selectedIndex: 0)),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColorpink, // background
                          ),
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          label: const Align(
                              child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: AppColors.buttongrey,
                                fontWeight: FontWeight.w700),
                          )),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.050,
                  ),
                  const Text(
                    "Or Easily Using",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.050,
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
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 72.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('images/socialImg/Facebook.png'),
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
                                backgroundImage:
                                    AssetImage('images/socialImg/Google.png'),
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
                ],
              ),
            ),
            // SizedBox(height: height*0.00,),
          ],
        ),
      ),
    );
  }
}
