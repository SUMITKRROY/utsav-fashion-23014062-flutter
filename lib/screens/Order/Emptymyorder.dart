import 'package:flutter/material.dart';
import 'package:utsav/screens/Order/oderdetails.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class Emptymyorder extends StatefulWidget {
  const Emptymyorder({Key? key}) : super(key: key);

  @override
  State<Emptymyorder> createState() => _EmptymyorderState();
}

class _EmptymyorderState extends State<Emptymyorder> {
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
            title: NWidgets.kappbarheading(context, "My order")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "MY ORDERS",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Divider(
                        height: height * 0.010,
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: const Text(
                                    'View Order',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: const Text(
                                    'View Order',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: const Text(
                                    'View Order',
                                    style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      color: AppColors.underlineTextcolorheading,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                    child: const Text(
                                      'View Order',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.underlineTextcolorheading,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                    child: const Text(
                                      'View Order',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.underlineTextcolorheading,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                    child: const Text(
                                      'View Order',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.underlineTextcolorheading,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                    child: const Text(
                                      'View Order',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.underlineTextcolorheading,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Order #:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.150,
                                ),
                                const Text(
                                  'MU200001205',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Date:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.20,
                                ),
                                const Text(
                                  '11/25/22',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Grand Total:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.080,
                                ),
                                const Text(
                                  'INR 2,500',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    // color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Order Status:',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.060,
                                ),
                                const Text(
                                  'Order work in progress',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                // SizedBox(width: width*0.080,),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                    child: const Text(
                                      'View Order',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.underlineTextcolorheading,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const OrderDetails()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Divider(
                              height: height * 0.010,
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrderDetails()));
                        },

                      ),





                    ],
                  ),
                  SizedBox(
                    height: height * 0.020,
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
