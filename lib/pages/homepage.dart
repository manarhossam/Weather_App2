import 'package:flutter/material.dart';
import 'package:weather2/models/weather_model.dart';
import 'package:weather2/pages/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:weather2/providers/weather_provider.dart';

// ignore: camel_case_types, must_be_immutable
class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void updateui() {
    setState(() {});
  }

  weathermodel? weatherdata;
  @override
  Widget build(BuildContext context) {
    weatherdata = Provider.of<Weatherprovider>(context).weatherdata;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return searchpage(
                  updateui: updateui,
                );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather app'),
      ),
      body: weatherdata == null
          ? Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('There are no weather',
                    style: TextStyle(
                      fontSize: 30,
                    )),
                Text(
                  'Searching now',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ]),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherdata!.getthemecolor(),
                  weatherdata!.getthemecolor()[300]!,
                  weatherdata!.getthemecolor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<Weatherprovider>(context).cityname!,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'updated at : ${weatherdata!.date.toString()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          weatherdata!.getimage(),
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          weatherdata!.temp.toInt().toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('maxtemp : ${weatherdata!.maxtemp.toInt()}'),
                            Text('mintemp : ${weatherdata!.mintemp.toInt()}'),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherdata!.weatherstatename,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                  ]),
            ),
    );
  }
}
