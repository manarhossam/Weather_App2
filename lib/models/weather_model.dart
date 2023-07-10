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
    if (weatherstatename == 'Thundery outbreaks possible' ||
        weatherstatename == 'Moderate or heavy snow with thunder' ||
        weatherstatename == 'Patchy light snow with thunder' ||
        weatherstatename == 'Moderate or heavy rain with thunder' ||
        weatherstatename == 'Patchy light rain with thunder') {
      return 'assests/images/thunderstorm.png';
    } else if (weatherstatename == 'Blizzard' ||
        weatherstatename == 'Patchy snow possible' ||
        weatherstatename == 'Patchy sleet possible' ||
        weatherstatename == 'Patchy freezing drizzle possible' ||
        weatherstatename == 'Blowing snow') {
      return 'assests/images/snow.png';
    } else if (weatherstatename == 'Freezing fog' ||
        weatherstatename == 'Fog' ||
        weatherstatename == 'Heavy Cloud' ||
        weatherstatename == 'Mist' ||
        weatherstatename == 'Fog') {
      return 'assests/images/cloudy.png';
    } else if (weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Heavy Rain' ||
        weatherstatename == 'Showers	') {
      return 'assests/images/rainy.png';
    } else if (weatherstatename == 'Sunny' ||
        weatherstatename == 'Clear' ||
        weatherstatename == 'partly cloudy') {
      return 'assests/images/clear.png';
    } else {
      return 'assests/images/clear.png';
    }
  }

  MaterialColor getthemecolor() {
    if (weatherstatename == 'Sunny' ||
        weatherstatename == 'Clear' ||
        weatherstatename == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherstatename == 'Blizzard' ||
        weatherstatename == 'Patchy snow possible' ||
        weatherstatename == 'Patchy sleet possible' ||
        weatherstatename == 'Patchy freezing drizzle possible' ||
        weatherstatename == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherstatename == 'Freezing fog' ||
        weatherstatename == 'Fog' ||
        weatherstatename == 'Heavy Cloud' ||
        weatherstatename == 'Mist' ||
        weatherstatename == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherstatename == 'Patchy rain possible' ||
        weatherstatename == 'Heavy Rain' ||
        weatherstatename == 'Showers	') {
      return Colors.blue;
    } else if (weatherstatename == 'Thundery outbreaks possible' ||
        weatherstatename == 'Moderate or heavy snow with thunder' ||
        weatherstatename == 'Patchy light snow with thunder' ||
        weatherstatename == 'Moderate or heavy rain with thunder' ||
        weatherstatename == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
