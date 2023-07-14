import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:utsav/screens/Home/chatScreen.dart';

import 'package:utsav/utils/app_colors.dart';

import 'package:utsav/utils/widgets.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  bool passwordVisible = false;

  var type = '';

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Transform(
            transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
            child: Image.asset(
              "images/logo_hor.png",
              height: height / 2,
              width: width / 3,
              // color: Colors.grey,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/ccrossIcon.png",
                height: height * 0.022,
                width: height * 0.022,
                // color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          // padding: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Please wait, while we are trying to respond to you at the earliest. In case you are rushed for time, we request you to leave us a message. We will ensure you receive a response from us in the next 24 hours.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 16,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.060,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: const [
                            Text(
                              "Name",
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
                        keyboardType: TextInputType.name,
                        decoration:
                            const InputDecoration(hintText: 'Enter Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Constants.Pleaseentervalidname;
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
                          // hintStyle: FTextStyle.formfieldhintStyle,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This is a required field';
                          } else if (EmailValidator.validate(value) == false) {
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
                              "Phone Number",
                              style: FTextStyle.formfieldHeadingText,
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            hintText: 'Enter Phone Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
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
                              "Assistance Type",
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
                                borderSide: BorderSide(color: Colors.black)),
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
                            'I am Yet To Place Order',
                            'Already Placed Order',
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
                          validator: (value) =>
                              value == null ? 'field required' : null,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.056,
                width: 320,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColorblue, // background
                    ),
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    label: const Align(
                      child: Text(
                        "START CHAT",
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
