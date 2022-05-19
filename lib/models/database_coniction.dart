import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:pazar/constants.dart';

Future<bool> loginuser(
    String usemobile, String usePwd, BuildContext context) async {
  String url = path_api +
      "users/logine.php?user_pasword=" +
      usePwd +
      "&user_phone=" +
      usemobile;
  var request = http.Request('GET', Uri.parse(url));
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    // ignore: avoid_print
    print(await response.stream.bytesToString());
    Navigator.of(context).pushReplacementNamed('home');
    return true;
  } else {
    // ignore: avoid_print
    print(response.reasonPhrase);
    return false;
  }
}
