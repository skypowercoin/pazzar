import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/constants.dart';
import 'package:pazar/controler/prudctviewcont.dart';
import 'package:pazar/models/apidatamodel.dart';
import 'package:pazar/screens/details/components/cart_counter.dart';
import 'package:sizer/sizer.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Bodyy extends GetView {
  final Products product;

  const Bodyy({required this.product});
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(height: 15.h, child: SmalPagevew(product: product)),
            ProductTitleWithImage(product: product),
            ColorAndSize(product: product),
            SizedBox(height: kDefaultPaddin / 2),
            Description(product: product),
            SizedBox(height: kDefaultPaddin / 2),
            CounterWithFavBtn(),
            SizedBox(height: kDefaultPaddin / 2),
            AddToCart(product: product),
          ],
        ));
  }
}

class SmalPagevew extends GetView {
  final ProductView _conProductView = Get.put(ProductView());
  SmalPagevew({
    Key? key,
    @required required this.product,
  }) : super(key: key);
  final Products product;
  final String _startlink = 'https://cdn.dsmcdn.com';

  Widget build(BuildContext context) {
    return SafeArea(
        child: product.images == null
            ? Center(
                child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.images!.length,
                        itemBuilder: (context, index) =>
                            buildimagestList(index, context)),
                  ),
                ],
              ));
  }

  Widget buildimagestList(int index, context) {
    return GestureDetector(
      onTap: () {
        print(index);
        _conProductView.chngeimage(product.images![index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            _startlink + product.images![index],
            height: 2.h,
          ),
        ),
      ),
    );
  }
}
