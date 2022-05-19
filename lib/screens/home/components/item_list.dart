import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pazar/screens/home/components/body.dart';
import 'package:pazar/screens/home/components/categorries.dart';
import 'package:translator/translator.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../constants.dart';
import '../home_screen.dart';

// We need satefull widget for our categories

class itemlist extends StatefulWidget {
  itemlist({required page});
  @override
  _itemlistState createState() => _itemlistState();
}

class _itemlistState extends State<itemlist> {
  GoogleTranslator translator = GoogleTranslator();
  final webScraper = WebScraper('https://www.trendyol.com');
  late List<String> conlist;
  late final String page = "";
  // Response of getElement is always List<Map<String, dynamic>>

  late List<Map<String, dynamic>> subcategory, subitemlist;
  // By default our first item will be selected
  int selectedIndex = 0;
  void fetchcatlist() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage(page)) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        subcategory =
            webScraper.getElement('a.sub-category-header', ['class', 'href']);
        subitemlist =
            webScraper.getElement('ul.sub-item-list > li > a', ['a', 'href']);

        //for (final e in navlist) {
        //String txt = e['title'];

        // await txt.translate(to: 'en');
        //conlist.add(txt);

        // You can also call the extension method directly on the input
        ///   print('Translated: ${await txt.translate(to: 'en')}');
        //}
        //

        print(subitemlist);
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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: physicalHeight * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subcategory.length,
                  itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Circlecatge(
                pageurl: '/butik/liste/11/kozmetik',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          print(index);

          print(subcategory[index]['attributes']['href']);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subcategory[index]['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: physicalHeight * 0.002,
              width: 15,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
