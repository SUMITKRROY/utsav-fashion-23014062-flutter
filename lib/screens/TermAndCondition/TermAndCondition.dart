import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
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
            title: NWidgets.kappbarheading(context, "terms and conditions")),
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
                          "Terms & Conditions",
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
                          "INTRODUCTION",
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
                          "Welcome to the Utsav Fashion.In using the service of Utsav Fashion you are deemed to have accepted the terms and conditions listed below-All products/services and information displayed on Utsav Fashion constitute an 'invitation to offer'. Your order for purchase constitutes your 'offer' which shall be subject to the terms and conditions as listed below. Utsav Fashion reserves the right to accept or reject your offer. If you have supplied us with your valid email address, we will notify you by email as soon as possible to confirm receipt of your order and email you again to confirm details and therefore process the order. Our acceptance of your order will take place upon dispatch of the product(s) ordered. No act or omission of Utsav Fashion prior to the actual dispatch of the product(s) ordered will constitute acceptance of your offer. \n\nEligibility for Membership \n\nUse of the Site is available only to persons who can form legally binding contracts under applicable law. Persons who are 'incompetent to contract' within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Site. If you are a minor i.e. under the age of 18 years but at least 13 years of age, you may use this Site only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below that of 18 years, your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption, the sale or purchase of which to/by minors are strictly prohibited.Utsav Fashion reserves the right to terminate your membership and refuse to provide you with access to the Site if Utsav Fashion discovers that you are under the age of 18 years. The Site is not available to persons whose membership has been suspended or terminated by Utsav Fashion for any reason whatsoever. If you are registering as a business entity, you represent that you have the authority to bind the entity to this User Agreement.Except where additional terms and conditions are provided which are product specific, these terms and conditions supersede all previous representations, understandings, or agreements and shall prevail notwithstanding any variance with any other terms of any order submitted. By using the services of Utsav Fashion you agree to be bound by the Terms and Conditions.",
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
