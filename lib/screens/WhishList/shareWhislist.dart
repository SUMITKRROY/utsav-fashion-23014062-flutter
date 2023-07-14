import 'package:flutter/material.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
 import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class ShareWishList extends StatefulWidget {
  const ShareWishList({Key? key}) : super(key: key);

  @override
  State<ShareWishList> createState() => _ShareWishListState();
}

class _ShareWishListState extends State<ShareWishList> {


  bool _validate = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
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
          title: NWidgets.kappbarheading(context, "SHARE your wishlist")),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: const [
                          Text(
                            "Email addresses, separated by commas",
                            style: FTextStyle.formfieldHeadingText16,
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: nameController,
                      maxLines: 5,
                      // controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: '',
                        hintText: 'Please enter email address',
                        // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),


                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Message",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: AppColors.Textcolorheading,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Please enter your message',

                          // hintStyle: FTextStyle.chipstextStyle
                        // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: height * 0.067,
                      width: width ,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _text.text.isEmpty ? _validate = true : _validate = false;
                          });
                          // (Route<dynamic> route) => false);
                          //
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBarBottom(selectedIndex: 2)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColorpink, // background
                        ),
                        child: const Text(
                          "SHARE WISHLIST",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
