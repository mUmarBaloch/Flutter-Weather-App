class PredictionWeather {
  final int temprature;
  final String status;
  final int rainChances;
  final int humidity;

  PredictionWeather(
      {this.temprature, this.status, this.rainChances, this.humidity});
}

List<PredictionWeather> prediction = [
  PredictionWeather(
      humidity: 29, status: 'clear', rainChances: 2, temprature: 29),
  PredictionWeather(
      humidity: 15, status: 'cloudy', rainChances: 26, temprature: 26),
  PredictionWeather(
      humidity: 12, status: 'thunder', rainChances: 68, temprature: 27),
  PredictionWeather(
      humidity: 14, status: 'rainy', rainChances: 97, temprature: 23),
];
