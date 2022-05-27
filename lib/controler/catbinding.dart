import 'package:get/get.dart';
import 'package:pazar/controler/circleavatar_controler.dart';
import 'package:pazar/controler/productscontroller.dart';

import 'globalcontroller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CircleavatarController());
  }
}
