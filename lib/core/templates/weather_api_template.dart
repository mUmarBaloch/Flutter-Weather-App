abstract class WeatherApiTemplate {
  // get a string of current temprature
  Future<num> getCurrentWeather(String city);
  // get a list of forecast of different days
  Future<List> getForecast(String city, int days);
  //add more functions
}
