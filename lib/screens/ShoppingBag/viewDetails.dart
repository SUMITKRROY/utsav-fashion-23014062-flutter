import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/screens/Payment/SelectAddress/selectAdress.dart';
 import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/utils.dart';
import 'package:utsav/utils/widgets.dart';
import 'package:html/parser.dart';

import '../Payment/SelectAddress/AddressBloc/address_bloc.dart';

class ViewDetails extends StatefulWidget {


  Map<String, dynamic> viewTotalModel;
    ViewDetails({Key? key, required this.viewTotalModel}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {


//here goes the function


  var discountflag = false;
  var discountValue= '25' ;


  @override
  void initState() {
      var dicountammount = Utils.viewTotalModel!['discount_amount'].toString().replaceAll('-', '');
      double doubleamount = double.parse(dicountammount);
      double doubleamount1 = double.parse(Utils.viewTotalModel!['grand_total'].toString());
    discountValue =  calculatePercentageDiscount( doubleamount1,doubleamount);
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
          title: NWidgets.kappbarheading(context, "Order Summary"),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "images/welcome_icon.png",
                height: 33,
                width: 36,
                // color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NavBarBottom(selectedIndex: 0,)));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: height / 2,
                color: AppColors.cardWhite,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(8.0),
                // decoration: BoxDecoration(
                // border: Border.all(color: Colors.black)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Discount Code",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 1.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: '  Enter Code',
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(width: 4),
                            SizedBox(
                              height: 50,
                              width: 115,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.primaryColorpink),
                                    foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                            side: BorderSide(
                                                color: AppColors
                                                    .primaryColorpink)))),
                                // style: ButtonStyle(
                                //   // shape: ,
                                //   backgroundColor: MaterialStateProperty.all(AppColors.primaryColorpink),
                                // ),
                                child: const Text(
                                  "APPLY",
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),



                    const Divider(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Available Coupons",
                        style: FTextStyle.H1Headings15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [

                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  00, 0, 20, 0), //paddings of outer Container
                              child: DottedBorder(
                                color: Colors.black, //color of dotted/dash line
                                strokeWidth: 1, //thickness of dash/dots
                                dashPattern: const [5, 3],
                                //dash patterns, 10 is dash width, 6 is space width
                                child: Container(
                                  color: Colors.white,
                                  //inner container
                                  height:
                                      height / 25, //height of inner container
                                  // width: double.infinity, //width to 100% match to parent container.
                                  width: width /
                                      4, //width to 100% match to parent container.
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text.rich(
                                      TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              // fontSize: 16,
                                              fontFamily: "SourceSansPro",
                                              fontWeight: FontWeight.w600,
                                              // decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'FSTITCH ',
                                            style: TextStyle(
                                              color: AppColors.pricecolor,
                                              fontSize: 16,
                                              fontFamily: "SourceSansPro",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              // fontSize: 16,
                                              fontFamily: "SourceSansPro",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        const Text.rich(
                          TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Free Ready to Wear Stitching ',
                                
                                style: FTextStyle.decStyle,
                               
                              ),
                              TextSpan(
                                text: '(Apply)',
                                style: TextStyle(
                                  color: AppColors.underlineTextcolorheading,
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Order Summary",
                        style: FTextStyle.decStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children:   [
                        Text(
                          "Subtotal",
                          style: FTextStyle.decStyle,
                        ),
                        Spacer(),
                        Text(
                          '${Utils.currencySymbol+widget.viewTotalModel['subtotal'].toString()}',
                          style: FTextStyle.decStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [

                        InkWell(
                          onTap: (){
                            setState(() {
                              discountflag=!discountflag;
                            });

                          },
                          child: Text(
                            discountflag?"Discount - ":"Discount +",
                            style: FTextStyle.decStyle,
                          ),
                        ),
                        const Spacer(),
                          Text(
                          '${Utils.currencySymbol+widget.viewTotalModel['discount_amount'].toString()}',
                          style: FTextStyle.decStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    discountflag?
                          Text(
                          Utils.parseHtmlString(widget.viewTotalModel['total_segments'][1]['title']),
                          style: FTextStyle.decStyle,
                        )
                     :const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children:   [
                        Text(
                          "Shipping & Handling  ",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text.rich(
                            TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                  text:'${Utils.currencySymbol+widget.viewTotalModel['total_segments'][2]['value'].toString()}',
                                  
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                TextSpan(
                                  text: ' FREE',
                                  style: TextStyle(
                                    color: AppColors.pricecolor,
                                    fontSize: 16,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
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
                    Row(
                      children:   [
                        Text(
                          "Grand Total  ",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                            '${Utils.currencySymbol + Utils.viewTotalModel!['grand_total'].toString()}',

                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(
                            0, 0, 0, 0), //paddings of outer Container
                        child: DottedBorder(
                          color: Colors.black, //color of dotted/dash line
                          strokeWidth: 1, //thickness of dash/dots
                          dashPattern: const [5, 3],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            color: Colors.white,
                            //inner container
                            height: height / 28, //height of inner container
                            // width: double.infinity, //width to 100% match to parent container.
                            width:
                                width, //width to 100% match to parent container.
                            child:   Align(
                              alignment: Alignment.center,
                              child: Text.rich(
                                TextSpan(
                                  text: '',
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'You save',
                                      style: FTextStyle.decStyle,
                                    ),
                                    TextSpan(
                                      text:
                                      " $discountValue% "  ,
                                      style: TextStyle(
                                        color: AppColors
                                            .underlineTextcolorheading,
                                        fontSize: 13,
                                        fontFamily: "SourceSansPro",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' on this purchase',
                                      style: FTextStyle.decStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: height * 0.010,
                    ),
                  ],
                ),
              ),
              Container(
                  width: width,
                  height: height / 10,
                  decoration:   const BoxDecoration(
                    image:   DecorationImage(
                      image:
                          ExactAssetImage('images/shoppingbag/baneshoping.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Container(
                height: height * 0.063,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                  ],
                ),
              ),
            ],
          ),
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
                    children:     [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${Utils.currencySymbol + Utils.viewTotalModel!['grand_total'].toString()}',
                            // '${Utils.currencySymbol + Utils.viewTotalModel!['items_qty'].toString()}',
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
                                  text: '${Utils.viewTotalModel!['items_qty'].toString()} Items',
                                  style: TextStyle(
                                    color: AppColors.Textcolorheading,
                                    fontSize: 14,
                                    fontFamily: "SourceSansPro",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),


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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                         create: (context) => AddressBloc(),
                         child: SelectAddress(),
                      )));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColorpink, // background
                      ),
                      child: const Text(
                        "GO TO CHECKOUT",
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


  String calculatePercentageDiscount(double originalPrice, double discountedPrice) {
    double difference = originalPrice - discountedPrice;
    double percentageDiscount = (difference / originalPrice) * 100;
    return percentageDiscount.toStringAsFixed(2);
  }
}
