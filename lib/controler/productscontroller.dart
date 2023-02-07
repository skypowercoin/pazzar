import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pazar/models/apidatamodel.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'categorys_model.dart';

class ProductController extends GetxController {
  WebScraper webScraper = WebScraper('https://www.trendyol.com');
  GoogleTranslator translator = GoogleTranslator();
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrl => _scrollController;
  List<dynamic> get result => _result;
  List<Products> get products => _products;
  List<String> get text => _text;
  final List<String> _text = [];

  final List<dynamic> _result = [];
  final List<Products> _products = [];
  final List<String> _linkurl = [];
  int pageindex = 1;

  /// for
  void addindex() {
    pageindex = pageindex + 1;
  }

  @override
  void onInit() {
    print("ProductController- onInit");
    getproductdetails('/mobilya-1x-c119');

    super.onInit();
    update();
  }

  @override
  void onReady() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        addindex();
        print("lode more data page index $pageindex");

        var dat = _linkurl[0].toString();

        getproductdetails(dat);
      }
    });
    super.onReady();
  }

  ///delet products from list befor dawonlode anthore
  ///
  void clearproducts() {
    _products.clear();
    _linkurl.clear();
    _text.clear();
    pageindex = 1;

    update();
  }

  /// get card data price and title colors
  getproductdetails(String partUrl) async {
    // add url to list for fitch more data with scrolling
    _linkurl.add(partUrl);

    if (partUrl[0] == '/') {
      var url = Uri.https(
          'public.trendyol.com',
          '/discovery-web-searchgw-service/v2/api/infinite-scroll$partUrl',
          {'pi': '$pageindex'});

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        ///print(data);
        List prodct = data['result']['products'];
        for (var i = 0; i < prodct.length; i++) {
          products.add(Products.fromJson(prodct[i]));
          Translation tr = await products[i].categoryName!.translate(to: 'ar');

          text.add(tr.toString());
          //print('looding product list >from product controler');
          //print(tr);

          ///print(products[i].productGroupId);
          ////print(products[i].variants![0].attributeName);
          ////print(products[i].variants![0].attributeValue);
          ////print(products[i].imageAlt);
        }

        print('data  loded and add to list ');

        //// {isSuccess: true, statusCode: 200, error: null, result: {slpName: , products: [{id: 1815977, name: Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, images: [/ty128/product/media/images/20210609/14/97887842/11443082/1/1_org_zoom.jpg], imageAlt: adidas Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, brand: {id: 33, name: adidas}, tax: 18, businessUnit: Parfüm, ratingScore: {averageRating: 4.480769230769231, totalCount: 104}, showSexualContent: true, productGroupId: 1464347, hasReviewPhoto: true, sections: [{id: 1}, {id: 2}, {id: 11}, {id: 12}, {id: 101405}], variants: [{attributeValue: Tek Ebat, attributeName: beden, price: {discountedPrice: 80.95, buyingPrice: 0, originalPrice: 80.95, sellingPrice: 80.95}, listingId: bba8c0af5ce8af3a2d576b9256d5d35f, campaignId: 61, merchantId: 127624, discountedPriceInfo: , hasCollectableCoupon: false}], categoryHierarchy: Kozmetik & Kişisel Bakım/Parfüm/Parfüm ve Deodorant, categoryId: 661, categoryName: Parfüm, url: /adidas/fruity-rhythm-edt-50-ml-kadin-

      } else {
        var url = 'https://public.trendyol.com' +
                '/discovery-web-searchgw-service/v2/api/filter$partUrl' +
                '&pi=' +
                '$pageindex',
            request = http.Request('GET', Uri.parse(url));
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          var data = convert.jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;

          List prodct = data['result']['products'];
          //print(prodct);
          for (var i = 0; i < prodct.length; i++) {
            ///print(prodct[i]);
            products.add(Products.fromJson(prodct[i]));

            ///print(products[i].productGroupId);
          }
        } else
          print(url);
        _linkurl.clear();

        print('the url is not avibalee ');
      }
    }
    update();
  }
}

///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/infinite-scroll/erkek-t-shirt-x-g2-c73?pi=50&culture=tr-TR&userGenderId=2&pId=0&sc
///
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/filter/sr?tag=AnasayfaAll
///url to git to sub item names and url
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/aggregations/kadin-giyim-x-g1-c82?culture=tr-TR&categoryRelevancyEnabled=false&priceAggregationType=DYNAMIC_GAUSS///
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/product-groups/color-options?productGroupIds[]=30676429&productGroupIds[]=31898377&productGroupIds[]=31896688&productGroupIds[]=30676429&productGroupIds[]=30676429&productGroupIds[]=31870354&productGroupIds[]=31896642&productGroupIds[]=30676429&productGroupIds[]=31868893&productGroupIds[]=31896485&productGroupIds[]=252789048&productGroupIds[]=252789048&productGroupIds[]=31896609&productGroupIds[]=30676429&productGroupIds[]=237837396&productGroupIds[]=107219994&productGroupIds[]=31896984&productGroupIds[]=76561196&productGroupIds[]=187316990&productGroupIds[]=120913932&productGroupIds[]=239042740&productGroupIds[]=124311323&productGroupIds[]=30676428&productGroupIds[]=31896643