// interface for weather api manager
abstract class WeatherApiTemplate {
  // get a string of current temprature
  Future<num> getCurrentWeather(String city, String country);
  // get a list of forecast of different days
  Future<List> getForecast(String city, int days);
  //get hourly forecast of current day
  Future<dynamic> getHourlyForecast(String city, String country, int index);
}
