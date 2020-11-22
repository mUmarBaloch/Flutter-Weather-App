import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class PredictionCard extends StatelessWidget {
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
              '23',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              'clear',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      '0%',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.redeem,
                      color: Colors.white,
                      size: 20,
                    ),
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
