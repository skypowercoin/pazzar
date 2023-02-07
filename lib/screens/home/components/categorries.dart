import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/globalcontroller.dart';
import 'package:pazar/controler/items_controler.dart';
import 'package:pazar/controler/productscontroller.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class Categories extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  // Response of getElement is always List<Map<String, dynamic>>

  // By default our first item will be selecte
  int selectedIndex = 0;
  final cont = Get.put(CircleavatarController());
  final contp = Get.put(ProductController());
  final _Itemscontroler = Get.put(Itemscontroler());
  final gc = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return gc.catmodil.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: physicalHeight * 0.04,
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
          );
  }

  Widget buildCategory(int index) {
    return GetBuilder<GlobalController>(
      init: GlobalController(),
      initState: (_) {},
      builder: (C) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
                color: C.isSelected.value == index
                    ? Colors.pink[200]
                    : Colors.cyan,
                borderRadius: BorderRadius.circular(50.0)),
            child: GestureDetector(
              onTap: () {
                // ignore: avoid_print
                print('tapinggggggg');
                var link = selectedIndex = index;
                cont.removelist();
                cont.getcircleavatar(C.catlinks[index].links);
                _Itemscontroler.removesubitemslist();
                _Itemscontroler.getsubitems(C.catlinks[index].links);
                C.changecolor(index);
                contp.clearproducts();

                //C.changecolor(index, selectedIndex);

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
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              c.catmodil[index].titales,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


//////// How to transform Future<List<Map> to List<Map> in Dart language?
///https://stackoverflow.com/questions/44297839/how-to-transform-futurelistmap-to-listmap-in-dart-language