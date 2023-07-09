import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2/models/weather_model.dart';
import 'package:weather2/providers/weather_provider.dart';
import 'package:weather2/services/weatherservice.dart';

// ignore: must_be_immutable
class searchpage extends StatelessWidget {
  String? cityname;
  searchpage({this.updateui});
  VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityname = data;
            },
            onSubmitted: (data) async {
              cityname = data;
              waetherservice service = waetherservice();
              weathermodel? weather =
                  await service.getweather(cityname: cityname!);
              Provider.of<Weatherprovider>(context, listen: false).weatherdata =
                  weather;
              Provider.of<Weatherprovider>(context, listen: false).cityname =
                  cityname;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                label: Text('search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      waetherservice service = waetherservice();
                      weathermodel? weather =
                          await service.getweather(cityname: cityname!);
                      Provider.of<Weatherprovider>(context, listen: false)
                          .weatherdata = weather;
                      Provider.of<Weatherprovider>(context, listen: false)
                          .cityname = cityname;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(),
                hintText: 'Enter city'),
          ),
        ),
      ),
    );
  }
}
