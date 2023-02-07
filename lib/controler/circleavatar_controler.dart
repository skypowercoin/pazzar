import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazar/controler/categorys_model.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';

class CircleavatarController extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();
  final box = GetStorage();

  List<Catmodel> get images => _images;
  List<Catmodel> get imageslinks => _imageslinks;

  final List<Catmodel> _images = [];
  final List<Catmodel> _imageslinks = [];

  @override
  void onInit() {
    print("GlobalController - onInit");
    getcircleavatar('');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void removelist() {
    _images.clear();
    _imageslinks.clear();
    print('avatar lists is cleninig');
    print(_imageslinks.length);

    ///box.remove('imageslink');
    ///box.remove('images');
  }

  // print(categorylist[index]['attributes']['href']); data link
  //categorylist[index]['attributes']['src'] image link
  //get  getcircleavatar images url
  Future<List<Map<String, dynamic>>?> getcircleavatar(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      print('loding avatar data');
      //title = webScraper.getElement('a.item', ['span']);
    } // image url = imagelist[index]['attributes']['src']
    var data = webScraper.getElement('a.item > img', ['src']);
    var datalink = webScraper.getElement('a.item ', ['href']);

    for (int i = 0; i < data.length; i++) {
      String imagelink = data[i]['attributes']['src'];
      String productlink = datalink[i]['attributes']['href'];
      //rmove part from all link
      String pro = productlink.replaceAll('https://www.trendyol.com', '');
      //print(pro);

      //print(imagelink);

      print('avatar data add to list');
      _images.add(Catmodel.fromjson(imagelink.toString()));
      _imageslinks.add(Catmodel.fromjson(pro));

      ///box.write('images', _images);
      ///box.write('imageslink', pro);
    }
    update();
  }
}
