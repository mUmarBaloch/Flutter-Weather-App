import 'dart:async';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/data/api_data.dart';
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
  Future getCurrentWeather(String city) async {
    var request = await http
        .get('${ApiData.endpointCurrentWeather}key=${ApiData.apiKey}&q=$city');
    if (request != null) {
      Map response = await jsonDecode(request.body);
      var result = response['current']['temp_c'];
      setState(() {
        WeatherData.celcius = result;
        print(WeatherData.locationKey);
      });
    } else {
      print(
          'There was an error occured while requesting the server for location key, Status Code is ${request.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: onLoading == true
            ? Container(
                color: Colors.transparent,
                height: 100,
                width: 100,
                child: SpinKitWave(
                  color: Colors.white,
                  duration: Duration(seconds: 3),
                ))
            : Material(
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
                            buildIcon(Icons.settings),
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
                                await getCurrentWeather(
                                    '${_searchCityController.text}');
                                var _temproryCity = _searchCityController.text;
                                WeatherData.city = _temproryCity.toUpperCase();
                                onLoading = true;
                                Timer(Duration(seconds: 3), () {
                                  print(WeatherData.celcius);
                                  setState(() {
                                    onLoading = false;
                                    Navigator.pop(context);
                                  });
                                });

                                getForecast(WeatherData.city, 3);
                              } catch (e) {
                                print('its an error $e');
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
