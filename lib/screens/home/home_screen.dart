import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/screens/details/components/body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazar/models/market_pro.dart';
import 'components/categorries.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Categories());
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'TURKMART',
        style: GoogleFonts.getFont('Almarai'),
      ),
      backgroundColor: Colors.redAccent[400],
      centerTitle: false,
      actions: [
        IconButton(
            icon: const Icon(Icons.shopping_cart_rounded), onPressed: () {}),
        InkWell(
          child: Container(
              child: IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () {
                    Get.to(Bodyy(
                      product: products[1],
                    ));
                  })),
        )
      ],
    );
  }
}
