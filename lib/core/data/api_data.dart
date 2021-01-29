class WeatherApiData {
  String _apiKey = 'bab4038cddf142a7b87133900202712';
  String _weatherApiLink = 'https://api.weatherapi.com/v1/';
  String _currentWeatherEndPoint = 'current.json?';
  String get apiKey => _apiKey;
  String get weatherApiLink => _weatherApiLink;
  String get currentWeatherEndPoint => _currentWeatherEndPoint;
}
