import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';



class NewLetterSubscription extends StatefulWidget {
  const NewLetterSubscription({Key? key}) : super(key: key);

  @override
  State<NewLetterSubscription> createState() => _NewLetterSubscriptionState();
}

class _NewLetterSubscriptionState extends State<NewLetterSubscription> {
  bool? check1 = true;
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
                // color: Colors.grey,
              ),
            ),
            title: NWidgets.kappbarheading(context, "Newsletter subscription")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "SUBSCRIPTION OPTION",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(height: height*0.010,),


                      SizedBox(
                        height: height * 0.020,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Checkbox( //only check box
                                  value: check1, //unchecked
                                  onChanged: (bool? value){
                                    //value returned when checkbox is clicked
                                    setState(() {
                                      check1 = value;
                                    });
                                  }
                              ),
                            ),
                            SizedBox(
                              width: width * 0.020,
                            ),
                            InkWell(
                              child: const Text(
                                'General Subscription',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  color: AppColors.underlineTextcolorheading,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              onTap: (){},
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  SizedBox(
                    // height: 67,
                    // width: 362,
                    height: height * 0.067,
                    width: width * 362,
                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        // primary: AppColors.primaryColorpink, // background
                        primary: AppColors.primaryColorpink,
                        // background
                      ),
                      child: const Align(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),

                  // Curation by Occasion
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
