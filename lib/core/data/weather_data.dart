import 'package:flutter/cupertino.dart';

class WeatherData {
  static String locationKey = "Default";
  static double celcius = 0.0;
  static ValueNotifier<String> city = ValueNotifier<String>('default');
  static void changeCity(String value) {
    city.value = value;
  }
}

class ForecastData {
  static List? forecast;
}
