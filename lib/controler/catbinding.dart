import 'package:get/get.dart';

import 'globalcontroller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
  }
}
