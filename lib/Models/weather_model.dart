class Weather {
  final String city;
  final int temprature;
  final String status;

  Weather({this.city, this.temprature, this.status});
}

List<Weather> sample = [
  Weather(city: 'Karachi', temprature: 18, status: 'clear'),
  Weather(city: 'Mirpurkhas', temprature: 27, status: 'clouldy'),
  Weather(city: 'Hyderabad', temprature: 22, status: 'clear'),
  Weather(city: 'Nawabshah', temprature: 19, status: 'clear'),
];
