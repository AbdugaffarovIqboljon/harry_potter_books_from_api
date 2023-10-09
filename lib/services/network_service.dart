import 'dart:convert';

import 'package:harry_potter_from_api/models/harry_model.dart';
import 'package:http/http.dart';


class Network {
  ///DOMAIN
  static const String baseUrlHarry = "api.potterdb.com";

  ///API
  static String api = "/v1/characters";
  static String bookApi = "/v1/books";


  ///GET Method
  static Future<String?> methodGet({
    required String api,
    baseUrl = baseUrlHarry,
  }) async {
    Uri url = Uri.https(baseUrl, api);

    try {
      final Response response = await get(url);

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  ///parseToHarryList
  static List<Book> harry(String data) {
    final List result = jsonDecode(data)["data"];
    final List<Book> models = [];
    for (int i = 0; i < result.length; i++) {
      models.add(Book.fromJson(result[i]));
    }
    return models;
  }
}
