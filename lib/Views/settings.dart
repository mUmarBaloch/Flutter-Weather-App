import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/data/weather_data.dart';
import 'package:weather_app/core/services/api_manger.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool onLoading = false;
  TextEditingController _searchCityController = TextEditingController();

  //fixed #2
  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 05,
                    offset: Offset(1, 4),
                  ),
                ],
              ),
              height: 400,
              width: 350,
              child: Column(
                children: [
                  spacer(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: buildIcon(Icons.arrow_back_ios_outlined),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      onLoading == true
                          ? Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 50,
                              child: SpinKitFadingCircle(
                                color: Colors.deepPurpleAccent,
                              ))
                          : buildIcon(Icons.settings),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  spacer(5),
                  Text(
                    'Capital cities are prefered due to beta version',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
                  spacer(5),
                  ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      size: 30,
                      color: Color.fromRGBO(138, 104, 236, 1),
                    ),
                    title: Card(
                      elevation: 05,
                      child: TextField(
                        controller: _searchCityController,
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Location',
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Color.fromRGBO(138, 104, 236, 1),
                      ),
                      onPressed: () async {
                        try {
                          onLoading = true;

                          dynamic _weather = await getCurrentWeather(
                              '${_searchCityController.text}');

                          setState(() {
                            WeatherData.celcius = _weather;
                            print(WeatherData.celcius);
                            var _temproryCity = _searchCityController.text;
                            WeatherData.city = _temproryCity.toUpperCase();
                          });

                          dynamic _forecast =
                              await getForecast(WeatherData.city, 3);
                          setState(() {
                            ForecastData.forecast = _forecast;
                            print(ForecastData.forecast);
                            Timer(Duration(seconds: 2), () {});
                            onLoading = false;
                          });
                        } catch (e) {
                          print(
                              'Error on Settings.dart=>Search button Says :- $e');
                          showBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                    child: Text(e),
                                  ));
                        }
                      },
                    ),
                  ),
                  buildOption("Remind me when its Rainy Tommorrow", null),
                  spacer(10),
                  buildIcon(
                    Icons.nightlight_round,
                  ),
                  spacer(10),
                  buildOption("Show me Prayer times", null),
                  SizedBox(height: 10),
                  buildOption("remind me when its prayer time", null)
                ],
              ),
            ),
          ),
        ),
      );

  SizedBox spacer(double height) => SizedBox(height: height);

  Align buildIcon(IconData icon, {int size = 45}) {
    return Align(
        alignment: Alignment.topCenter,
        child: Icon(
          icon,
          size: 45,
          color: Color.fromRGBO(138, 104, 236, 1),
        ));
  }

  ListTile buildOption(text, function) {
    return ListTile(
      title: Text(
        '$text',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Radio(value: true, groupValue: null, onChanged: function),
    );
  }
}
