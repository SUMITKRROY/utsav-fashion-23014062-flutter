import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:utsav/screens/Account/NewsLetterSubscription.dart';
import 'package:utsav/screens/Account/account.dart';
import 'package:utsav/screens/Account/accountDashboard.dart';
import 'package:utsav/screens/Account/createAccount.dart';
import 'package:utsav/screens/AddressBook/AddNewAddress.dart';
import 'package:utsav/screens/AddressBook/AddressBook.dart';
import 'package:utsav/screens/CMS/ConceptLandingPagesec.dart';
import 'package:utsav/screens/CMS/ConceptPage.dart';
import 'package:utsav/screens/CMS/ListingLandingPage.dart';
import 'package:utsav/screens/CMS/PersonalisedStore.dart';
import 'package:utsav/screens/CMS/cmsLandingPage.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreAboutUs.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreAccount.dart';
import 'package:utsav/screens/Explore_more/ExploreMoreContactUs.dart';
import 'package:utsav/screens/Explore_more/ExploreMorePayment.dart';
import 'package:utsav/screens/Explore_more/Testimmonials.dart';
import 'package:utsav/screens/Explore_more/trackYourOrder.dart';
import 'package:utsav/screens/Filter/categorywisefilter.dart';
import 'package:utsav/screens/Filter/filterList.dart';
import 'package:utsav/screens/Home/ZoomPage.dart';
import 'package:utsav/screens/Home/chatScreen.dart';
import 'package:utsav/screens/Home/helpScreen.dart';
import 'package:utsav/screens/Home/homeScreen.dart';
import 'package:utsav/screens/Home/howToMeasure.dart';
import 'package:utsav/screens/Home/justAsk.dart';
import 'package:utsav/screens/Home/returnScreen.dart';
import 'package:utsav/screens/Home/searchScreen.dart';
import 'package:utsav/screens/Home/shipping.dart';
import 'package:utsav/screens/Home/sizeChartCm.dart';
import 'package:utsav/screens/Login/login_confirm.dart';
import 'package:utsav/screens/Login/login_screen.dart';
import 'package:utsav/screens/Measurement/MyMesurement2.dart';
import 'package:utsav/screens/Measurement/Mymeasurement.dart';
import 'package:utsav/screens/MyNotification/MyNotificationExplore.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/Order/Emptymyorder.dart';
import 'package:utsav/screens/Order/myorder.dart';
import 'package:utsav/screens/Order/oderdetails.dart';

import 'package:utsav/screens/Payment/afterSubmitting.dart';
 import 'package:utsav/screens/Payment/SelectAddress/billingAddressSelected.dart';
import 'package:utsav/screens/Payment/combinedShipping.dart';
import 'package:utsav/screens/Payment/SelectAddress/selectAdress.dart';
import 'package:utsav/screens/Payment/thankYou.dart';
import 'package:utsav/screens/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:utsav/screens/RecoverPassword/recoverPassword_screen.dart';
import 'package:utsav/screens/RecoverPassword/resetPassword.dart';
 import 'package:utsav/screens/ShoppingBag/customPayment.dart';
import 'package:utsav/screens/ShoppingBag/shoppingBag.dart';
import 'package:utsav/screens/ShoppingBag/viewDetails.dart';
import 'package:utsav/screens/StoreCredit/StoreCredit.dart';
import 'package:utsav/screens/TermAndCondition/TermAndCondition.dart';
import 'package:utsav/screens/Welcome/welcome_screen.dart';
import 'package:utsav/screens/WhishList/emptywishList.dart';
import 'package:utsav/screens/WhishList/shareWhislist.dart';
import 'package:utsav/screens/WhishList/wishListHome.dart';
import 'package:utsav/screens/OnBorad/onBoardScreen.dart';
import 'package:utsav/screens/splash_screen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'dart:developer' as developer;

import 'package:utsav/utils/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String splashScr = 'splashScreen';
  static const String welcomeScr = 'welcomeScreen';
  static const String loginScr = 'loginScreen';
  static const String loginConfirmScr = 'loginConfirm';
  static const String onBoardScr = 'onBoardScreen';
  static const String recoverPassScr = 'recoverPassword';
  static const String resetPassScr = 'resetPassword';
  static const String createaccountScr = 'createAccount';
  static const String homeScr = 'homeScreen';
  static const String navBarbottomScr = 'navBarBottom';
  static const String helpScr = 'helpScreen';
  static const String chatScr = 'chatScreen';
  static const String searchScr = 'searchScreen';
  static const String sizeChartCmScr = 'sizeChartCm';
  static const String howToMeasureScr = 'howToMeasure';
  static const String shippingScr = 'shipping';
  static const String returnsScr = 'returnsScreen';
  static const String justAskScr = 'justAskScreen';
  static const String categoryWiseFilterScr = 'categoryWiseFilter';
  static const String filterListScr = 'filterList';
  static const String emptyWishListScr = 'emptyWishList';
  static const String wishListHomeScr = 'WhishListHome';
  static const String shareWishListScr = 'shareWishList';
  static const String emptyCartScr = 'emptyCart';
  static const String shoppingBagScr = 'shoppingBag';
  static const String viewDetailsScr = 'viewDetails';
  static const String discountDetailsScr = 'discountDetails';
  static const String customPaymentScr = 'customPayment';
  static const String selectAddressScr = 'selectAddress';
  static const String billingAddressScr = 'billingAddress';
  static const String billingAddressSelectedScr = 'billingAddressSelected';
  static const String thankYouScr = 'thankYou';
  static const String combinedShippingScr = 'combinedShipping';
  static const String afterSubmittingScr = 'afterSubmitting';
  static const String accountDashBoardScr = 'accountDashBoard';
  static const String myordersScr = 'myorders';
  static const String emptymyorderScr = 'emptymyorder';
  static const String orderDetailsScr = 'orderDetails';
  static const String exploreMoreAccountScr = 'exploreMoreAccount';
  static const String exploreMoreAboutUsScr = 'exploreMoreAboutUs';
  static const String testimonialsScr = 'testimonials';
  static const String trackYourOrderScr = 'trackYourOrder';
  static const String exploreMoreContactUSScr = 'exploreMoreContactUS';
  static const String exploreMorePaymentScr = 'exploreMorePayment';
  static const String myNotificationExploreScr = 'myNotificationExplore';
  static const String accountScreenScr = 'AccountScreen';
  static const String newLetterSubscriptionScr = 'newLetterSubscription';
  static const String myMeasurementScr = 'myMeasurement';
  static const String myMesurementtwoScr = 'myMesurementtwo';
  static const String storeCreditScr = 'storeCredit';
  static const String addressBookScr = 'addressBook';
  static const String addNewAddressScr = 'addNewAddress';
  static const String privacyPolicyScr = 'privacyPolicy';
  static const String termAndConditionScr = 'termAndCondition';
  static const String cmsLandingPageScr = 'cmsLandingPage';
  static const String conceptPageScr = 'conceptPage';
  static const String listingLandingPageeScr = 'listingLandingPagee';
  static const String mixCategoryLandigPageScr = 'mixCategoryLandigPage';
  static const String conceptLandingPagesecScr = 'conceptLandingPagesec';
  static const String persionalStoreNostoScr = 'persionalStoreNosto';
  static const String sizeChartInchScr = 'sizeChartInch';
  static const String zoompagescr = 'zoompage';
  static const String AmazonPay = 'amazonPay';



  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Prefs.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: MyColors.pink,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: MyColors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Utsav Fashion',
      routes: <String, WidgetBuilder>{
        splashScr: (BuildContext context) => const SplashScreen(),
        welcomeScr: (BuildContext context) => const WelcomeScreen(),
        loginScr: (BuildContext context) => const loginScreen(),
        loginConfirmScr: (BuildContext context) => const LoginConfirm(),
        onBoardScr: (BuildContext context) => const OnBoardScreen(),
        recoverPassScr: (BuildContext context) => const RecoverPassword(),
        resetPassScr: (BuildContext context) => const ResetPassword(),
        createaccountScr: (BuildContext context) => const CreateAccount(),
        homeScr: (BuildContext context) => const HomeScreen(),
        navBarbottomScr: (BuildContext context) => const NavBarBottom(selectedIndex: 0),
        helpScr: (BuildContext context) => const HelpScreen(),
        chatScr: (BuildContext context) => const ChatScreen(),
        searchScr: (BuildContext context) => const SearchScreen(),
        sizeChartCmScr: (BuildContext context) => const SizeChartCm(),

        howToMeasureScr: (BuildContext context) => const HowToMeasure(),
        shippingScr: (BuildContext context) => const Shipping(),
        returnsScr: (BuildContext context) => const ReturnsScreen(),
        justAskScr: (BuildContext context) => const JustAskScreen(),
        categoryWiseFilterScr: (BuildContext context) => const CategoryWiseFilter(),
        filterListScr: (BuildContext context) =>
            FilterList(Subattribute_Id: '',
              Sunatrribute_code: '',
              condition_type: '',
              SubCondition_type: '',
              field: '',
              Subfield: '',
              value: 0,
              Subvalue: '',
               heding: '',
              Count: 0,
              pageSize: '',),
        emptyWishListScr: (BuildContext context) => const EmptyWishList(),
        wishListHomeScr: (BuildContext context) => const WishListHome(),
        shareWishListScr: (BuildContext context) => const ShareWishList(),
        shoppingBagScr: (BuildContext context) =>   ShoppingBag(addToCartData1: {},),
        viewDetailsScr: (BuildContext context) =>   ViewDetails(viewTotalModel: {},),
        customPaymentScr: (BuildContext context) => const CustomPayment(),
        selectAddressScr: (BuildContext context) => const SelectAddress(),

        billingAddressSelectedScr: (BuildContext context) => const BillingAddressSelected(),
        thankYouScr: (BuildContext context) => const ThankYou(),
        combinedShippingScr: (BuildContext context) => const CombinedShipping(),
        afterSubmittingScr: (BuildContext context) => const AfterSubmitting(),
        accountDashBoardScr: (BuildContext context) => const AccountDashBoard(),
        myordersScr: (BuildContext context) => const Myorder(),
        emptymyorderScr: (BuildContext context) => const Emptymyorder(),
        orderDetailsScr: (BuildContext context) => const OrderDetails(),
        exploreMoreAccountScr: (BuildContext context) => const ExploreMoreAccount(),
        exploreMoreAboutUsScr: (BuildContext context) => const ExploreMoreAboutUs(),
        testimonialsScr: (BuildContext context) => const Testimonials(),
        trackYourOrderScr: (BuildContext context) => const TrackYourOrder(),
        exploreMoreContactUSScr: (BuildContext context) => ExploreMoreContactUS(heding: '',),
        exploreMorePaymentScr: (BuildContext context) => const ExploreMorePayment(),
        myNotificationExploreScr: (BuildContext context) => const MyNotificationExplore(),
        accountScreenScr: (BuildContext context) => const AccountScreen(),
        newLetterSubscriptionScr: (BuildContext context) => const NewLetterSubscription(),
        myMeasurementScr: (BuildContext context) => const MyMeasurement(),
        myMesurementtwoScr: (BuildContext context) => const MyMesurementtwo(),
        storeCreditScr: (BuildContext context) => const StoreCredit(),
        addressBookScr: (BuildContext context) => const AddressBook(),
        addNewAddressScr: (BuildContext context) => const AddNewAddress(),
        privacyPolicyScr: (BuildContext context) => const PrivacyPolicy(),
        termAndConditionScr: (BuildContext context) => const TermAndCondition(),
        cmsLandingPageScr: (BuildContext context) => CmsLandingPage(heding: '', mapdata: const {}, festivdata: const {},),
        conceptPageScr: (BuildContext context) => ConceptPage(img: '', bnrimg: '', name: '', imglist: const [],),
        listingLandingPageeScr: (BuildContext context) => ListingLandingPage(imglist: const [], name: '', more: '',),
        // mixCategoryLandigPageScr: (BuildContext context) => MixCategoryLandigPage(heding: '', mapdata: const {}, imglist: const [], storeId: '', currencyCode: '',),
        conceptLandingPagesecScr: (BuildContext context) => const ConceptLandingPagesec(),
        persionalStoreNostoScr: (BuildContext context) => const PersionalStoreNosto(),
        zoompagescr: (BuildContext context) => Zoompage(img: "images/trendImg/trend.png"),
        // AmazonPay: (BuildContext context) =>  ChangeNotifierProvider(
        //   create: (context) => PaymentProvider(),
        //   child: const PaymentScreen(),),
      },
      initialRoute: splashScr,
      navigatorKey: navigatorKey,
      // home: const MyHomePage(title: 'Utsav Fashion'),
    );
  }
}

class MyColors {
  static const MaterialColor pink = MaterialColor(
    0xFFFF4CBB,
    <int, Color>{
      50: Color(0xFFFF4CBB),
      100: Color(0xFFFF4CBB),
      200: Color(0xFFFF4CBB),
      300: Color(0xFFFF4CBB),
      400: Color(0xFFFF4CBB),
      500: Color(0xFFFF4CBB),
      600: Color(0xFFFF4CBB),
      700: Color(0xFFFF4CBB),
      800: Color(0xFFFF4CBB),
      900: Color(0xFFFF4CBB),
    },
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    getLocation();
    _getAddress();

    passwordVisible = true;
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  var latitude, longitude;


  getLocation() async {
    // _getUserLocation();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    // latitude = position.latitude;
    // longitude = position.longitude;
    // Utils.latitude = position.latitude;
    // Utils.longitude = position.longitude;
    // setState(() {
    //
    // });
    developer.log('latitude :: ${position.latitude}');
    developer.log("longitude :: ${position.longitude}");
    _getAddress();
  }

  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];
      setState(() {
        var currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        var currentAdd = currentAddress;
         var loaction = place.country!;

        var Check_In_City = place.name;
        var Check_Out_City = place.name;
        var LocationPin = place.postalCode;
        print(currentAddress);
        //_Firstnametexteditingcontroller.text=_startAddress;

      });
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "images/welcome_icon.png",
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Forgot Your Password",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Please enter your email address below. You will receive a link to reset your password.",
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      // fontSize: 20,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                // fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Example@gmail.com'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                // fontSize: 20,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid password';
                              }
                              return null;
                            },
                            // onSaved: (val) => _password = val,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'XXXXXXXXXXXXXXX',
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      // const SizedBox(width: 5.0),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 12,
                            fontFamily: 'SourceSansPro'),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          child: const Text(
                            'Create an Account',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              // fontSize: 20,
                              // color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    width: 500,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColorpink, // background
                        ),
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        label: const Align(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              // color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
