import 'package:weather_app/core/data/dummy_data.dart';

class HourlyForecast {
  final String time;
  final double temp_c;

  HourlyForecast({this.time, this.temp_c});

  factory HourlyForecast.getDataFromApi(Map response, int index) {
    String time = data['forecast']['forecastday'][0]['hour'][index]['time'];
    double temp_c = data['forecast']['forecastday'][0]['hour'][index]['temp_c'];
    return HourlyForecast(
      time: time,
      temp_c: temp_c,
    );
  }
}
