import 'package:get/get.dart';

class ProductView extends GetxController {
  List<String> get images => _image;
  final List<String> _image = [];

  chngeimage(String imagelink) {
    _image.clear();
    _image.add(imagelink);
    print(imagelink);
    update();
  }

  @override
  void onClose() {
    _image.clear();
    print('cccolse');
    super.onClose();
  }
}
