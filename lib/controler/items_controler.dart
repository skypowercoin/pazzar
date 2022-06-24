import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import 'package:web_scraper/web_scraper.dart';

import 'categorys_model.dart';

class Itemscontroler extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();

  List<String> get catgoryid => _catgoryid;
  List<Catmodel> get subitemstitel => _subitemstitel;
  List<Catmodellink> get subitemsinks => _subitemsinks;
  RxInt isSelected = 1.obs;
  RxInt isitemSelected = 1.obs;

  final List<Catmodel> _subitemstitel = [];
  final List<Catmodellink> _subitemsinks = [];

  List<Catmodel> get itemstitel => _itemstitel;
  List<Catmodellink> get itemsinks => _itemsinks;

  final List<Catmodel> _itemstitel = [];
  final List<Catmodellink> _itemsinks = [];
  final List<String> _catgoryid = [];

  @override
  void onInit() {
    print("Itemscontroler - onInit");
    getsubitems('/butik/liste/1/kadin');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void removeitemslist() {
    _itemstitel.clear();
    _itemsinks.clear();

    update();
  }

  void removesubitemslist() {
    _subitemstitel.clear();
    _subitemsinks.clear();
    _itemstitel.clear();
    _itemsinks.clear();
    _catgoryid.clear();

    update();
  }

  getsubitems(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      ///replce all characters befor i need number of catgorys
      String text = partUrl.replaceAll(RegExp('[^0-9]'), '');

      /// add catgorys id to list save for need update the sub items

      catgoryid.add(text);
      var data = webScraper
          .getElement('#sub-nav-$text > div > div > div > div > a', ['href']);

      ///print('sub items loded$partUrl');
      /// print('sub items loded');
      ///print(data.length);
      getitems(0);

      ///print(item_data.length);

      for (int i = 0; i < data.length; i++) {
        String title = data[i]['title'];
        String link = data[i]['attributes']['href'];
        _subitemsinks.add(Catmodellink.fromjson(link.toString()));
        Translation tr = await title.translate(to: 'en');
        _subitemstitel.add(Catmodel.fromjson(tr.toString()));
      }
      update();
    }
  }

  void changetemScolor(int index) {
    isitemSelected = index.obs;
    update();
  }

  void changecolor(int index) {
    isSelected = index.obs;

    update();
  }

  getitems(int subitemsindex) async {
    if (await webScraper.loadWebPage('')) {
      ///replce all characters befor i need number of catgorys
      String text = _catgoryid[0];
      //// add 1 to subitemsindex for slove zero sub item  index
      int _subitemsindex = subitemsindex + 1;
      //print(' _catgoryid$_catgoryid');
      for (int s = 1; s < 50; s++) {
        var item_data = webScraper.getElement(
            '#sub-nav-$text > div > div > div:nth-child($_subitemsindex) > div > ul > li:nth-child($s) > a',
            ['href']);

        ///print('this catgory id $text');
        ///print('this subitemsindex $_subitemsindex');
        ///print('this item id $s');

        ///print(item_data);
        if (item_data.isEmpty && s > 1) {
          print('data.isEmpty');
          break;
        } else
          // ignore: curly_braces_in_flow_control_structures
          for (int i = 0; i < item_data.length; i++) {
            String title = item_data[i]['title'];

            ///print('title is $title');
            String link = item_data[i]['attributes']['href'];
            itemsinks.add(Catmodellink.fromjson(link.toString()));
            Translation tr = await title.translate(to: 'en');
            _itemstitel.add(Catmodel.fromjson(tr.toString()));
          }
      }
      update();
    }
  }

  ///void changecolor(int index) {
  ///  isSelected = index.obs;
  /// update();
  /// }
}

/////https://public.trendyol.com/discovery-web-searchgw-service/v2/api/filter /sr?fl=luks-ve-tasarim-markalarda-en-begenilenler
