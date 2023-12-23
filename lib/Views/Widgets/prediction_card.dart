import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class PredictionCard extends StatefulWidget {
  final String day;
  final num temprature;
  final String status;
  final num humidity;
  final num maxWind;

  const PredictionCard({
    required this.day,
   required  this.temprature,
   required  this.status,
   required this.humidity,
  required  this.maxWind,
  });

  @override
  _PredictionCardState createState() => _PredictionCardState();
}

class _PredictionCardState extends State<PredictionCard> {
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
              '${widget.day}',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, letterSpacing: 1),
            ),
            Text(
              '${widget.temprature.floor()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              '${widget.status}',
              textAlign: widget.status.length > 14 ? TextAlign.center : null,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.status.length > 14 ? 9 : 15,
                fontWeight: widget.status.length > 14
                    ? FontWeight.bold
                    : FontWeight.normal,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 0),
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
                      '${widget.maxWind}',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/rainDropIcon.png'),
                      width: 20,
                    ),
                    Text(
                      '${widget.humidity}%',
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
