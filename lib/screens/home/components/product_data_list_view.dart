import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/constants.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';

class Productlist extends StatefulWidget {
  Productlist({required pageurl});

  @override
  _productlistState createState() => _productlistState();
}

class _productlistState extends State<Productlist> {
  ProductController cont = Get.put(ProductController());

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
                    flex: 1,
                    child: GetBuilder<ProductController>(
                      init: ProductController(),
                      initState: (_) {},
                      builder: (C) {
                        return Container(
                            height: 110,
                            color: Colors.red[500],
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) =>
                                    buildproductList(index)));
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
              print(c.result);
              cont.getproductdetails('');
              print(c.products[0].images![0]);
              print('image link');
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
                                  'https://cdn.dsmcdn.com/ty137/product/media/images/20210628/16/105165194/158083114/1/1_org_zoom.jpg',
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
                                        child: Text('price'),
                                        color: Colors.white),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 70),
                                      child: Container(
                                          height: 25,
                                          width: 150,
                                          child: Text('cont.products[index]'),
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
