import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class MyNotificationExplore extends StatefulWidget {
  const MyNotificationExplore({Key? key}) : super(key: key);

  @override
  State<MyNotificationExplore> createState() => _MyNotificationExploreState();
}

class _MyNotificationExploreState extends State<MyNotificationExplore> {
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
            title: NWidgets.kappbarheading(context, "My notifications")),
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
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Id tellus sapien viverra laoreet vulputate. Vitae est volutpat adipiscing neque blandit libero dui consectetur elementum. Ac nec in faucibus nunc donec nulla malesuada eget ut.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "03 Feb 2023  14:23 PM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
