import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiData {
  static String apiKey = 'bab4038cddf142a7b87133900202712';
  static String endpointCurrentWeather =
      'https://api.weatherapi.com/v1/current.json?';
}

Future<void> getForecast(String city, int days) async {
  final apiKey = 'bab4038cddf142a7b87133900202712';
  var result = await http.get(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=$days');
  if (result.statusCode == 200) {
    Map body = jsonDecode(result.body);
    List forecast = body['forecast']['forecastday'];
    print('              WEATHER FORECAST OF ${city.toUpperCase()}\n');
    for (num i = 0; i < days; i++) {
      Map temp_data = forecast[i];
      print('Date of Forecast : ${temp_data["date"]} \n'
          '  Day status   : ${temp_data["day"]["condition"]["text"]}\n'
          '  Minimum temprature : ${temp_data["day"]["mintemp_c"]}\n'
          '  Maximum Wind       : ${temp_data["day"]["maxwind_mph"]}\n'
          '  Average humidity   : ${temp_data["day"]["avghumidity"]}\n'
          '  Rain chances       : ${temp_data["day"]["daily_will_it_rain"]}\n');
    }
  } else {
    print('an error');
  }
}
