import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar/controler/globalcontroller.dart';

class Items extends GetView {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: GetBuilder<GlobalController>(
              init: GlobalController(),
              initState: (_) {},
              builder: (controller) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => builditeams(index))),
        ),
      )
    ]));
  }

  builditeams(int index) {
    return GetBuilder<GlobalController>(
        init: GlobalController(),
        initState: (_) {},
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              print('iteam $index');
            },
          );
        });
  }
}
