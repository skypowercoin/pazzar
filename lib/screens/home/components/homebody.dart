import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/globalcontroller.dart';
import 'package:pazar/controler/items_controler.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/screens/home/components/body.dart';
import 'package:pazar/screens/home/components/subitemslist.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import 'categorries.dart';
import 'items.dart';
import 'product_data_list_view.dart';
import 'package:sizer/sizer.dart';

// We need satefull widget for our categories

class Homebody extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  Homebody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('التصنبفات الرئيسية'),
        ),
        SizedBox(
          child: Categories(),
          height: 8.5.h,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text('subıtems'),
        ),
        SizedBox(
          height: 8.5.h,
          child: Circlecatge(pageurl: ''),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'فائمة المنتجات',
            style: GoogleFonts.getFont('Almarai'),
          ),
        ),
        Container(
            height: 48.h,
            width: 63.w,
            color: Colors.red[200],
            child: Productlist(
              pageurl: '',
            )),
        Text(
          'التصنيفات الفرعية',
          style: GoogleFonts.getFont('Almarai'),
        ),
        SizedBox(
          height: 8.5.h,
          child: Subitems(),
        ),
      ],
    ));
  }
}
