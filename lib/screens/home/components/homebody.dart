import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/screens/details/components/navbar.dart';
import 'package:pazar/screens/home/components/body.dart';
import 'package:pazar/screens/home/components/subitemslist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

import 'categorries.dart';
import 'product_data_list_view.dart';
import 'package:sizer/sizer.dart';

// We need satefull widget for our categories

class Homebody extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  Homebody({Key? key}) : super(key: key);
  ProductController cont = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('BRANDS'),
        ),
        SizedBox(
          height: 8.5.h,
          child: Circlecatge(pageurl: ''),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'فائمة المنتجات',
            style: GoogleFonts.getFont('Almarai'),
          ),
        ),
        Container(
            height: 60.h,
            width: 63.w,
            color: Colors.white,
            child: GetBuilder<ProductController>(
              init: ProductController(),
              initState: (_) {},
              builder: (c) {
                return c.products.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.blue,
                        ),
                      )
                    : Productlist(
                        pageurl: '',
                      );
              },
            )),
      ],
    );
  }
}
