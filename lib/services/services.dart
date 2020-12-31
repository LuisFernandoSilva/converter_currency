import 'dart:convert';

import 'package:get/get.dart';

class Services extends GetConnect {
  Future<Map> getData() async {
    final response = await get(
      "https://api.hgbrasil.com/finance?format=json-cors&key=0b3baadb",
    );

    if (response.hasError) {
      throw Exception(response.statusText);
    }

    return response.body;
  }
}
