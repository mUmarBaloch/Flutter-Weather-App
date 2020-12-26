import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiData {
  static String locationKey = "Default";
  static String city = "Default";
}

class ApiManager {
  String apiKey = 'I98kGug6BOLAVHrTpnmEEAG0WkkAHX7F';
  String endpointLocationKey =
      'http://dataservice.accuweather.com/locations/v1/cities/search';

  void getLocationKey(String city) async {
    var request = await http.get('$endpointLocationKey?apikey=$apiKey&q=$city');
    if (request.statusCode == 200) {
      List response = jsonDecode(request.body);
      ApiData.locationKey = response.map((a) => a).last['Key'];
    } else {
      print('There was a error, Status Code is ${request.statusCode}');
    }
  }
}

class ApiCaller extends StatefulWidget {
  @override
  _ApiCallerState createState() => _ApiCallerState();
}

class _ApiCallerState extends State<ApiCaller> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formState = GlobalKey<FormState>();
    ApiManager api = ApiManager();
    return Center(
      child: Column(
        children: [
          TextField(
            onSubmitted: (val) => setState(() => ApiData.city = val),
          ),
          RaisedButton(
            child: Text('submit'),
            onPressed: () => setState(() async {
              api.getLocationKey('${ApiData.city}');
              Timer.periodic(Duration(seconds: 3), (a) {});
            }),
          ),
          Text('${ApiData.locationKey}'),
        ],
      ),
    );{}
  }
}
