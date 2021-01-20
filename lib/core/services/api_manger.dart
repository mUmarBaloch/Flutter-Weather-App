import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather {
  final Map<Current, dynamic> current;
  Weather({this.current});
}

class Current {
  final String temp_c;
  final String isDay;

  Current({this.temp_c, this.isDay});
}

class ApiData {
  static String locationKey = "Default";
  static String city = "Default";
  static double celcius = 0.0;
  static String apiKey = 'bab4038cddf142a7b87133900202712';

  static String endpointCurrentWeather =
      'https://api.weatherapi.com/v1/current.json?';
}

class ApiManager {}

class ApiCaller extends StatefulWidget {
  @override
  _ApiCallerState createState() => _ApiCallerState();
}

class _ApiCallerState extends State<ApiCaller> {
  @override
  Widget build(BuildContext context) {
    Future getLocationKey(String city) async {
      var request = await http.get(
          '${ApiData.endpointCurrentWeather}key=${ApiData.apiKey}&q=$city');
      if (request != null) {
        Map response = await jsonDecode(request.body);
        var result = response['current']['temp_c'];
        setState(() {
          ApiData.celcius = result;
          print(ApiData.locationKey);
        });
      } else {
        print(
            'There was an error occured while requesting the server for location key, Status Code is ${request.statusCode}');
      }
    }

    // get weather forcecast
    // void getWeatherFromLocationKey() async {
    //   var request = await http.get(
    //       '$endpointCurrentCondition${ApiData.locationKey}/?apikey=$apiKey');
    //   List response = jsonDecode(request.body)[0];

    //   if (request.statusCode == 200) {
    //     print(response);
    //   } else {
    //     print(
    //         'There was an error occured while request the server for current conditions, Status Code is ${request.statusCode}');
    //   }
    // }

    TextEditingController _searchCityController = TextEditingController();
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: _searchCityController,
            decoration: InputDecoration(hintText: 'enter your city name'),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            child: Text('submit'),
            onPressed: () => setState(() {
              ApiData.city = _searchCityController.text;
              getLocationKey(ApiData.city);
              //  getWeatherFromLocationKey();
            }),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'Todays Weather in ${ApiData.city}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${ApiData.celcius.floor()}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
