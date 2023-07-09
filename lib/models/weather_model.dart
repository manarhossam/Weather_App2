import 'package:flutter/material.dart';

class weathermodel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatename;
  weathermodel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstatename});
  factory weathermodel.fromjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return weathermodel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsondata['avgtemp_c'],
        maxtemp: jsondata['maxtemp_c'],
        mintemp: jsondata['mintemp_c'],
        weatherstatename: jsondata['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'temp= $temp mintemp=$mintemp  date=$date';
  }

  String getimage() {
    if (weatherstatename == 'Thunderstorm' || weatherstatename == 'Thunder') {
      return 'assests/images/thunderstorm.png';
    } else if (weatherstatename == 'Sleet' ||
        weatherstatename == 'Snow' ||
        weatherstatename == 'Hail') {
      return 'assests/images/snow.png';
    } else if (weatherstatename == 'Heavy Cloud ') {
      return 'assests/images/cloudy.png';
    } else if (weatherstatename == 'Light Rain' ||
        weatherstatename == 'Heavy Rain') {
      return 'assests/images/rainy.png';
    } else if (weatherstatename == 'Clear' ||
        weatherstatename == 'Light Cloud') {
      return 'assests/images/clear.png';
    } else {
      return 'assests/images/clear.png';
    }
  }

  MaterialColor getthemecolor() {
    if (weatherstatename == 'Thunderstorm' || weatherstatename == 'Thunder') {
      return Colors.orange;
    } else if (weatherstatename == 'Sleet' ||
        weatherstatename == 'Snow' ||
        weatherstatename == 'Hail') {
      return Colors.blue;
    } else if (weatherstatename == 'Heavy Cloud ') {
      return Colors.blueGrey;
    } else if (weatherstatename == 'Light Rain' ||
        weatherstatename == 'Heavy Rain') {
      return Colors.blue;
    } else if (weatherstatename == 'Clear' ||
        weatherstatename == 'Light Cloud') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
