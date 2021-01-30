class WeatherApiData {
  //https://api.weatherbit.io/v2.0/current?city=Mirpur%20khas&country=pk&key=febd9f38cad4483b90f90e87943b3ecf
  String _apiKeyCurrentWeather = 'febd9f38cad4483b90f90e87943b3ecf';
  String get apiKeyCurrentWeather => _apiKeyCurrentWeather;

  String _apiKeyForecast = 'bab4038cddf142a7b87133900202712';
  String get apiKeyForecast => _apiKeyForecast;

  String _weatherApiLinkCurrentWeather = 'https://api.weatherbit.io/v2.0/';
  String get weatherApiLinkCurrentWeather => _weatherApiLinkCurrentWeather;

  String _weatherApiLinkForecast = 'http://api.weatherapi.com/v1/';
  String get weatherApiLinkForecast => _weatherApiLinkForecast;

  String _currentWeatherEndPoint = 'current?';
  String get currentWeatherEndPoint => _currentWeatherEndPoint;
}
