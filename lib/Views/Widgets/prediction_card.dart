import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class PredictionCard extends StatelessWidget {
  final int temprature;
  final String status;
  final num humidity;
  final num rainChances;

  const PredictionCard({
    this.temprature,
    this.status,
    this.humidity,
    this.rainChances,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: 130,
        decoration: predictionCardDecoration,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Today',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            ),
            Text(
              '$temprature',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              '$status',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/windIcon.png'),
                      width: 20,
                    ),
                    Text(
                      '$rainChances%',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/rainDropIcon.png'),
                    Text(
                      '$humidity%',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
