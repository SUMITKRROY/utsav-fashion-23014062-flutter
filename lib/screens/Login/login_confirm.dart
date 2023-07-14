import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsav/screens/Account/createAccount.dart';
import 'package:utsav/screens/RecoverPassword/recoverPassword_screen.dart';
import 'package:utsav/screens/Welcome/welcome_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';

class LoginConfirm extends StatefulWidget {
  const LoginConfirm({Key? key}) : super(key: key);

  @override
  State<LoginConfirm> createState() => _LoginConfirmState();
}

class _LoginConfirmState extends State<LoginConfirm> {
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
        body: ListView(

          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height / 8,
              width: width,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Color(0xFFE9FFCA),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check, color: Color(0xFF296A23)), // tick mark icon
                  SizedBox(
                      width: 16.0), // add some space between the icon and text
                  Text(
                    'Your password has been updated.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF296A23)),
                  ),
                ],
              ),
            ),
            Padding(
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
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email Address",
                              style: FTextStyle.formfieldHeadingText),
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
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: FTextStyle.formfieldHeadingText,
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
                          keyboardType: TextInputType.number,
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
                        // color: Colors.grey,
                        height: height * 0.033,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: const Text(
                              'Recover Password?',
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
