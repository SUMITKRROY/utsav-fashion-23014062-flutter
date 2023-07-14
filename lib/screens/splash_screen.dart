import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/screens/OnBorad/OnboardBloc/onboard_bloc.dart';
import 'package:utsav/screens/OnBorad/onBoardScreen.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/pref_utils.dart';

import 'Home/HomeBloc/home_bloc.dart';
import 'Welcome/WelcomeBloc/welcome_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3), () => navigateUser(context));
    Timer(
        const Duration(seconds: 3),
        () => navigateUser(context),
            // (Route<dynamic> route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Rectangle.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "images/SplashScreenLogo.png",
                            height: 132,
                            width: 132,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  navigateUser(BuildContext context) {
    if(PrefUtils.getUserkey().isNotEmpty){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>

              MultiBlocProvider(
                providers: [
                   BlocProvider(
                    create: (context) => WelcomeBloc(),

                  ),
                   BlocProvider(
                    create: (context) => OnboardBloc(),

                  ),
                   BlocProvider(
                    create: (context) => HomeBloc(),

                  ),
                ],
                child:  const OnBoardScreen(),

              )

             ),
              (Route<dynamic> route) => false
      );
    }else{
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>


              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => WelcomeBloc(),

                  ),
                  BlocProvider(
                    create: (context) => OnboardBloc(),

                  ),
                  BlocProvider(
                    create: (context) => HomeBloc(),

                  ),
                ],
                child:    const OnBoardScreen(),

              )

          ),
              (Route<dynamic> route) => false
      );

    }
  }
}
