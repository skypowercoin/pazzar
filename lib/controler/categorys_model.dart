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
