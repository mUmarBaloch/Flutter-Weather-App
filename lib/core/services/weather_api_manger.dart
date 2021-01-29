import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/data/api_data.dart';
import 'package:weather_app/core/templates/weather_api_template.dart';

class WeatherApiManager extends WeatherApiData implements WeatherApiTemplate {
  Future<num> getCurrentWeather(String city) async {
    var request = await http
        .get('$weatherApiLink${currentWeatherEndPoint}key=$apiKey&q=$city');
    if (request != null) {
      Map response = await jsonDecode(request.body);
      var result = response['current']['temp_c'];
      return result;
    } else {
      print(
          'There was an error occured while requesting the server for location key, Status Code is ${request.statusCode}');
      return request.statusCode;
    }
  }

  Future<List> getForecast(String city, int days) async {
    var response = await http
        .get('${weatherApiLink}forecast.json?key=$apiKey&q=$city&days=$days');
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
