import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/utils/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 310,
                      height: 60,
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColorpink),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColorpink),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Search here...',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.primaryColorpink),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Icon(Icons.search, size: 30),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  NWidgets.kheadingsearch(context, "Most Searched Categories"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 125,
                          height: height * 0.050,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey, width: 1),
                            shape: BoxShape.rectangle,
                            color: color,
                          ),
                          child: const Center(
                            child: Text("Wedding Sarees",
                                style: FTextStyle.chipstextStyle),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            color =
                                AppColors.primaryColorpink.withOpacity(0.10);
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Container(
                          width: 125,
                          height: height * 0.050,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey, width: 1),
                            shape: BoxShape.rectangle,
                            color: color,
                          ),
                          child: const Center(
                            child: Text("Wedding Sarees",
                                style: FTextStyle.chipstextStyle),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            color =
                                AppColors.primaryColorpink.withOpacity(0.10);
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NWidgets.kheadingsearch(context, "Popular Searches"),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              child: Container(
                                width: 125,
                                height: height * 0.050,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    shape: BoxShape.rectangle,
                                    color: Colors.white),
                                child: const Center(
                                    child: Text("Wedding Sarees",
                                        style: FTextStyle.chipstextStyle)),
                              ),
                              onTap: () {}),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              child: Container(
                                width: 125,
                                height: height * 0.050,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    shape: BoxShape.rectangle,
                                    color: Colors.white),
                                child: const Center(
                                    child: Text("Wedding Sarees",
                                        style: FTextStyle.chipstextStyle)),
                              ),
                              onTap: () {}),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Row(
                        children: [
                          InkWell(
                              child: Container(
                                width: 125,
                                height: height * 0.050,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    shape: BoxShape.rectangle,
                                    color: Colors.white),
                                child: const Center(
                                    child: Text("Peach Saree",
                                        style: FTextStyle.chipstextStyle)),
                              ),
                              onTap: () {}),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              child: Container(
                                width: 125,
                                height: height * 0.050,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    shape: BoxShape.rectangle,
                                    color: Colors.white),
                                child: const Center(
                                    child: Text("Cotton Silk Saree",
                                        style: FTextStyle.chipstextStyle)),
                              ),
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NWidgets.kheadingsearch(context, "Popular Collections"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                          child: Container(
                            width: 125,
                            height: height * 0.050,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                shape: BoxShape.rectangle,
                                color: Colors.white),
                            child: const Center(
                                child: Text("Wedding Sarees",
                                    style: FTextStyle.chipstextStyle)),
                          ),
                          onTap: () {}),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          child: Container(
                            width: 125,
                            height: height * 0.050,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                shape: BoxShape.rectangle,
                                color: Colors.white),
                            child: const Center(
                                child: Text("Wedding Sarees",
                                    style: FTextStyle.chipstextStyle)),
                          ),
                          onTap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                          child: Container(
                            width: 125,
                            height: height * 0.050,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                shape: BoxShape.rectangle,
                                color: Colors.white),
                            child: const Center(
                                child: Text("Wedding Sarees",
                                    style: FTextStyle.chipstextStyle)),
                          ),
                          onTap: () {}),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          child: Container(
                            width: 125,
                            height: height * 0.050,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                shape: BoxShape.rectangle,
                                color: Colors.white),
                            child: const Center(
                                child: Text("Wedding Sarees",
                                    style: FTextStyle.chipstextStyle)),
                          ),
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
