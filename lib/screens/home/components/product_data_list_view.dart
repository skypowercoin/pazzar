import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:translator/translator.dart';

class Productlist extends GetView {
  Productlist({required pageurl});

  ProductController cont = Get.put(ProductController());
  final String _startlink = 'https://cdn.dsmcdn.com';
  final ScrollController _ScrollController = ScrollController();

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
                              controller: C.scrl,
                              itemCount: C.products.length,
                              itemBuilder: (context, index) =>
                                  buildproductList(index)),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }

  Widget buildproductList(int index) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        initState: (_) {},
        builder: (c) {
          return GestureDetector(
            onTap: () {
              print(index);

              print(c.products[0].ratingScore!.averageRating);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        color: Colors.lightBlue[200],
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                ///ty137/product/media/images/20210628/16/105165194/158083114/1/1_org_zoom.jpg'
                                child: Image.network(
                                  _startlink + c.products[index].images![0],
                                  height: 200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 150,
                                        child: Text(
                                            (c.products[index].name!)
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        color: Colors.white),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 70),
                                      child: Container(
                                          height: 25,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                'السعر' '  ' +
                                                    (roundDouble(
                                                            c
                                                                .products[index]
                                                                .price!
                                                                .sellingPrice!,
                                                            2))
                                                        .toString() +
                                                    '  ' +
                                                    'USD',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
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
