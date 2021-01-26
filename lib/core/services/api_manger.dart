import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getForecast(String city, int days) async {
  final apiKey = 'bab4038cddf142a7b87133900202712';
  var result = await http.get(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=$days');
  if (result.statusCode == 200) {
    Map body = jsonDecode(result.body);
    List forecast = body['forecast']['forecastday'];
    print('              WEATHER FORECAST OF ${city.toUpperCase()}\n');
    for (num i = 0; i < days; i++) {
      Map tempData = forecast[i];
      print('Date of Forecast : ${tempData["date"]} \n'
          '  Day status   : ${tempData["day"]["condition"]["text"]}\n'
          '  Minimum temprature : ${tempData["day"]["mintemp_c"]}\n'
          '  Maximum Wind       : ${tempData["day"]["maxwind_mph"]}\n'
          '  Average humidity   : ${tempData["day"]["avghumidity"]}\n'
          '  Rain chances       : ${tempData["day"]["daily_will_it_rain"]}\n');
    }
  } else {
    print('an error');
  }
}
