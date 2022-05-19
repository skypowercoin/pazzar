import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class Scraper extends GetxService {
  final webScraper = WebScraper('https://www.trendyol.com');

  late final List<Map<String, dynamic>> navlist,
      subcategory,
      subitemlist,
      imagelist,
      productdetails,
      producsturls,
      productimages;

  //get list of categorys
  Future<List<Map<String, dynamic>>> getCategories(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      navlist = webScraper.getElement('a.category-header', ['class', 'href']);

      print(navlist);
    }
    return navlist;
  }

  //get list of subcategory
  Future<List<Map<String, dynamic>>?> getiteam(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      subcategory =
          webScraper.getElement('a.sub-category-header', ['class', 'href']);
      print(subcategory[2]['title']);
    }
    return subcategory;
  }

// get iteemlist
  Future<List<Map<String, dynamic>>?> getsubitem(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      subitemlist =
          webScraper.getElement('ul.sub-item-list > li > a', ['a', 'href']);
    }
    return subitemlist;
  }

  //get images url for product
  Future<List<Map<String, dynamic>>?> getproductimages(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      productimages = webScraper.getElement(
          ' div.p-card-chldrn-cntnr > a > div.image-container > div.p-card-img-wr > img',
          ['src', 'alt']);

      //title = webScraper.getElement('a.item', ['span']);
    } // image url = imagelist[index]['attributes']['src']
    return imagelist;
  }

  // get card data price and title colors
  Future<List<Map<String, dynamic>>?> getproductdetails(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      productdetails = webScraper.getElement(
          ' div.prdct-cntnr-wrppr > div.p-card-wrppr ', ['src', 'alt']);
    }
    return productdetails;
  }

  // get product page data return  list of urls products
  Future<List<Map<String, dynamic>>?> getproducturl(String partUrl) async {
    if (await webScraper.loadWebPage(partUrl)) {
      producsturls = webScraper.getElement(
          '  div.p-card-wrppr > div.p-card-chldrn-cntnr > a', ['href', 'alt']);
    }
    return producsturls;
  }
}
