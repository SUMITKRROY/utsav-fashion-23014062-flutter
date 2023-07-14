import 'package:flutter/material.dart';
import 'package:utsav/screens/Order/Emptymyorder.dart';
import 'package:utsav/screens/WhishList/shareWhislist.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class Myorder extends StatefulWidget {
  const Myorder({Key? key}) : super(key: key);

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  MediaQuery(
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
            title: NWidgets.kappbarheading(context,"My order")

        ),
        body: Scaffold(
          // resizeToAvoidBottomInset: false,
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
                      // border: Border.all(color: Colors.grey, width: 1),
                        shape: BoxShape.circle,
                        color: AppColors.bordergrey),
                    child: Image.asset(
                      'images/orders.png',
                      scale: 4,
                      // width: width * 0.060,
                      width: 30,
                      height: 25,
                      // color: AppColors
                      //     .primaryColorpink,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10,),
                  Text("You have placed no orders.".toUpperCase(),style: const TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),),
                  SizedBox(height: height*0.010,),
                  SizedBox(
                    width: width/1.8,
                    child: const Text("Please continue shopping to see your products here!",
                      textAlign: TextAlign.center,style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,),),
                  ),
                  SizedBox(height: height*0.040,),
                  SizedBox(
                    // height: 67,
                    // width: 362,
                    height: height * 0.067,
                    width: width * 362,
                    child: ElevatedButton(
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                        //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Emptymyorder()));
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('Processing Data')),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColorpink, // background
                      ),
                      child: const Text(
                        "ORDER NOW",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: AppColors.buttongrey,
                            fontWeight: FontWeight.w700),
                      ),
                      // icon: const Icon(
                      //   Icons.arrow_back,
                      // ),

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
