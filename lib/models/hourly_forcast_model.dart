import 'package:weather_app/core/data/dummy_data.dart';

class HourlyForecast {
  final String time;
  // ignore: non_constant_identifier_names
  final double temp_c;

  // ignore: non_constant_identifier_names
  HourlyForecast({required this.time, required this.temp_c});

  factory HourlyForecast.getDataFromApi(Map response, int index) {
    String time = data['forecast']['forecastday'][0]['hour'][index]['time'];
    double tempC = data['forecast']['forecastday'][0]['hour'][index]['temp_c'];
    return HourlyForecast(
      time: time,
      temp_c: tempC,
    );
  }
}
