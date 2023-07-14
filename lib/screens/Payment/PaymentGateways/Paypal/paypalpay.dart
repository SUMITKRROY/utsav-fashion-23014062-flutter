import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter/services.dart';
import 'package:utsav/utils/app_colors.dart';

class PaypalPay extends StatelessWidget {
  PaypalPay({Key? key}) : super(key: key);

  final String mid = "";
  final String orderId = "";
  final String amount = "";
  final String txnToken = "";
  final String callbackurl = "";
  final bool isStaging = false;
  final bool restrictAppInvoke = false;

  // var response = AllInOneSdk.startTransaction(
  //   mid,
  //   orderId,
  //   amount,
  //   txnToken,
  //   callbackurl,
  //   isStaging,
  //   restrictAppInvoke,
  // );
  // print(response);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "PayPal Payment".toUpperCase(),
            style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16,
                color: AppColors.Textcolorheading,
                fontWeight: FontWeight.w500),
          ),
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
        ),
        body: Column(children: [
          ListTile(
            leading: const Icon(
              Icons.credit_card,
              // size: 12,
              color: AppColors.primaryColorpink,
            ),
            title: const Text(
              'Make Payment By Paypal',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.primaryColorpink,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => UsePaypal(
                      sandboxMode: true,
                      clientId:
                      "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                      secretKey:
                      "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                      returnURL: "https://samplesite.com/return",
                      cancelURL: "https://samplesite.com/cancel",
                      transactions: const [
                        {
                          "amount": {
                            "total": '10.12',
                            "currency": "USD",
                            "details": {
                              "subtotal": '10.12',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description":
                          "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "A demo product",
                                "quantity": 1,
                                "price": '10.12',
                                "currency": "USD"
                              }
                            ],

                            // shipping address is not required though
                            "shipping_address": {
                              "recipient_name": "Jane Foster",
                              "line1": "Travis County",
                              "line2": "",
                              "city": "Austin",
                              "country_code": "US",
                              "postal_code": "73301",
                              "phone": "+00000000",
                              "state": "Texas"
                            },
                          }
                        }
                      ],
                      note:
                      "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                      },
                      onCancel: (params) {
                        print('cancelled: $params');
                      }),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // Center(
          //   child: ElevatedButton(
          //       onPressed: () => {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (BuildContext context) => UsePaypal(
          //                     sandboxMode: true,
          //                     clientId:
          //                         "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
          //                     secretKey:
          //                         "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
          //                     returnURL: "https://samplesite.com/return",
          //                     cancelURL: "https://samplesite.com/cancel",
          //                     transactions: const [
          //                       {
          //                         "amount": {
          //                           "total": '10.12',
          //                           "currency": "USD",
          //                           "details": {
          //                             "subtotal": '10.12',
          //                             "shipping": '0',
          //                             "shipping_discount": 0
          //                           }
          //                         },
          //                         "description":
          //                             "The payment transaction description.",
          //                         // "payment_options": {
          //                         //   "allowed_payment_method":
          //                         //       "INSTANT_FUNDING_SOURCE"
          //                         // },
          //                         "item_list": {
          //                           "items": [
          //                             {
          //                               "name": "A demo product",
          //                               "quantity": 1,
          //                               "price": '10.12',
          //                               "currency": "USD"
          //                             }
          //                           ],
          //
          //                           // shipping address is not required though
          //                           "shipping_address": {
          //                             "recipient_name": "Jane Foster",
          //                             "line1": "Travis County",
          //                             "line2": "",
          //                             "city": "Austin",
          //                             "country_code": "US",
          //                             "postal_code": "73301",
          //                             "phone": "+00000000",
          //                             "state": "Texas"
          //                           },
          //                         }
          //                       }
          //                     ],
          //                     note:
          //                         "Contact us for any questions on your order.",
          //                     onSuccess: (Map params) async {
          //                       print("onSuccess: $params");
          //                     },
          //                     onError: (error) {
          //                       print("onError: $error");
          //                     },
          //                     onCancel: (params) {
          //                       print('cancelled: $params');
          //                     }),
          //               ),
          //             )
          //           },
          //       child: const Text("Make Payment By Paypal")),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
        ]));
  }
}
