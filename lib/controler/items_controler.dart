import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

import 'package:web_scraper/web_scraper.dart';

import 'categorys_model.dart';

class Itemscontroler extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();
  final box = GetStorage();

  List<Subitemmodel> get subitemsss => subitemss;
  RxInt isSelected = 1.obs;
  RxInt isitemSelected = 1.obs;

  final List<Subitemmodel> subitemss = [];

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
    subitemss.clear;

    update();
  }

  void removesubitemslist() {
    subitemss.clear();

    box.remove('catgorys id');
    box.remove('subitemsurl');

    update();
  }

  void backbootum() {
    subitemss.clear();

    var subitemsurl = box.read('subitemsurl');
    getsubitems(subitemsurl);

    update();
  }

  getsubitems(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      ///replce all characters befor i need number of catgorys
      String text = partUrl.replaceAll(RegExp('[^0-9]'), '');

      /// add catgorys id to list save for need update the sub items

      box.writeIfNull('catgorys id', text);
      box.writeIfNull('subitemsurl', partUrl);
      var data = webScraper
          .getElement('#sub-nav-$text > div > div > div > div > a', ['href']);

      ///print('sub items loded$partUrl');
      /// print('sub items loded');
      ///print(data.length);

      ///print(item_data.length);

      for (int i = 0; i < data.length; i++) {
        String title = data[i]['title'];
        String link = data[i]['attributes']['href'];

        Translation tr = await title.translate(to: 'ar');

        final sbtes = Subitemmodel(
            subitemindex: i, subitemslink: link, subitemstitale: tr.toString());
        //String json = jsonEncode(sbtes);

        subitemss.add(sbtes);

        print(' find data  in loop of subitemss$i');

        ///prefs.setString('subitems+$i', tat);
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
    subitemss.clear();
    if (await webScraper.loadWebPage('')) {
      ///replce all characters befor i need number of catgorys
      String text = box.read('catgorys id');
      //// add 1 to subitemsindex for slove zero sub item  index
      int _subitemsindex = subitemsindex + 1;
      //print(' _catgoryid$_catgoryid');
      for (int s = 1; s < 20; s++) {
        var item_data = webScraper.getElement(
            '#sub-nav-$text > div > div > div:nth-child($_subitemsindex) > div > ul > li:nth-child($s) > a',
            ['href']);

        ///print('this catgory id $text');
        ///print('this subitemsindex $_subitemsindex');
        ///print('this item id $s');

        print('test num$s');
        if (item_data.isEmpty && s > 1) {
          print('data.isEmpty');
        } else
          // ignore: curly_braces_in_flow_control_structures
          for (int i = 0; i < item_data.length; i++) {
            print('serch for item$i in lode data');

            String title = item_data[i]['title'];

            ///print('title is $title');
            String link = item_data[i]['attributes']['href'];
            Translation tr = await title.translate(to: 'ar');
            final test = Subitemmodel(
                subitemindex: i,
                subitemslink: link,
                subitemstitale: tr.toString());
            //String gason = jsonEncode(test);
            //print(gason);

            subitemss.add(test);
          }
      }
    }

    update();
  }

  ///void changecolor(int index) {
  ///  isSelected = index.obs;
  /// update();
  /// }
}

/////https://public.trendyol.com/discovery-web-searchgw-service/v2/api/filter /sr?fl=luks-ve-tasarim-markalarda-en-begenilenler
