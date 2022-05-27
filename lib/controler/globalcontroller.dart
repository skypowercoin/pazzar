import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:translator/translator.dart';

import 'package:web_scraper/web_scraper.dart';

import 'categorys_model.dart';

class GlobalController extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();

  List<Catmodel> get catmodil => _catmodel;
  List<Catmodellink> get catlinks => _catlinks;
  Color get color => _color;
  late Color _color = Colors.transparent;

  final List<Catmodel> _catmodel = [];
  final List<Catmodellink> _catlinks = [];

  GlobalController() {
    getCategories('');
  }

  @override
  void onInit() {
    print("GlobalController - onInit");

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  //get list of categorys
  ///{title: Kadın, attributes: {href: /butik/liste/1/kadin}}

  getCategories(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      var data = webScraper.getElement('a.category-header', ['href']);

      for (int i = 0; i < data.length; i++) {
        String title = data[i]['title'];
        String link = data[i]['attributes']['href'];
        catlinks.add(Catmodellink.fromjson(link.toString()));
        Translation tr = await title.translate(to: 'ar');
        _catmodel.add(Catmodel.fromjson(tr.toString()));
      }
      update();
    }
  }

  void changecolor(int index, int selctindex) {
    if (index == selctindex) _color = Colors.black;
    update();
  }
}
