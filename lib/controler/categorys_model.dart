import 'dart:convert';

import 'package:flutter/rendering.dart';

class Catmodel {
  late String titales;

  var titale;

  Catmodel({required this.titale});

  Catmodel.fromjson(String map) {
    if (map.isEmpty) {
      return;
    }

    titales = map;
  }
  tojson() {
    return {'titale': titales};
  }
}

class Catmodellink {
  late String links;

  var titale;

  Catmodellink({required this.links});

  Catmodellink.fromjson(String map) {
    if (map.isEmpty) {
      return;
    }

    links = map;
  }
  tojson() {
    return {'links': links};
  }
}

class Subitemmodel {
  int? subitemindex;
  String? subitemstitale;
  String? subitemslink;
  //List<Itemmodel>? items;

  Subitemmodel({
    this.subitemindex,
    this.subitemstitale,
    this.subitemslink,
  });

  Subitemmodel.fromjson(Map<String, dynamic> json) {
    subitemindex = json['subitemindex'];

    subitemstitale = json['subitemstitale'];
    subitemslink = json['subitemslink'];
    //if (json['items'] != null) {
    /// items = <Itemmodel>[];
    // json['items'].forEach((k,v) {
    ///  items!.add(Itemmodel.fromJson(v));
    //});
    //}
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = <String, dynamic>{};

    json['subitemindex'] = subitemindex;
    json['subitemstitale'] = subitemstitale;
    json['subitemslink'] = subitemslink;
    //json['items'] = items;
    return json;
  }
}

class Itemmodel {
  int? itemindex;
  String? itemstitale;
  String? itemslink;

  Itemmodel({
    this.itemindex,
    this.itemstitale,
    this.itemslink,
  });

  Itemmodel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    itemindex = json['itemindex'];
    itemstitale = json['itemstitale'];
    itemslink = json['itemslink'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['itemindex'] = itemindex;
    json['itemstitale'] = itemstitale;
    json['itemslink'] = itemslink;
    return json;
  }
}
