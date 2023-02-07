import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/models/apidatamodel.dart';
import 'package:pazar/screens/home/components/homebody.dart';
import 'package:pazar/screens/home/components/product_data_list_view.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import 'cart_counter.dart';
import 'navbar.dart';

class AddToCart extends GetView {
  AddToCart({
    required this.product,
  });

  final Products product;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.blueGrey,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
              ),
              onPressed: () {
                String lovedproduct = jsonEncode(product);

                ///add data to basket
                box.write('basket', lovedproduct);

                ///var data = box.read<Products>('basket');
                Get.to(basket());

                ///print(data!.discountedPriceInfo);
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class basket extends GetView {
  const basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: navigationBar(),
        appBar: buildAppBar(),
        body: ListView(
          children: [CartBody(), CheckoutCard()],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
        shadowColor: Colors.deepPurple,
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Column(
          children: const [
            Text('YOR BASKET',
                style: TextStyle(fontSize: 24, color: Colors.deepPurple)),
            Text('${4}items', style: TextStyle(color: Colors.black26)),
          ],
        ));
  }
}

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<CartBody> {
  ProductController cont = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 1.w),
              child: Dismissible(
                key: Key(cont.products[index].name.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  print('data removed');

                  ///rmove data from list
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset("assets/icons/heart.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: cont.products[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Products cart;
  final String _startlink = 'https://cdn.dsmcdn.com';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16.h,
          width: 10.w,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              height: 2.h,
              width: 30.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(_startlink + cart.images![0]),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.campaignName.toString(),
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 5,
            ),
            CartCounter(),
            Text.rich(
              TextSpan(
                text: "\$${cart.price!.sellingPrice}",
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.cyan),
                children: [
                  TextSpan(
                      text: " +${cart.tax}% tax",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 3.h,
                  width: 3.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.w,
                  child: TextButton(
                    child: Text("Check Out"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
