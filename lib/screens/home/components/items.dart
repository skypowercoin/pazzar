import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/items_controler.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

// We need satefull widget for our categories

class Items extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  // Response of getElement is always List<Map<String, dynamic>>

  // By default our first item will be selecte
  int selectedIndex = 0;

  final contp = Get.put(ProductController());
  final itemscontroler = Get.put(Itemscontroler());

  Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 6.h,
            child: GetBuilder<Itemscontroler>(
              init: Itemscontroler(),
              initState: (_) {},
              builder: (c) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: c.itemstitel.length,
                  itemBuilder: (context, index) => buildsubiteams(index),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildsubiteams(int index) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (poc) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
                color: itemscontroler.isitemSelected.value == index
                    ? Colors.green[100]
                    : Colors.orange[200],
                borderRadius: BorderRadius.circular(50.0)),
            child: GestureDetector(
              onTap: () {
                print('get to product page');
                var link = itemscontroler.itemsinks[index].links;
                poc.clearproducts();
                poc.getproductdetails(link);

                itemscontroler.changetemScolor(index);

                print(itemscontroler.itemsinks[index].links);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<Itemscontroler>(
                      init: Itemscontroler(),
                      initState: (_) {},
                      builder: (Itemscontroler) {
                        return Container(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              Itemscontroler.itemstitel[index].titales,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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