import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shimmer/shimmer.dart';
import 'package:utsav/screens/Filter/FilterBloc/filter_bloc.dart';
import 'package:utsav/screens/Home/ProductDetails/ProductBloc/product_bloc.dart';
import 'package:utsav/screens/ShopPage/MixCategoryLandingPage.dart';
import 'package:utsav/screens/ShopPage/ShopBloc/shop_bloc.dart';
import 'package:utsav/utils/app_colors.dart';
import 'package:utsav/screens/NavScreen/navBarbottom.dart';
import 'package:utsav/utils/widgets.dart';
import 'dart:developer' as developer;
import '../../Model/RequestFilterModel.dart';
import '../../utils/utils.dart';

class FilterList extends StatefulWidget {
  String Subattribute_Id;

  String Sunatrribute_code;

  String condition_type;

  String SubCondition_type;

  String field;

  String Subfield;

  var value;

  String Subvalue;

  String heding;
  int Count;
  String pageSize;

  FilterList({
    Key? key,
    required this.Subattribute_Id,
    required this.Sunatrribute_code,
    required this.condition_type,
    required this.SubCondition_type,
    required this.field,
    required this.Subfield,
    required this.value,
    required this.Subvalue,
    required this.heding,
    required this.Count,
    required this.pageSize,
  }) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List colorsData = [
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.blue,
    Colors.black,
    Colors.brown,
    Colors.orange,
    Colors.teal,
    Colors.purpleAccent,
    Colors.blueGrey,
    Colors.tealAccent
  ];
  List colorsDataname = [
    'Green',
    'PinkAccent',
    'Blue',
    'Red',
    'Purple',
    'Yellow',
    'Blue',
    'Black',
    'Brown',
    'Orange',
    'Teal',
    'PurpleAccent',
    'BlueGrey',
    'TealAccent'
  ];
  List sizedata1 = [
    '28',
    '30',
    '32',
    '34',
    '36',
    '38',
    '40',
    '42',
    '44',
    '46',
    '48',
    '50',
    '52',
    '54'
  ];
  List sizedata = [
    '42',
    '44',
    '46',
    '48',
    '50',
    '52',
    '54',
    '56',
    '58',
    '60',
    '62',
    '64',
    '66',
    '68'
  ];
  int selectedColor = 0;

  String dropdownvalue = 'Item 1';
  late List<bool> isChecked;

  late List<bool> isChecked1;

  List<RequestDatum> requestData = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FilterBloc>(context).add(FilterHandler(Utils.userkey));
    isChecked = List.generate(colorsData.length, (index) => false);
    isChecked1 = List.generate(sizedata.length, (index) => false);
  }

  bool? check1 = false; //true for checked checkbox, false for unchecked one
  List<bool> isExpanded1 = [];
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;
  bool isExpanded7 = false;
  bool isExpanded8 = false;
  bool isExpanded9 = false;
  bool isExpanded10 = false;
  bool isExpanded11 = false;
  bool isExpanded12 = false;

  List checkBoxSelect = [];

  List radioSelect = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            elevation: 0.5,
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
            title: NWidgets.kappbarheading(context, "FILTER")),
        body: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            if (state is FilterSuccess) {
              List<dynamic> filterData =
                  json.decode(state.filterModel!.items[0].content);
              // developer.log('filterData>>$filterData');

              /*   for (var element in filterData) {
                if (element['type'] == 'checkbox') {
                  for (var options in element['options']) {
                    // developer.log('checkbox_attribute>>${element['attribute_code']}');
                    // developer.log('checkbox_value>>${options['value']}');
                    checkBoxSelect.add({
                      'value': options['value'],
                      "categoryName": element['attribute_code']
                    });
                  }
                } else if (element['type'] == 'radio') {
                  for (var options in element['options']) {
                    // developer.log('radio_attribute>>${element['attribute_code']}');
                    // developer.log('radio_value>>${options['value']}');
                    radioSelect.add({
                      'value': options['value'],
                      "categoryName": element['attribute_code']
                    });
                  }
                } else {}
              }*/

              return Padding(
                // padding: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // SizedBox(height: 30,),
                    Expanded(
                      child: Container(
                        height: height,
                        child: ListView.builder(
                          itemCount: filterData.length,
                          itemBuilder: (BuildContext context, int index) {
                            isExpanded1 = List.generate(
                                filterData.length, (ind) => false);

                            return Visibility(
                              visible: filterData[index]['is_active'] == 'true',
                              child: ListTileTheme(
                                dense: true,
                                child: ExpansionTile(
                                  trailing: Icon(
                                    isExpanded1[index]
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                  title: Text(
                                    filterData[index]['title'],
                                    style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 15,
                                        color: AppColors.Textcolorheading,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Container(
                                        // padding: EdgeInsets.only(bottom: 5.0),
                                        // color: Colors.black12,
                                        color: Colors.white,
                                        child: filterData[index]['type'] ==
                                                'checkbox'
                                            ? GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemCount: filterData[index]
                                                        ['options']
                                                    .length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 4),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int ind) {
                                                  List<bool> isChecked;

                                                  isChecked = List.generate(
                                                      filterData[index]
                                                              ['options']
                                                          .length,
                                                      (ind) => false);
                                                  return ListTile(
                                                    onTap: () {
                                                      requestData.add(RequestDatum(
                                                          categoryName: filterData[
                                                                  index][
                                                              'attribute_code'],
                                                          value: filterData[
                                                                      index]
                                                                  ['options']
                                                              [ind]['value'],
                                                          type:
                                                              filterData[index]
                                                                  ['type'],
                                                          index: index,
                                                          lenght: filterData
                                                              .length));
                                                      for (var element
                                                          in requestData) {
                                                        print(
                                                            "===== ${element.categoryName})");
                                                        print(
                                                            "===== ${element.value})");
                                                        print(
                                                            "===== ${element.type})");
                                                        print(
                                                            "===== ${element.index})");
                                                      }
                                                      setState(() {
                                                        if (filterData[index]
                                                                ['type'] ==
                                                            "checkbox") {
                                                          if (checkBoxSelect
                                                              .any((element) =>
                                                                  element[
                                                                      'value'] ==
                                                                  filterData[index]
                                                                              [
                                                                              'options']
                                                                          [ind][
                                                                      'value'])) {
                                                            checkBoxSelect.removeWhere((element) =>
                                                                element[
                                                                    'value'] ==
                                                                filterData[index]
                                                                        [
                                                                        'options']
                                                                    [
                                                                    ind]['value']);
                                                          } else {
                                                            checkBoxSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          }
                                                        } else {
                                                          if (radioSelect.any((element) =>
                                                              element[
                                                                  'value'] ==
                                                              filterData[index][
                                                                      'options']
                                                                  [
                                                                  ind]['value'])) {
                                                            radioSelect.removeWhere((element) =>
                                                                element[
                                                                    'value'] ==
                                                                filterData[index]
                                                                        [
                                                                        'options']
                                                                    [
                                                                    ind]['value']);
                                                            radioSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          } else {
                                                            radioSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          }
                                                        }
                                                      });
                                                    },
                                                    title: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  height: 20,
                                                                  width: 20,
                                                                  // color: Colors.cyan,
                                                                  child: Icon(
                                                                    checkBoxSelect.any((element) =>
                                                                            element['value'] ==
                                                                            filterData[index]['options'][ind][
                                                                                'value'])
                                                                        ? Icons
                                                                            .check_circle
                                                                        : radioSelect.any((element) =>
                                                                                element['value'] ==
                                                                                filterData[index]['options'][ind]['value'])
                                                                            ? Icons.radio_button_checked_rounded
                                                                            : Icons.circle_outlined,
                                                                    color: AppColors
                                                                        .primaryColorpink,
                                                                  ) /*:Checkbox(
                                                            //only check box
                                                              value: isChecked[ind],
                                                              //unchecked
                                                              onChanged: (bool? value) {
                                                                //value returned when checkbox is clicked
                                                                setState(() {
                                                                  isChecked[ind] = value!;

                                                                  print('value>>>>$value');
                                                                });
                                                              }),*/
                                                                  ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['label']),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                shrinkWrap: true,
                                              )
                                            : ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemCount: filterData[index]
                                                        ['options']
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int ind) {
                                                  List<bool> isChecked;

                                                  isChecked = List.generate(
                                                      filterData[index]
                                                              ['options']
                                                          .length,
                                                      (ind) => false);
                                                  return ListTile(
                                                    // onTap: () {
                                                    //   requestData.add(RequestDatum(
                                                    //       categoryName: filterData[index]['attribute_code'],
                                                    //       value: filterData[index]['options'][ind]['value'],
                                                    //       type: filterData[index]['type']));
                                                    //   for (var element
                                                    //   in requestData) {
                                                    //     print("===== ${element
                                                    //         .categoryName})");
                                                    //     print("===== ${element
                                                    //         .value})");
                                                    //     print("===== ${element
                                                    //         .type})");
                                                    //
                                                    //     // if()
                                                    //     // checkBoxSelect.add(element.value);
                                                    //   }
                                                    // },
                                                    onTap: () {
                                                      setState(() {
                                                        if (filterData[index]
                                                                ['type'] ==
                                                            "checkbox") {
                                                          if (checkBoxSelect
                                                              .any((element) =>
                                                                  element[
                                                                      'value'] ==
                                                                  filterData[index]
                                                                              [
                                                                              'options']
                                                                          [ind][
                                                                      'value'])) {
                                                            checkBoxSelect.removeWhere((element) =>
                                                                element[
                                                                    'value'] ==
                                                                filterData[index]
                                                                        [
                                                                        'options']
                                                                    [
                                                                    ind]['value']);
                                                          } else {
                                                            checkBoxSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          }
                                                        } else {
                                                          if (radioSelect.any((element) =>
                                                              element[
                                                                  'value'] ==
                                                              filterData[index][
                                                                      'options']
                                                                  [
                                                                  ind]['value'])) {
                                                            radioSelect.removeWhere((element) =>
                                                                element[
                                                                    'value'] ==
                                                                filterData[index]
                                                                        [
                                                                        'options']
                                                                    [
                                                                    ind]['value']);
                                                            radioSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          } else {
                                                            radioSelect.add({
                                                              'value': filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['value'],
                                                              "categoryName":
                                                                  filterData[
                                                                          index]
                                                                      [
                                                                      'attribute_code']
                                                            });
                                                          }
                                                        }
                                                      });

                                                      // checkBoxSelect.add(value)
                                                    },
                                                    title: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  height: 20,
                                                                  width: 20,
                                                                  // color: Colors.cyan,
                                                                  child: Icon(
                                                                    checkBoxSelect.any((element) =>
                                                                            element['value'] ==
                                                                            filterData[index]['options'][ind][
                                                                                'value'])
                                                                        ? Icons
                                                                            .check_circle
                                                                        : radioSelect.any((element) =>
                                                                                element['value'] ==
                                                                                filterData[index]['options'][ind]['value'])
                                                                            ? Icons.radio_button_checked_rounded
                                                                            : Icons.circle_outlined,
                                                                    color: AppColors
                                                                        .primaryColorpink,
                                                                  ) /*:Checkbox(
                                                            //only check box
                                                              value: isChecked[ind],
                                                              //unchecked
                                                              onChanged: (bool? value) {
                                                                //value returned when checkbox is clicked
                                                                setState(() {
                                                                  isChecked[ind] = value!;

                                                                  print('value>>>>$value');
                                                                });
                                                              }),*/
                                                                  ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(filterData[
                                                                          index]
                                                                      [
                                                                      'options']
                                                                  [
                                                                  ind]['label']),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                shrinkWrap: true,
                                              ),
                                      ),
                                    ),
                                  ],
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      isExpanded1[index] = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    NWidgets.ksizedBox10(context),
                  ],
                ),
              );
            } else if (state is FilterFailure) {
              return Center(child: Text('Data not found'));
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                child: Padding(
                  // padding: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // SizedBox(height: 30,),
                      Column(
                        children: [
                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Color",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    // padding: EdgeInsets.only(bottom: 5.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: colorsData.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 4),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    // color: Colors.cyan,
                                                    child: Checkbox(
                                                        //only check box
                                                        value: isChecked[index],
                                                        //unchecked
                                                        onChanged:
                                                            (bool? value) {
                                                          //value returned when checkbox is clicked
                                                          setState(() {
                                                            isChecked[index] =
                                                                value!;
                                                          });
                                                        }),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    height: 18,
                                                    width: 18,
                                                    child: FloatingActionButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedColor = index;
                                                        });
                                                      },
                                                      backgroundColor:
                                                          colorsData
                                                              .elementAt(index),
                                                      elevation: 0.0,
                                                      heroTag: null,
                                                      child: Icon(Icons.done,
                                                          color: index ==
                                                                  selectedColor
                                                              ? Colors.white
                                                              : colorsData
                                                                  .elementAt(
                                                                      index),
                                                          size: 0),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  InkWell(
                                                    child: Text(
                                                        colorsDataname[index]),
                                                    onTap: () {},
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded2 = value;
                                });
                              },
                            ),
                          ),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded2
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Type",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Printed Sarees",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Pakistani Suits",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Kurta Pyjama",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Bangles",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded2 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded3
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Price",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                "₹0.00 -${Utils.currencySymbol}1,999.99",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                "₹2,000.00 -${Utils.currencySymbol}3,999.99",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("₹4,000.00 and above",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded3 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded4
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Fabric",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Art Silk",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Poly Cotton",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Jacquard",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Dhoti Kurta",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Jacquard",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded4 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded5
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Occasion",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Festive",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Wedding",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded5 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),
                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded6
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Size",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    // padding: EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: sizedata1.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 4),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    // color: Colors.cyan,
                                                    child: Checkbox(
                                                        //only check box
                                                        value:
                                                            isChecked1[index],
                                                        //unchecked
                                                        onChanged:
                                                            (bool? value) {
                                                          //value returned when checkbox is clicked
                                                          setState(() {
                                                            isChecked1[index] =
                                                                value!;
                                                          });
                                                        }),
                                                  ),
                                                  // SizedBox(width: 10,),

                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    sizedata1[index],
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              // Offstage(
                                              //   offstage: index != selectedColor,
                                              //   child: Text("Color Name"),
                                              // ),
                                            ],
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded6 = value;
                                });
                              },
                            ),
                          ),
                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded7
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Plus Size",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    // padding: EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: sizedata.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 4),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    // color: Colors.cyan,
                                                    child: Checkbox(
                                                        //only check box
                                                        value:
                                                            isChecked1[index],
                                                        //unchecked
                                                        onChanged:
                                                            (bool? value) {
                                                          //value returned when checkbox is clicked
                                                          setState(() {
                                                            isChecked1[index] =
                                                                value!;
                                                          });
                                                        }),
                                                  ),

                                                  // Container(
                                                  //   height: 14,
                                                  //   width: 14,
                                                  //   child: FloatingActionButton(
                                                  //     onPressed: (){
                                                  //       setState(() {
                                                  //         selectedColor = index;
                                                  //       });
                                                  //     },
                                                  //     child: Icon(Icons.done,color: index == selectedColor ? Colors.white :colorsData.elementAt(index),size: 0),
                                                  //     backgroundColor: colorsData.elementAt(index),
                                                  //     elevation: 0.0,
                                                  //     heroTag: null,
                                                  //   ),
                                                  // ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    sizedata[index],
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              // Offstage(
                                              //   offstage: index != selectedColor,
                                              //   child: Text("Color Name"),
                                              // ),
                                            ],
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded7 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded8
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Style",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Banarasi Silk",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Banarasi Silk",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Kanchipuram Silk",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Jamdani",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Bandhani",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded8 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded9
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Time to Dispatch",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Ready to Ship",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded9 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded10
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Work",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Buttons",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Traditional",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Woven",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Dhoti Kurta",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Jacquard",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded10 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded11
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Tailoring Options",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Customizable/Fabric",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Traditional",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Readymade",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Semi Stitched",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded11 = value;
                                });
                              },
                            ),
                          ),
                          // Divider(height: 10,color: Colors.black,),

                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              trailing: Icon(
                                isExpanded12
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                "Discount",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 15,
                                    color: AppColors.Textcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    // color: Colors.black12,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("10%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("11%-20%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("21%-30%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("31%-40%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("41%-50%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        NWidgets.ksizedBox15(context),
                                        Row(
                                          children: [
                                            RoundCheckBox(
                                              checkedColor:
                                                  AppColors.primaryColorpink,
                                              size: 15,
                                              onTap: (selected) {},
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("61%-70%",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              onExpansionChanged: (value) {
                                setState(() {
                                  isExpanded12 = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      NWidgets.ksizedBox10(context),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 56,
            // width: 320,
            child: ElevatedButton(
              onPressed: () {
                // (Route<dynamic> route) => false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => ShopBloc(),
                                ),
                                BlocProvider(
                                  create: (context) => ProductBloc(),
                                ),
                              ],
                              child: MixCategoryLandigPage(
                                heding: widget.heding,
                                field: widget.field,
                                value: widget.value,
                                Subfield: widget.Subfield,
                                Subvalue: widget.Subvalue,
                                Count: Utils.product_count,
                                Sunatrribute_code: widget.Sunatrribute_code,
                                Subattribute_Id: widget.Subattribute_Id,
                                pageSize: widget.pageSize,
                                condition_type: widget.condition_type,
                                SubCondition_type: widget.SubCondition_type,
                                filterdata: requestData,
                              ),
                            )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorpink, // background
              ),
              child: const Align(
                  child: Text(
                "APPLY",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 16,
                    // color: Colors.black,
                    fontWeight: FontWeight.w700),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

//
//
// Initial Selected Value
// String dropdownvalue = 'Item 1';
//
// // List of items in our dropdown menu
// var items = [
//   'Item 1',
//   'Item 2',
//   'Item 3',
//   'Item 4',
//   'Item 5',
// ];
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Geeksforgeeks"),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           DropdownButton(
//
//             // Initial Value
//             value: dropdownvalue,
//
//             // Down Arrow Icon
//             icon: const Icon(Icons.keyboard_arrow_down),
//
//             // Array list of items
//             items: items.map((String items) {
//               return DropdownMenuItem(
//                 value: items,
//                 child: Text(items),
//               );
//             }).toList(),
//             // After selecting the desired option,it will
//             // change button value to selected value
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownvalue = newValue!;
//               });
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
