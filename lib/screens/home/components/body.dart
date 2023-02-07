import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/productscontroller.dart';

class Circlecatge extends GetView {
  Circlecatge({Key? key, required pageurl}) : super(key: key);

  final cont = Get.put(CircleavatarController());
  final contp = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Stack(
          children: <Widget>[
            Scaffold(
              body: GetBuilder<CircleavatarController>(
                init: CircleavatarController(),
                initState: (_) {},
                builder: (_) {
                  return ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: _.images.length,
                      itemBuilder: (context, index) => buildcat(index));
                },
              ),
            ),
          ],
        )),
      ],
    ));
  }

  Widget buildcat(int index) {
    return GetBuilder<CircleavatarController>(
      init: CircleavatarController(),
      initState: (_) {},
      builder: (_) {
        return GestureDetector(
            onTap: () {
              contp.clearproducts();

              ///print(cont.imageslinks[index].titales);
              contp.getproductdetails(_.imageslinks[index].titales);
              // insert data her categorylist[index]['attributes']['href']
              //print(cont.images[index].titales);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8),
              child: CircleAvatar(
                //categorylist[index]['attributes']['src']
                child: Image.network(_.images[index].titales),
                radius: 30,
                backgroundColor: Colors.red[100],
              ),
            ));
      },
    );
  }
}
