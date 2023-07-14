import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ReturnsScreen extends StatefulWidget {
  const ReturnsScreen({Key? key}) : super(key: key);

  @override
  State<ReturnsScreen> createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends State<ReturnsScreen> {
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
          title: NWidgets.kappbarheading(context, "Returns"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
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
                        "Cancellations & Returns",
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
                        "At Utsav Fashion, we strive to make sure you have the best experience while selecting and buying your favorite Indian Ethnic Outfits. Despite our best efforts to keep our customers happy, there are times when you might feel the need to return your product for circumstances beyond your or our control. We have listed everything below about our Cancellation and Refunds policy so that in case you do decide to cancel your order, or seek refunds, you do not face an iota of a problem.",
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
                        "Pre-Shipment Cancellations",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
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
                        "Q: Can I cancel my order in case I change my mind after ordering?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'A: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  ' Yes, you can choose to cancel all Non-Ready to Ship products, only if done within 24 hours of placing it. We will initiate 100% refund of your money and a confirmation of the same will be sent to you via e-mail, though we would have loved to have added a new Ethnic Fashion statement to your wardrobe.Please be apprised that Ready To Ship orders are not eligible for calcellations as they are despatched within 24 hours of the receipt of order.',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Q: Why a '24 Hour' deadline?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'A: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'As soon as your order is confirmed, action is initiated at our end. The process of picking, packaging,customizing and logistics start, and the ordered product in most cases has already passed through a couple of phases. In case a garment has to be readied, or customized, the process is already underway.',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  // color: AppColors.primaryColorblue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Q: And what if I cancel after 24 hours of ordering?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A: 1)',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Well, we have a provision for that too but do remember - orders cancelled post 24 hours of confirmation are dealt with on a case-to-case basis by our Customer Care team depending on the degree of process completion.',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '2) ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'We provide the refund for all such orders in the form of a Store Credit only. This Store Credit is redeemable on our Website within a stipulated period from time of issuance.',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '3) ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Please be apprised that it takes a maximum of 2 business days, post the receipt of your cancellation request, for us to cancel your order, and send you a notification via e-mail.',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q:  Could there be a delay at Utsav Fashion because of 'unforeseen circumstances'?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A:',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'We try our best to assure that your ordered products are shipped out to you in the promised time, but at times there are chances of delay in processing due to unavailibility of stock, or other unavoidable circumstances. In such a situation, we will send you a formal communication requesting you to :',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '1) ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Accept a Store Credit of equivalent value which you may use to purchase an alternate Ethnic Fashion Statement',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '2) ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Opt to receive a refund of your money. (To know more about Refunds, please click here)',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: But if I am unable to find an alternative Ethnic Fashion Statement?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text.rich(
                        TextSpan(
                          text: 'A: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'In such cases we ensure that a complete refund (inclusive of the product cost and shipping charges) is initiated at the earliest sans any deductions. We also offer a compensation by way of Store Credit or discount coupon depending upon the order value and delay in communication.',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 14,
                                  // color: AppColors.primaryColorblue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Q: Oops! I 'missed' adding a critical detail while placing the order. Possibility of correcting it?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A:',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'No worries. Such situations are often encountered when customers forget to :',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: '1) ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Update their complete shipping details;',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: '2) ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Update measurement attributes; or',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: '3) ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Verify or give their consent if required on certain pending notifications within the requested time',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'As a policy, we try and reach out to our esteemed customers via their registered e-mail address. In case of non-receipt of any response, we try and give them a call. If we do not get a response in 15 days, we issue a Non-refundable Store Credit against cancellation of the order which the customers can use to place future orders with us. We share an update on the same via email as well.',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Remember, we try and keep our customers posted at each and every stage of their order with us and it really helps to have your inputs at the right time.',
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Post shipment returns",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Q: I received the order. But there's an issue. Can I return my ordered items?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Yes you can. At Utsav Fashion, we don't believe in making customers, but strengthening our family with happy family members. We take stringent measures to deliver Fashion Delight to our customers globally, in the best possible condition but there's always a possibility that",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'a. ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Item(s) may get damaged during transit; or',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'b. ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "There may be a manufacturing defect which didn't get noticed during packing or",
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'c. ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'A wrong item is shipped out to you by mistake.',
                                    style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
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
                        "Q: How soon should I get back to you?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Please reach out to us within 48 hours of receiving the order for reporting any complaints with regards to the product received as damaged, found with manufacturing defect, or any other issues.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: In what scenarios would you not accept any returns?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Kindly be informed that any product purchased from our ‘Sale’ Section will not be returned under the Returns Policy except if it's an error on behalf relating to a manufacturing defect or a wrong item has been shipped out to you by mistake. We do not accept any returns if the product is dispatched to us after 7 days of receiving the shipment, so please make sure you report the matter to us, and dispatch the product at the earliest once we accept the return request.Kindly do not dispatch the products before receiving a 'Return Accepted' Confirmation email from us, we will not be able to entertain such requests.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: What are the steps of returning any item ordered from Utsav Fashion?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A: #1 - Informing Utsav Fashion \n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "In case you have any complaints regarding the product you have received, please ensure that you report it to us within 48 hours of receiving the product. ",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text:
                                  '#2 - Confirmation email from Utsav Fashion \n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "You will receive an acknowledgement e-mail from us on confirming a Return Authorisation, within 2-3 business days. Please do not ship items before you receive this email from us. We will be unable to process any 'Items Returned' without the Return Authorisation Reference. \n\nPlease note: In case needed, we'd request you for a digital picture of the item for our internal review to be able to process your request.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: '#3 - Shipping Back the Items \n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "When Shipping back the items: \n1. As would be advised in our return authorization e-mail, Please return the packet only through Registered Local Postal Service (with tracking facility and without insurance).\n2. All items must be returned in their original condition, with price tags intact, original accessories and in the original packaging as delivered to you. .\n3. Please do not forget to mark the packaging as 'Defective Items for Returns' and 'not for sale'.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text:
                                  '#4 - Item Receipt and Inspection at Utsav Fashion Warehouse \n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "As a policy, our teams shall examine the products on return and identify the defects/variation as indicated by you.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text:
                                  '#5 - Proposed solutions post receipt of returned items \n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Post inspection of returned item(s), our Customer Care team will propose remedial solutions to you on a case to case basis: \na. Choosing an alternate Ethnic Treasure as a replacement of equal value \nb. a Store Credit to be used later for shopping on Utsav Fashion \nc. a Refund as decided on a case to case basis",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: What will be my options if there was an error by Utsav Fashion?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      " We will duly acknowledge the issue and you would always be welcome to decide from proceeding with: \n1. An Item Replacement \n2. Issuance of a Store Credit \n3. A Refund of order value",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: What will be the value of Refund/Store Credit in case I opt for the same?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "100% of the value of the goods including Shipping Costs and Stitching charges (as applicable) will be ensured.In any case, the refunds will not exceed the actual amount paid by you.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: But I had to pay the courier service for Shipping the item back!",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "If we end up making an error in spite of best efforts, the extra shipping cost incurred during the return of the product will be refunded. In any other case, the Shipping Charges and other expenses would be borne by you.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: That’s great. But are there any reasons you might not provide me with all 3 options or no option?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Utsav Fashion's Customer Care representative will reach out to you with limited alternatives for below cases:\n1. If you do choose to return the product for any reason apart from an inadvertent mistake from our side.The refund will be processed in the form of a Store Credit redeemable during your next purchase with Utsav Fashion. In case you had opted for Free Stitching or Free Shipping scheme while ordering the item under question, the Cost of Shipping and Stitching will be deducted from the refund amount.\n2. If there was a Delay due to God’s or the Government’s Intervention There are times when the delivery of the goods is delayed due to unforeseen circumstances such as natural calamity, public holiday, etc. In such a case Utsav Fashion shall not refund, return or exchange any order on request.\n3. In case you realise that you might have made an error while ordering or providing measurements, we would ask you to bear the additional charges of shipping and stitching, and in very rare cases cost of replacement of fabric, if any.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: How long does it usually take for Returned Items to reach back to the Utsav Fashion Warehouse?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "International shipments usually take between 6 to 8 weeks in transit if done through postal service. Any shipment returned within India takes 3-4 days to reach if sent through DTDC. Exact time taken for transit would depend on the nature of the product and your location.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "MORE DETAILS ABOUT REFUNDS",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
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
                        "Q: I'm thinking about seeking a Refund. Are there any specific points to know?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "The Refund will be initiated within 2 (business) days if you choose this option, which will   be credited back to you as per your bank/credit card guidelines.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
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
                        "Q: And how long will the refund process take?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Payments and Transfers are dependent on Banks and Local Laws. We've still attempted to estimate the time it might take to get your funds reimbursed below:",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Column(children: <Widget>[
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Column(children: const [
                              Text('Mode of Payment Return',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0))
                            ]),
                            Column(children: const [
                              Text('Resolution Time',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0))
                            ]),
                            Column(children: const [
                              Text('Refund Mode',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0))
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: const [
                              Text(
                                'Credit Card',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                '3-4 business days from the Date of Initiation',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                'Credit Card',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: const [
                              Text(
                                'Debit Card',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                '3-4 business days from the Date of Initiation',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                'Debit Card',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: const [
                              Text(
                                'Wire-CITI',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                '2 business days from the Date of Initiation',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                'Wire',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: const [
                              Text(
                                'COD',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                '2 business days from the Date of Initiation',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                'NEFT',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: const [
                              Text(
                                'DBD-ICICI',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                '2 business days from the Date of Initiation',
                                textAlign: TextAlign.center,
                              )
                            ]),
                            Column(children: const [
                              Text(
                                'NEFT',
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ]),
                        ],
                      ),
                    ])),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Q: What about charges levied by Banks, Credit Cards companies and Local Taxes?",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: const [
                          Text.rich(
                            TextSpan(
                              text: 'A: Credit Card Fees:\n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Please note that Credit Card refunds involve an admin/credit card commission of 10% of the final order value (5% while accepting and 5% while refunding). This cost will be deducted from the value of the refund.\nAn alternate solution is an Utsav Fashion Store Credit, which nullifies the Credit Card Commission charge and therefore makes it possible for us to issue a Store Credit equivalent to the final accepted value of creditable funds.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Bank Transfers:\n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "For orders placed using Bank Transfers, refunds would be issued only as Store Credits.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'International Transaction Fees:\n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Cross Border or, International Transaction Fees, if any charged by the respective bank from your credit or debit card will not be refunded. Please note these are hidden charges levied by your bank on you, and not by us. Customers must contact their bank for additional information on these charges",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Local Taxes:\n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "The VAT / Custom Duty / Local Taxes / Import Duties are borne directly by the customer as per local laws, to be paid at the time of delivery as advised by the respective courier partner. We will not refund any such charges, if applicable during order delivery.\n\nFeeling dazed? Don't fret, you can reach out to our Customer Care Representatives for a step-by-step clarity on all points above by:",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'By Mail\n',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SourceSansPro",
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Utsav Fashion Pvt. Ltd.,\nD 112, Phase1, Okhla\nNew Delhi - 110020, India\nIn case you have any issues or concerns, please reach out to us via Live Chat or visit the UtsavFashion.co\nHelpDesk.",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
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
