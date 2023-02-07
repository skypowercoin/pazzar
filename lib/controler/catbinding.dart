import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/productscontroller.dart';
import 'package:pazar/controler/prudctviewcont.dart';

import 'globalcontroller.dart';
import 'items_controler.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
    Get.lazyPut(() => Itemscontroler());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CircleavatarController());
    Get.lazyPut(() => ProductView());
  }
}
