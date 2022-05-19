import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pazar/models/apidatamodel.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'categorys_model.dart';

class ProductController extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();

  List<dynamic> get result => _result;
  List<Products> get products => _products;

  final List<dynamic> _result = [];
  final List<Products> _products = [];

  @override
  void onInit() {
    print("GlobalController - onInit");
    getproductdetails('elbise-x-c56');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // get card data price and title colors
  getproductdetails(String partUrl) async {
    ///print(partUrl[0]);
    if (partUrl[0] == '/') {
      var url = Uri.https('public.trendyol.com',
          '/discovery-web-searchgw-service/v2/api/infinite-scroll$partUrl');
      //{'in': '5'});

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      print(url);
      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        ///print(data);
        List prodct = data['result']['products'];
        for (var i = 0; i < prodct.length; i++) {
          products.add(Products.fromJson(data['result']['products'][i]));
          print(products);
        }

        //// {isSuccess: true, statusCode: 200, error: null, result: {slpName: , products: [{id: 1815977, name: Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, images: [/ty128/product/media/images/20210609/14/97887842/11443082/1/1_org_zoom.jpg], imageAlt: adidas Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, brand: {id: 33, name: adidas}, tax: 18, businessUnit: Parfüm, ratingScore: {averageRating: 4.480769230769231, totalCount: 104}, showSexualContent: true, productGroupId: 1464347, hasReviewPhoto: true, sections: [{id: 1}, {id: 2}, {id: 11}, {id: 12}, {id: 101405}], variants: [{attributeValue: Tek Ebat, attributeName: beden, price: {discountedPrice: 80.95, buyingPrice: 0, originalPrice: 80.95, sellingPrice: 80.95}, listingId: bba8c0af5ce8af3a2d576b9256d5d35f, campaignId: 61, merchantId: 127624, discountedPriceInfo: , hasCollectableCoupon: false}], categoryHierarchy: Kozmetik & Kişisel Bakım/Parfüm/Parfüm ve Deodorant, categoryId: 661, categoryName: Parfüm, url: /adidas/fruity-rhythm-edt-50-ml-kadin-

        print('no data art url 0 == /');
      }
    } else {
      var url = Uri.https('public.trendyol.com',
          '/discovery-web-searchgw-service/v2/api/infinite-scroll/$partUrl');
      //{'in': '5'});

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      print(url);
      if (response.statusCode == 200) {
        final _data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        print(_data);
      } else {
        print('no data');
      }
    }
    ;
    ;
  }
}

///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/infinite-scroll/erkek-t-shirt-x-g2-c73?pi=50&culture=tr-TR&userGenderId=2&pId=0&sc
///
///
///url to git to sub item names and url 
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/aggregations/kadin-giyim-x-g1-c82?culture=tr-TR&categoryRelevancyEnabled=false&priceAggregationType=DYNAMIC_GAUSS///