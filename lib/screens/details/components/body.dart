import 'package:flutter/material.dart';
import 'package:pazar/constants.dart';
import 'package:pazar/models/market_pro.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Bodyy extends StatelessWidget {
  final Product product;

  const Bodyy({required this.product});
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: physicalHeight,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: physicalHeight * 0.3),
                  padding: EdgeInsets.only(
                    top: physicalHeight * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
