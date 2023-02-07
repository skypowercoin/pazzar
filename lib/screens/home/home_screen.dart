import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazar/screens/details/components/navbar.dart';

import 'package:pazar/screens/home/components/subitemslist.dart';
import 'components/homebody.dart';
import 'components/item_screen.dart';
import 'components/lib/drawer.dart';

class HomeScreen extends GetView {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(),
      appBar: buildAppBar(),
      body: Homebody(),
      drawer: MyDrawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'TURKMART',
        style: GoogleFonts.getFont('Almarai'),
      ),
      backgroundColor: Colors.cyan,
      centerTitle: false,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/add_to_cart.svg",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
