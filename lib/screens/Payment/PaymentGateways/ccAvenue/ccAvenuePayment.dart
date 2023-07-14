

import 'dart:async';

import 'package:cc_avenue/cc_avenue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsav/utils/app_colors.dart';

class CcAvenuePaymentScreen extends StatefulWidget {
  const CcAvenuePaymentScreen({Key? key}) : super(key: key);

  @override
  State<CcAvenuePaymentScreen> createState() => _CcAvenuePaymentScreenState();
}

class _CcAvenuePaymentScreenState extends State<CcAvenuePaymentScreen> {
  @override
  void initState() {
    super.initState();
  }

  /// [initPlatformState] this calls the [cCAvenueInit]
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '10',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp');
    } on PlatformException {
      print('PlatformException');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CC Avenue Payment".toUpperCase(),
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
            'Make Payment By CC Avenue',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.primaryColorpink,
          ),
          onTap: () {
            initPlatformState();
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   /// [initPlatformState] this calls the [cCAvenueInit]
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       await CcAvenue.cCAvenueInit(
//           transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
//           accessCode: '4YRUXLSRO20O8NIH',
//           amount: '10',
//           cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
//           currencyType: 'INR',
//           merchantId: '2',
//           orderId: '519',
//           redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
//           rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp'
//       );
//     } on PlatformException {
//       print('PlatformException');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: (){
//               initPlatformState();
//             }, child: Text('Invoke'),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
