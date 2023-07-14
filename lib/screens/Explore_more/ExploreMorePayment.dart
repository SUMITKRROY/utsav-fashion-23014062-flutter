import 'package:flutter/material.dart';

import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ExploreMorePayment extends StatefulWidget {
  const ExploreMorePayment({Key? key}) : super(key: key);

  @override
  State<ExploreMorePayment> createState() => _ExploreMorePaymentState();
}

class _ExploreMorePaymentState extends State<ExploreMorePayment> {
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
            title: NWidgets.kappbarheading(context, "Payment")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment",
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
                          "At Utsav Fashion, our aim is to make shopping convenient for our customers, which is why we offer a range of payment options.",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),


                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "hoilhilh",
                      //     style: TextStyle(
                      //         fontFamily: 'SourceSansPro',
                      //         fontSize: 14,
                      //         color: AppColors.Textcolorheading,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      // ),

                      SizedBox(
                        height: height * 0.020,
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/ccrad.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Credit Cards, Debit Cards, UPI or EMI*",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We accept MasterCard, VISA, Discover, JCB, American Express, Diners Club cards and Maestro cards. EMI details and T&C's will be available on the payment gateway website.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/mobcard.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Net Banking / Debit Card",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We support net banking with SBI, ICICI, HDFC, Citibank, Kotak, Axis Bank and Others.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/daller.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Cash On Delivery",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We accept MasterCard, VISA, Discover, JCB, American Express, Diners Club cards and Maestro cards. EMI details and T&C's will be available on the payment gateway website.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/amazonpay.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Amazon Pay",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Customers can also pay through Amazon account.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/wallet.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Wallets",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "We support payments through Mobikwik & PayTM wallet.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),

                      // Curation by Occasion
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Image.asset(
                            "images/ExploreMorePaymetIcon/bankicon.png",
                            height: height * 0.070,
                            width: height * 0.070,
                            // color: Colors.grey,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Direct Deposit in Bank",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Column(
                            children: const [
                                Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Payment via bank account must be paid within 3 days upon order made. Once paid, inform customer service with payment details.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Our Account details are as follows:-",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Account Name: Utsav Fashion Pvt. Ltd.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Account Number: 627905012500",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Bank Name: ICICI Bank",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Bank IFSC Code: ICIC0006279",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Address: ICICI Bank, Bara Bazar Branch, P-16, Kalakar Street, \nKolkata - 700007",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      color: AppColors.Textcolorheading,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          Divider(
                            height: height * 0.010,
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Safe Shopping:",
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
                          const  Align(
                            alignment: Alignment.centerLeft,
                            child:   Text(
                              "We have taken several steps to ensure that payments made on Utsav Fashion are safe and secure. At no point will anyone from Utsav Fashion ask you to share your Credit Card, Bank Account or Utsav My Account details via email or call. We request that you do not share these details with anyone under any circumstances.",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please Note:",
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
                              "An order may be cancelled if information provided by a customer is found incomplete. The customer will be notified within 24-72 hours in such an event. It will be the customer's responsibility to furnish correct information and re-place the order within 48 hours.",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.020,
                          ),

                          const Text.rich(
                        TextSpan(
                          text: 'You can also ',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Email',
                              style: TextStyle(
                                  decoration:
                                  TextDecoration.underline,
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: ' us to immediately get the best possible solutions and information.',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.010,
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
