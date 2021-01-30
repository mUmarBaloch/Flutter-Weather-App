import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/data/api_data.dart';
import 'package:weather_app/core/templates/weather_api_template.dart';

class WeatherApiManager extends WeatherApiData implements WeatherApiTemplate {
  Future<num> getCurrentWeather(String city, String country) async {
    var request = await http.get(
        '$weatherApiLinkCurrentWeather/current?city=Mirpur%20khas&country=pk&key=febd9f38cad4483b90f90e87943b3ecf');
    if (request != null) {
      Map response = await jsonDecode(request.body);
      var result = response['data'][0]['temp'];
      return result;
    } else {
      print(
          'There was an error occured while requesting the server for location key, Status Code is ${request.statusCode}');
      return request.statusCode;
    }
  }

  Future<List> getForecast(String city, int days) async {
    var response = await http.get(
        '${weatherApiLinkForecast}forecast.json?key=$apiKeyForecast&q=$city&days=$days');
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      var result = body['forecast']['forecastday'];
      return result;
    } else {
      var error = ['there was an error in forecast'];
      return error;
    }
  }
}
