import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/productscontroller.dart';

class Circlecatge extends StatefulWidget {
  Circlecatge({Key? key, required pageurl}) : super(key: key);

  @override
  _CirclecatgState createState() => _CirclecatgState();
}

class _CirclecatgState extends State<Circlecatge> {
  final cont = Get.put(CircleavatarController());
  final contp = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: cont.images == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                        child: Stack(
                      children: <Widget>[
                        ListView.builder(
                            padding: EdgeInsets.only(bottom: 10),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: cont.images.length,
                            itemBuilder: (context, index) => buildcat(index)),
                      ],
                    )),
                  ],
                )),
    );
  }

  @override
  Widget buildcat(int index) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (pc) {
        return GestureDetector(
            onTap: () {
              pc.clearproducts();
              print(cont.imageslinks[index].titales);
              pc.getproductdetails(cont.imageslinks[index].titales);
              // insert data her categorylist[index]['attributes']['href']
              print(cont.images[index].titales);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8),
              child: CircleAvatar(
                //categorylist[index]['attributes']['src']
                child: Image.network(cont.images[index].titales),
                radius: 30,
                backgroundColor: Colors.red,
              ),
            ));
      },
    );
  }
}
