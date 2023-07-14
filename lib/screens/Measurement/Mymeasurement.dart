import 'package:flutter/material.dart';
import 'package:utsav/screens/Measurement/MyMesurement2.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class MyMeasurement extends StatefulWidget {
  const MyMeasurement({Key? key}) : super(key: key);

  @override
  State<MyMeasurement> createState() => _MyMeasurementState();
}

class _MyMeasurementState extends State<MyMeasurement> {
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
            ),
          ),
          title: NWidgets.kappbarheading(context, "MY MEASUREMENT"),

        ),
        body: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.bordergrey),
                    child: Image.asset(
                      'images/accountIcon/mesu.png',
                      scale: 2,
                      width: 30,
                      height: 25,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You have not SUBMITTED ANY MEASUREMENTS.".toUpperCase(),
                    style: const TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  SizedBox(
                    width: width / 1.8,
                    child: const Text(
                      "See your save product and other hot deals of your favorite items",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  SizedBox(
                    height: height * 0.067,
                    width: width * 362,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyMesurementtwo()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColorpink, // background
                      ),
                      child: const Text(
                        "ADD MEASUREMENT",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: AppColors.buttongrey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
