import 'package:flutter/material.dart';
import 'package:utsav/screens/AddressBook/AddNewAddress.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';


class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
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
          title: NWidgets.kappbarheading(context, "ADDRESS BOOK"),
        ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Abhinav Gupta",
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "D-115",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Okhla Phase-1",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "NEW DELHI,DELHI, 110020",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "India",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone number: 9936595085",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  height: 38,
                                  width: 145,
                                  // margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.bordercontainergreyinside,
                                      border: Border.all(
                                          color: AppColors.bordergrey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Edit Address",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddNewAddress()));
                                },
                              ),
                              Container(
                                height: 38,
                                width: 145,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    color: AppColors.bordercontainergreyinside,
                                    border: Border.all(
                                        color: AppColors.bordergrey)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Delete Address",
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: height * 0.010,
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Umair Siddiqui",
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "D-115",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Okhla Phase-1",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "NEW DELHI,DELHI, 110020",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "India",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone number: 9936595085",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  height: 38,
                                  width: 145,
                                  // margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.bordercontainergreyinside,
                                      border: Border.all(
                                          color: AppColors.bordergrey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      // RoundCheckBox(
                                      //   checkedColor: AppColors.primaryColorpink,
                                      //   size: 15,
                                      //   onTap: (selected) {},
                                      // ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Edit Address",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddNewAddress()));
                                },
                              ),
                              Container(
                                height: 38,
                                width: 145,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    color: AppColors.bordercontainergreyinside,
                                    border: Border.all(
                                        color: AppColors.bordergrey)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    // RoundCheckBox(
                                    //   checkedColor: AppColors.primaryColorpink,
                                    //   size: 15,
                                    //   onTap: (selected) {},
                                    // ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Delete Address",
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: height * 0.010,
                      // ),
                    ],
                  ),
                  Divider(
                    height: height * 0.010,
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  InkWell(
                    child: Container(
                      height: height / 18,
                      width: width,
                      // margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: AppColors.bordercontainergreyinside,
                        border: Border.all(color: AppColors.bordergrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Add a New Address',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewAddress()),
                      );
                    },
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
