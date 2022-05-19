import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pazar/models/market_pro.dart';
import 'package:pazar/screens/details/components/description.dart';
import 'package:pazar/screens/home/components/body.dart';
import 'package:pazar/screens/home/components/item_list.dart';
import 'package:pazar/screens/home/components/product_data_list_view.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

// We need satefull widget for our categories
void main() {
  runApp(Categories());
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  GoogleTranslator translator = GoogleTranslator();
  final webScraper = WebScraper('https://www.trendyol.com');
  late List<String> conlist;
  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  late List<Map<String, dynamic>> categorylist;
  late List<Map<String, dynamic>> navlist, images;
  // By default our first item will be selecte
  int selectedIndex = 0;

  void fetchcatlist() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        navlist = webScraper.getElement('a.category-header', ['class', 'href']);

        //for (final e in navlist) {
        //String txt = e['title'];

        // await txt.translate(to: 'en');
        //conlist.add(txt);

        // You can also call the extension method directly on the input
        ///   print('Translated: ${await txt.translate(to: 'en')}');
        //}
        //

        print(navlist);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchcatlist();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Model(),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: physicalHeight * 0.03,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: navlist.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
          Container(
            height: physicalHeight * 0.0618,
            color: Colors.red[50],
            child: Consumer<Model>(builder: (context, value, child) {
              return Circlecatge(
                pageurl: value.page[selectedIndex], //['attributes']['href'],
              );
            }),
          ),
          Container(
            height: physicalHeight * 0.0618 * 5.3,
            color: Colors.red[500],
            child: Consumer<Model>(builder: (context, value, child) {
              return Productlist(
                pageurl: value.page[selectedIndex], //['attributes']['href'],
              );
            }),
          )
        ],
      )),
    );
  }

  Widget buildCategory(int index) {
    return Consumer<Model>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            Get.to(itemlist(
              page: navlist[index]['attributes']['href'],
            ));
            setState(() {
              selectedIndex = index;
              value.changepage();

              print(index);

              print(navlist[index]['attributes']['href']);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  navlist[index]['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? kTextColor : Colors.red,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                  height: physicalHeight * 0.002,
                  width: 15,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Model extends ChangeNotifier {
  String page = '/butik/liste/1/kadin';

  changepage() {
    Circlecatge(pageurl: '/butik/liste/3/cocuk');
    print('page changed');
    notifyListeners();
  }
}
