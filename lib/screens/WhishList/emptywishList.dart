import 'package:flutter/material.dart';
import 'package:utsav/utils/app_colors.dart';



class EmptyWishList extends StatefulWidget {
  const EmptyWishList({Key? key}) : super(key: key);

  @override
  State<EmptyWishList> createState() => _EmptyWishListState();
}

class _EmptyWishListState extends State<EmptyWishList> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // var size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Center(
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
                    'images/navBarIcon/navWishlist.png',
                    scale: 2,
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
                const Text("You have nothing in WISHLIST",style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),),
                SizedBox(
                  width: width/1.8,
                  child: const Text("See your save product and other hot deals of your favorite items",
                    textAlign: TextAlign.center,style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
