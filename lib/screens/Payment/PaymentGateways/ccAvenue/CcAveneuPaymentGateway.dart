// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// class PaymentGatewayScreen extends StatefulWidget {
//   final String orderID;
//   final double amount;
//
//   PaymentGatewayScreen({required this.orderID, required this.amount});
//
//   @override
//   _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
// }
//
// class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
//   Future<void> launchPaymentGateway() async {
//     String url =
//         'https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction&merchant_id=YOUR_MERCHANT_ID&order_id=${widget.orderID}&amount=${widget.amount}&currency=INR&redirect_url=YOUR_REDIRECT_URL&cancel_url=YOUR_CANCEL_URL&language=EN';
//
//     await Navigator.of(context).push(MaterialPageRoute(
//         builder: (BuildContext context) => WebviewScaffold(
//           url: url,
//           appBar: AppBar(title: Text('CC Avenue Payment')),
//         )));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     launchPaymentGateway();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Processing Payment'),
//       ),
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
