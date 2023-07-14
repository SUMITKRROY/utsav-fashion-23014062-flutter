import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';

class PaytmScreen extends StatelessWidget {
  PaytmScreen({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController(text: Utils.viewTotalModel!['grand_total'].toString());






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paytm Payment".toUpperCase(),
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                readOnly: true,
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.currency_rupee),
                  hintText: "Enter payable amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  String amount = _controller.text.trim();
                  double doubleamount = double.parse(amount);
                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter amount"),
                      ),
                    );
                    return;
                  }
                  initiateTransactionData(doubleamount);
                  // initiateTransaction(amount);
                },
                child: const Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initiateTransactionData(double amount) async {
    try {
      final Dio dio = Dio();
      Response response = await dio.post(
          "${AppUrl.Paytmurltoken}",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: {
            'amount': amount,
          });
      print(response);
      if (response.statusCode == 200) {
        print("Data:-${response.data.runtimeType}");
        Map<String, dynamic> PaytmChecksumjsonData = json.decode(response.data);
        String result = '';
        print("callings");
        try {
          var response = AllInOneSdk.startTransaction(
            PaytmChecksumjsonData["mid"],
            PaytmChecksumjsonData["orderId"],
            amount.toString(),
            PaytmChecksumjsonData["txnToken"],
            "callBackUrl",
            false,
            true,
          );
          print(response);
          response.then((value) {
            // Transaction successfull
            print(value);
          }).catchError((onError) {
            if (onError is PlatformException) {
              result = onError.message! + " \n  " + onError.details.toString();
              print(result);
            } else {
              result = onError.toString();
              print(result);
            }
          });
        } catch (err) {
          // Transaction failed
          result = err.toString();
          print(result);
        }
        // }
      } else {
        print(response.data);
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
