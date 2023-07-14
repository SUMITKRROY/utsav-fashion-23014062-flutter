import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:utsav/utils/widgets.dart';

class Zoompage extends StatefulWidget {
  String img;
  Zoompage({Key? key, required this.img}) : super(key: key);
  @override
  State<Zoompage> createState() => _ZoompageState();
}

class _ZoompageState extends State<Zoompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "images/ccrossIcon.png",
              height: 22,
              width: 22,
              // color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.white,
          child: widget.img.contains("https")
              ? PhotoView(
                  basePosition: Alignment.center,
                  initialScale: PhotoViewComputedScale.contained * 1.4,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 1.8,
                  enableRotation: false,
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                  imageProvider: NetworkImage(widget.img))
              : PhotoView(
                  basePosition: Alignment.center,
                  initialScale: PhotoViewComputedScale.contained * 1.4,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 1.8,
                  enableRotation: false,
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                  imageProvider: AssetImage(widget.img),
                ),
        ),
      ),
    );
  }
}
