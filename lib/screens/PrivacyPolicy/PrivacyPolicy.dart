import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
            title: NWidgets.kappbarheading(context, "Privacy Policy")),
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
                          "Utsav Fashion Private Limited Privacy Policy",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "GENERAL",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Utsav Fashion Private Limited (hereinafter referred to as “Company)”) operates and provides a website named ‘utsavfashion.com’ (“Website”) for computers, mobiles or similar devices. \n\nThe terms “we”, “us”, and “our” refer to the Company and “you”, “your” refers to a registered user, or a guest visitor of the Website. \n\nWhen you are accessing, using or gaining access to any information, services or products offered by the Company as a registered user, or a guest visiting our Website, we respect your privacy and are committed to protect it by using technology that gives you the most powerful and safe online experience. In order to retain your confidence and trust with respect to the information we collect about you, we maintain strict confidentiality and the data collected by us is only used to serve you better and to improve your overall experience. \n\nThis privacy policy (“Privacy Policy”) provides the details of the information that we may collect from you when you access or use our Website or interact with us through email, text and other modes of communication whether as a registered user or otherwise. The Privacy Policy also states the manner in which we collect, use, protect and disclose such information. \n\nThe Privacy Policy applies to Personal Information and Information (defined hereinafter) stored, collected or transmitted by the Company but is not applicable to information collected by any third-party, without limitation to any third-party vendors/service providers, third-party application, content, hyperlink or advertisement linked to or accessible through the Website. \n\nFurther, we urge you to carefully read and understand the Privacy Policy. By accessing the Website, you irrevocably agree and give your consent and acceptance to the terms and conditions mentioned herein, including the manner of collection, storage and use of your Personal Information and Information. In case you disagree with the terms and conditions of the Privacy Policy, you should not use or access or continue with the Website. \n\nWe commit to protect your privacy and hence our Personal Information and Information handling practices are continually reviewed to ensure compliance with the applicable privacy laws and regulations. The data controller in respect of our portal is Utsav Fashion Private Limited, registered in India. If you have any question about this Privacy Policy, you can contact the data controller by writing to Utsav Fashion Private Limited, 12th Floor, DN 51, Merlin Infinite, Salt Lake City, Kolkata, WB, 700091, India, or by sending an email at info@utsavfashion.com In terms of Information Technology Act, 2000, this document is an electronic record. Being generated by a computer system, it does not require any physical or digital signature. This document is published in accordance with the provisions of Rule 3 of the Information Technology (Intermediaries Guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and terms and conditions for access or usage of the Website and incidental services.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
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
