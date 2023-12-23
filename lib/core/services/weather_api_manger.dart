import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/data/api_data.dart';
import 'package:weather_app/core/templates/weather_api_template.dart';
import 'package:weather_app/models/hourly_forcast_model.dart';

class WeatherApiManager extends WeatherApiData implements WeatherApiTemplate {
  //getting current weather
  Future<num> getCurrentWeather(String city, String country) async {
    var request = await http.get(Uri.parse(
        '$weatherApiLinkCurrentWeather/current?city=$city&country=pk&key=${super.apiKeyCurrentWeather}'));
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

//getting forecast
  Future<List> getForecast(String city, int days) async {
    var response = await http.get(Uri.parse(
        '${weatherApiLinkForecast}forecast.json?key=$apiKeyForecast&q=$city&days=$days'));
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      var result = body['forecast']['forecastday'];
      return result;
    } else {
      var error = ['there was an error in forecast'];
      return error;
    }
  }

//getting hourly forecast
// return type is dynamic because it can
// either return HourlyForecast or String<Error>
  Future<dynamic> getHourlyForecast(
      String city, String country, int index) async {
    var response = await http.get(Uri.parse(
        '${weatherApiLinkForecast}forecast.json?key=$apiKeyForecast&q=$city&days=1'));
    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      return HourlyForecast.getDataFromApi(body, index);
    } else {
      var error = ['there was an error in hourly forecast'];
      return error;
    }
  }
}
