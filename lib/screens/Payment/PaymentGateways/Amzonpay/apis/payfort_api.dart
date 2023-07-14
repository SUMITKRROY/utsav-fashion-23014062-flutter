import 'dart:convert';

import 'package:amazon_payfort/amazon_payfort.dart';

import 'package:http/http.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Amzonpay/constants/fort_constants.dart';
import 'package:utsav/screens/Payment/PaymentGateways/Amzonpay/models/sdk_token_response.dart';

class PayFortApi {
  PayFortApi._();

  static Future<SdkTokenResponse?> generateSdkToken(
      SdkTokenRequest request) async {
    var response = await post(
      Uri.parse(FortConstants.environment.paymentApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toRequest()),
    );
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return SdkTokenResponse.fromMap(decodedResponse);
    }
    return null;
  }
}
