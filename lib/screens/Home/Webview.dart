
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utsav/utils/appUrl.dart';
import 'package:utsav/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../utils/app_colors.dart';
// #enddocregion platform_imports
/*
class WebViewPage extends StatefulWidget {
  final String Url;
  final String title;
  final bool flag;
  const WebViewPage({Key? key,required this.Url, required this.title, required this.flag}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();


  }



*/
/*  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,

        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "images/ccrossIcon.png",
              height: 22,
              width: 22,
              // color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);

            },
          ),
        ],
      ),
      backgroundColor: Colors.white,

      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
             Column(
              children: [
                 // WebViewWidget(controller: _controller),
                Expanded(
                  child: WebView(
                    initialUrl: widget.Url.toString(),
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller = webViewController;
                    },
                  ),
                ),
              ],
            ),
            // isLoading
            //     ? const Center(
            //   child: CircularProgressIndicator(
            //     color: AppColors.primary_color,
            //   ),
            // )
            //     : Stack(),
          ],
        );
      }),
    );

  }*//*



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView POST Example'),
      ),
      body: WebView(
        initialUrl: 'https://example.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) async {
          if (request.method == 'POST') {
            final body = utf8.decode(request.bodyBytes);
            final response = await performPostAPI(body);
            return NavigationDecision.navigate(
                content: Text('API Response: $response'));
          }
          return NavigationDecision.navigate;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {
          final controller = await _controller;
          final postData = {'name': 'John', 'age': '30'};
          final postBody = utf8.encode(json.encode(postData));
          await controller.postUrl(
            Uri.parse('https://example.com/submit-form'),
            body: postBody,
            headers: {'Content-Type': 'application/json'},
          );
        },
      ),
    );
  }

  Future<String> performPostAPI(String body) async {
    // Call your API with the given body data
    // and return the response string.
    await Future.delayed(Duration(seconds: 2)); // Dummy delay for demo purpose.
    return 'API response for: $body';
  }
}
*/






class WebViewPage extends StatefulWidget {

  final String Url;
  final String title;
  final bool flag;
  const WebViewPage({Key? key,required this.Url, required this.title, required this.flag}) : super(key: key);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}
 class _WebViewPageState extends State<WebViewPage> {

  late final WebViewController _webViewKey;

  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  late String title, url ;
   var htmlstring;
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    htmlstring  = callApi()  ;
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,

        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "images/ccrossIcon.png",
              height: 22,
              width: 22,
              // color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);

            },
          ),
        ],
      ),
      backgroundColor: Colors.white,

      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            WebView(
              initialUrl: widget.Url,
              javascriptMode: JavascriptMode.unrestricted,
              // onWebViewCreated: (WebViewController webViewController) {
              //   _controller.complete(webViewController);
              // },
               onWebViewCreated: (WebViewController webViewController) {
                 webViewController.loadHtmlString(
                   htmlstring,
                     // mimeType: 'text/html',
                   // encoding: 'utf-8',
                 );
               },
              // TODO(iskakaushik): Remove this when collection literals makes it to stable.
              // ignore: prefer_collection_literals
              // javascriptChannels: <JavascriptChannel>[
              //   _toasterJavascriptChannel(context),
              // ].toSet(),
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                setState(() {
                  isLoading = true;
                });
                return NavigationDecision.navigate;
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ?   Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColorpink,
              ),
            )
                : Stack(),
          ],
        );
      }),
    );
  }

  Future<dynamic> callApi() async {
    print('Udesign Api');
    developer.log('Udesign Bearer ${Utils.userkey}');
    // API call using http package
    var headers = {
      'Authorization': 'Bearer ${Utils.userkey}'
    };
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.usqaudesign_utsav));
    request.fields.addAll({
      'itemcode': 'STKA334',
      'customerid': '921334',
      'customeremail': 'sumit.roy@indicchain.com',
      'checksum': '5daa988a58ac9a53d37623051391aa5a',
      'appid': '10005',
      'returnurl': '',
      'imageurl': 'https://utsavfashion.mobiloitte.io/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f/h/a/half-n-half-chiffon-brasso-saree-in-olive-green-and-fuchsia-v1-suf9844.jpg'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();

      developer.log('response>>>>>$responseString');
      developer.log('response>>>>>${responseString.replaceAll('assets/','${AppUrl.usqaudesign_utsav}/' ).replaceAll('/${AppUrl.usqaudesign_utsav}/', '${AppUrl.usqaudesign_utsav}/')}');
      // Inject the API response into the WebView
      _webViewKey.runJavascriptReturningResult('''
        document.getElementById('my-api-response-element').innerHTML = '$responseString';
      ''');
      _webViewKey.runJavascriptReturningResult( '$responseString'
       );
         return responseString;

    }
    else {
      print(response.reasonPhrase);
      return '';

    }
  }
}