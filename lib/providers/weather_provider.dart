import 'package:flutter/widgets.dart';
import 'package:weather2/models/weather_model.dart';

class Weatherprovider extends ChangeNotifier {
  String? cityname;
  weathermodel? _weatherdata;
  set weatherdata(weathermodel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  weathermodel? get weatherdata => _weatherdata;
}
