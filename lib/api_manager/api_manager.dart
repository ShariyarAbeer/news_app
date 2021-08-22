import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/newsInfo.dart';
import '../api_strings/Strings.dart';

// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getWelcome() async {
    var client = http.Client();
    var newsModel;

    try {
      //oi beta ei vabe dise;
      var response = await client.get(Uri.parse(Strings.news_url));
      // var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
        print(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
