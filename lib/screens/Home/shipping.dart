import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';

class Shipping extends StatefulWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
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
          title: const Text(
            "Shipping",
            style: TextStyle(color: Colors.black),
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
                    const Divider(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "FREE SHIPPING WITHIN INDIA",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Where All Do We Deliver?",
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "We deliver to all and any postal address around the India. Courier companies do not deliver to P.O.Box address, so we request you to provide full street address with pin code / zip code.Our courier agents are DTDC / BLUEDART / Delhivery / Indiapost. etc",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No deliveries are made on Saturdays and Sundays in most cities as they follow a 5 day work culture. Some times we can try to organise deliveries on Saturdays also on some extra cost on case to case basis.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 65,
                          decoration: const BoxDecoration(
                            // color: Colors.cyan,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/shipping/bd.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 65,
                          decoration: const BoxDecoration(
                            // color: Colors.cyan,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/shipping/dtdc.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 65,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/shipping/delhiv.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 40,
                          width: 65,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/shipping/indpost.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No deliveries are made on Saturdays and Sundays in most cities as they follow a 5 day work culture. Some times we can try to organise deliveries on Saturdays also on some extra cost on case to case basis.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            // color: AppColors.primaryColorblue,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Further, deliveries are generally made during normal working hours of courier companies and these vary from country to country.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please note that there are no shipments made from the store on Sundays and public holidays as our logistics partner,does not make any pick-ups on those days.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "If you ordered two or more items, you may receive them in multiple boxes on different days, because of varying item availability and shipping locations. Often, products will be shipped separately from one another for added safety in transit, so you may receive more than one delivery to your address.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Transit Times",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "If you ordered two or more items, you may receive them in multiple boxes on different days, because of varying item availability and shipping locations. Often, products will be shipped separately from one another for added safety in transit, so you may receive more than one delivery to your address.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Transit Risk",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UTSAV ships all parcels as fully insured at no extra cost to customers. If courier company fails to deliver, you do not suffer any loss. In-transit risk is all ours. But Utsav Fashion will not be responsible for lost and stolen packages or any full or partial damages to the package after being left at customer's address by postal / courier agency.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Shipment and Tracking Details",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "We will send you an email regarding the shipment of your order, as soon as the items are handed over to the Courier. These alert emails will contain the tracking number and courier companies website details along with expected date of delivery. You may also check the same on our order status page or, by logging in to the My Account section on our site. Tracking numbers for orders shipped might take 24 business hours to become active on the courier websites. Please report us within 24 hours, if you find any gap with respect to the parcel delivery.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
