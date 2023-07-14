import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/screens/Payment/SelectAddress/AddressBloc/address_bloc.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import '../../ShoppingBag/viewDetails.dart';
import '../addressform.dart';
import 'billingAddressSelected.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  var _selection = false;
  var _selection1 = false;

  @override
  void initState() {
    BlocProvider.of<AddressBloc>(context)
        .add(AddressEventHandler(Utils.userkey));
    super.initState();
  }

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
          title: Text(
            "Select a delivery address".toUpperCase(),
            style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 16,
                color: AppColors.Textcolorheading,
                fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/welcome_icon.png",
                height: 33,
                width: 36,
                // color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 10, 0, 0),
                  child: Column(
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Secure Checkout",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome, Umair Siddiqui",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "SHIPPING ADDRESS",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: AppColors.Textcolorheading,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height / 3,
                    color: AppColors.cardWhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selection = !_selection;
                                    });
                                  },
                                  child: _selection
                                      ? const Icon(Icons.radio_button_off)
                                      : const Icon(
                                          Icons.radio_button_checked,
                                          color: AppColors.primaryColorpink,
                                        ),
                                ),

                                // CircleAvatar(
                                //   radius: 5,
                                //   child: Text(
                                //     "",
                                //     style: TextStyle(
                                //         fontFamily: 'SourceSansPro',
                                //         fontSize: 14,
                                //         color: AppColors.Textcolorheading,
                                //         fontWeight: FontWeight.w600),
                                //   ),
                                // ),
                              ],
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
                            const Divider(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 56,
                              width: width,
                              child: ElevatedButton(
                                onPressed: () {
                                  // (Route<dynamic> route) => false);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BillingAddressSelected()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.primaryColorpink, // background
                                ),
                                child: const Text(
                                  "Deliver to this address",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 16,
                                      // color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(13, 10, 12, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selection1 = !_selection1;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selection1 = !_selection1;
                                });
                              },
                              child: _selection1
                                  ? const Icon(Icons.radio_button_off)
                                  : const Icon(
                                      Icons.radio_button_checked,
                                      color: AppColors.primaryColorpink,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    height: height / 15,
                    width: width / 1.2,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        border: Border.all(color: AppColors.bordergrey)),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Add a New Address',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w500,
                                  ))),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddressForm()));
                  },
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 1,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            // '',
                            '${Utils.currencySymbol + Utils.viewTotalModel!['grand_total'].toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "SourceSansPro",
                              fontWeight: FontWeight.w600,
                              color: AppColors.Textcolorheading,
                              // decoration: TextDecoration.lineThrough,
                            ),
                          )),
                      InkWell(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text.rich(
                            TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '${Utils.viewTotalModel!['items_qty'].toString()} Items',
                                  style: TextStyle(
                                    color: AppColors.Textcolorheading,
                                    fontSize: 14,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '          View Details',
                                  style: TextStyle(
                                    color: Color(0xFF2C8FEB),

                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewDetails(
                                        viewTotalModel: Utils.viewTotalModel,
                                      )));
                        },
                      ),
                      // Align(
                      //     alignment: Alignment.centerLeft,
                      //     child: Text("(Inclusive of all taxes)",
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //         ))),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox(
                    height: 56,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {
                        // (Route<dynamic> route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BillingAddressSelected()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColorpink, // background
                      ),
                      child: const Text(
                        "PLACE ORDER",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
