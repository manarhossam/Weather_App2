import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2/models/weather_model.dart';
import 'package:weather2/pages/homepage.dart';
import 'package:weather2/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return Weatherprovider();
      },
      child: MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  weathermodel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<Weatherprovider>(context).weatherdata == null
            ? Colors.blue
            : Provider.of<Weatherprovider>(context)
                .weatherdata!
                .getthemecolor(),
      ),
      home: homepage(),
    );

    // This widget is the root of your application.
  }
}
