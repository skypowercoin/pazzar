import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/models/apidatamodel.dart';

import '../../../constants.dart';

class ItemCard extends GetView {
  final Products product;
  final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                /// add product colcors product.pcolor
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network(product.images![0]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.productGroupId.toString(),
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
