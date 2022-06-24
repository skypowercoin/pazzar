import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pazar/screens/home/components/subitemslist.dart';
import 'components/homebody.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Homebody(),
      drawer: Drawer(
        child: Subitems(),
      ),
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
