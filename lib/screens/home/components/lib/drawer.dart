import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/globalcontroller.dart';
import 'package:pazar/controler/items_controler.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/screens/home/home_screen.dart';
import 'package:sizer/sizer.dart';

import '../categorries.dart';
import '../subitemslist.dart';

class MyDrawer extends GetView {
  final poc = Get.put(ProductController());
  final glc = Get.put(GlobalController());
  final itemscontroler = Get.put(Itemscontroler());
  MyDrawer({Key? key}) : super(key: key);
  late bool issubitems = true;
  int tapindex = 0;
  int itemindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: Column(children: [
        Padding(
            padding: const EdgeInsets.only(right: 250, top: 20),
            child: IconButton(
              splashColor: Colors.red,
              icon: SvgPicture.asset(
                "assets/icons/back.svg",
                color: Colors.black,
              ),
              onPressed: () {
                itemscontroler.backbootum();
                issubitems = true;
                tapindex = itemindex;
              },
            )),
        Categories(),
        GetBuilder<Itemscontroler>(
          init: Itemscontroler(),
          initState: (_) {},
          builder: (Itemscontroler) {
            return itemscontroler.subitemsss.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(80),
                    child: CircularProgressIndicator(),
                  )
                : Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: Itemscontroler.subitemsss.length,
                      itemBuilder: (context, index) =>
                          buildsubiteams(index, context),
                    ),
                  );
          },
        ),
      ])),
    );
  }

  buildsubiteams(int index, context) {
    return GetBuilder<Itemscontroler>(
        init: Itemscontroler(),
        initState: (_) {},
        builder: (ic) {
          return itemscontroler.subitemsss.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(80),
                  child: CircularProgressIndicator(),
                )
              : ListTile(
                  trailing: issubitems == false
                      ? null
                      : Icon(Icons.list_sharp,
                          color:
                              tapindex == index ? Colors.blue : Colors.black),
                  subtitle: Divider(
                    endIndent: tapindex == index ? 150 : 63,
                    height: 0.01,
                    color: tapindex == index ? Colors.red : Colors.black,
                  ),
                  onTap: () {
                    print('items taped');

                    if (issubitems == true) {
                      issubitems = false;
                      ic.removeitemslist();
                      ic.getitems(index);
                      itemindex = index;
                      issubitems = false;
                    } else {
                      print('add link to prouct page');
                      poc.clearproducts();
                      poc.getproductdetails(
                          ic.subitemsss[index].subitemslink.toString());
                      Navigator.of(context).pushReplacementNamed('home');
                      tapindex = index;
                    }
                  },
                  minVerticalPadding: 1,
                  selectedTileColor: Colors.greenAccent,
                  title: Text(ic.subitemsss[index].subitemstitale.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              tapindex == index ? Colors.blue : Colors.black)));
        });
  }
}
