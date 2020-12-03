class PrayerTime {
  final String city;
  final String time;
  final String prayerName;

  PrayerTime({this.city, this.time, this.prayerName});
}

class SunDetails {
  final String city;
  final String sunriseTime;
  final String sunsetTime;

  SunDetails({this.city, this.sunriseTime, this.sunsetTime});
}

final prayerName = ['FAJR', 'DHUR', 'ASAR', 'MGHRIB', 'ISHA'];

final prayerBg = [
  'fajr.jpg',
  'dhur.jpeg',
  'asar.jpg',
  'maghrib.jpg',
  'isha.jpg'
];
