import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather2/models/weather_model.dart';

class waetherservice {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apikey = 'ccbcaf4d99a14fc99c7210930231305';
  Future<weathermodel?> getweather({required String cityname}) async {
    weathermodel? weather;
    try {
      Uri url =
          Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityname&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = weathermodel.fromjson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
