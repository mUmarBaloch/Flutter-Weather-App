import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class PredictionCard extends StatelessWidget {
  final temprature;
  final status;

  const PredictionCard({this.temprature, this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: 120,
        decoration: predictionCardDecoration,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/rainIcon.png'),
                    ),
                    Text(
                      '23%',
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
                      '0%',
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
