import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/globalcontroller.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/screens/home/components/body.dart';

import '../../../constants.dart';
import 'product_data_list_view.dart';

// We need satefull widget for our categories

class Categories extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  // Response of getElement is always List<Map<String, dynamic>>

  // By default our first item will be selecte
  int selectedIndex = 0;
  final cont = Get.put(CircleavatarController());
  final contp = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: physicalHeight * 0.03,
            child: GetBuilder<GlobalController>(
              init: GlobalController(),
              initState: (_) {},
              builder: (c) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: c.catmodil.length,
                  itemBuilder: (context, index) => buildCategory(index),
                );
              },
            ),
          ),
        ),
        GetBuilder<CircleavatarController>(
          init: CircleavatarController(),
          initState: (_) {},
          builder: (_) {
            return Container(
              height: physicalHeight * 0.0618,
              color: Colors.red[50],
              child: Circlecatge(
                pageurl: '', //['attributes']['href'],
              ),
            );
          },
        ),
        Container(
            height: physicalHeight * 0.0618 * 5.3,
            color: Colors.red[500],
            child: Productlist(
              pageurl: '/adidas-erkek-x-b33-g2',
            )),
      ],
    ));
  }

  Widget buildCategory(int index) {
    return GetBuilder<GlobalController>(
      init: GlobalController(),
      initState: (_) {},
      builder: (C) {
        return GestureDetector(
          onTap: () {
            var link = C.catlinks[index].links;
            var l = C.catmodil.length;
            selectedIndex = index;
            cont.removelist();
            cont.getcircleavatar(link);

            print(C.catlinks[index].links);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<GlobalController>(
                  init: GlobalController(),
                  initState: (_) {},
                  builder: (c) {
                    return Container(
                        child: Text(
                      c.catmodil[index].titales,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ));
                  },
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                  height: physicalHeight * 0.002,
                  width: 15,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


//////// How to transform Future<List<Map> to List<Map> in Dart language?
///https://stackoverflow.com/questions/44297839/how-to-transform-futurelistmap-to-listmap-in-dart-language