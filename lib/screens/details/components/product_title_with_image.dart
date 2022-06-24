import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/prudctviewcont.dart';
import 'package:pazar/models/apidatamodel.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends GetView {
  ProductTitleWithImage({
    Key? key,
    @required required this.product,
  }) : super(key: key);

  final Products product;
  final String _startlink = 'https://cdn.dsmcdn.com';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.name!,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            product.id.toString(),
            style: Theme.of(context).textTheme.button,
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price!.sellingPrice}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              GetBuilder<ProductView>(
                init: ProductView(),
                initState: (_) {},
                builder: (_) {
                  return Expanded(
                    child: Hero(
                      tag: "${product.id}",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          _.images.isEmpty
                              ? _startlink + product.images![0]
                              : _startlink + _.images[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
