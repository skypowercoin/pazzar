import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/controler/prudctviewcont.dart';
import 'package:pazar/screens/details/components/body.dart';
import 'package:sizer/sizer.dart';

class Productlist extends GetView {
  Productlist({required pageurl});

  ProductController cont = Get.put(ProductController());
  final String _startlink = 'https://cdn.dsmcdn.com';
  final ScrollController _ScrollController = ScrollController();
  final ProductView _conProductView = Get.put(ProductView());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: cont.result == null
            ? Center(
                child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: GetBuilder<ProductController>(
                      init: ProductController(),
                      initState: (_) {},
                      builder: (C) {
                        return Scaffold(
                          body: ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: C.scrl,
                              itemCount: C.products.length,
                              itemBuilder: (context, index) =>
                                  buildproductList(index, context)),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }

  Widget buildproductList(int index, context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        initState: (_) {},
        builder: (c) {
          return GestureDetector(
            onTap: () {
              _conProductView.onClose();

              Get.to(Bodyy(
                product: c.products[index],
              ));
              print(index);

              print(c.products[0].variants![0].attributeName);
              print(c.products[0].variants![0].attributeValue);
              print(c.products[0].variants![0].price);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: FadeInImage.assetNetwork(
                                    fadeInDuration: Duration(milliseconds: 200),
                                    height: 150,
                                    width: 33.w,
                                    placeholder: 'assets/images/loding.gif',
                                    fadeInCurve: Curves.bounceIn,
                                    image: _startlink +
                                        c.products[index].images![0]),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 50.w),
                                  child: SizedBox(
                                      child: IconButton(
                                    icon: const Icon(
                                        Icons.favorite_border_rounded),
                                    color: Colors.red,
                                    iconSize: 23,
                                    onPressed: () {
                                      print('product is loved');
                                    },
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 10.h,
                                      width: 50.w,
                                      child: Center(
                                        child: Text(
                                            (c.products[index].imageAlt)
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5.h,
                                  width: 30.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      height: 25,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                            'السعر' '  ' +
                                                (roundDouble(
                                                        c.products[index].price!
                                                            .sellingPrice!,
                                                        2))
                                                    .toString() +
                                                '  ' +
                                                'USD',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ]),
            ),
          );
        });
  }
}

/// round price from 00.000 to 0.00
double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
