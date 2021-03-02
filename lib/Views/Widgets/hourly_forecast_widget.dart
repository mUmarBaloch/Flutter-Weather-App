import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/hourly_forcast_model.dart';

class HourlyForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            child: Row(
              children: data
                  .map((data) => hourlyForecastDataTimeWidget(data.temp_c))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 100,
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Sparkline(
              lineGradient: primaryGradient,
              data: chartData(),
              pointsMode: PointsMode.all,
              pointSize: 7,
              sharpCorners: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 330,
            child: Row(
              children: data
                  .map((data) => hourlyForecastDataTimeWidget(data.time))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

List<HourlyForecast> data = [
  HourlyForecast(time: '10 am', temp_c: 23.3),
  HourlyForecast(time: '2 pm', temp_c: 31.0),
  HourlyForecast(time: '7 pm', temp_c: 27.7),
  HourlyForecast(time: '11 pm', temp_c: 25.2),
];

Iterable<double> chartData() {
  return data.map((e) => e.temp_c).toList();
}

Widget hourlyForecastDataTempWidget(data) {
  return Row(
    children: [
      Text(
        data.toString(),
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 70),
    ],
  );
}

Widget hourlyForecastDataTimeWidget(data) {
  return Row(
    children: [
      Text(
        data.toString(),
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 70),
    ],
  );
}
