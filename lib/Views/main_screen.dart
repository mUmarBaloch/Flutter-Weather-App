import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/prediction_card.dart';

import 'Widgets/prayer_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(53, 122, 224, 1),
            Color.fromRGBO(104, 188, 236, 1),
          ],
        ),
      ),
      child: Column(children: <Widget>[
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/asar.jpg'), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Mirpukhas',
                style: TextStyle(
                    color: Colors.white, letterSpacing: 0.5, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '19',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: -5,
                    fontSize: 80,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'cloudy',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.2,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                PredictionCard(),
                SizedBox(
                  width: 20,
                ),
                PredictionCard(),
                SizedBox(
                  width: 20,
                ),
                PredictionCard(),
              ],
            ),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 20),
                PrayerCard(),
                SizedBox(width: 20),
                PrayerCard(),
                SizedBox(width: 20),
                PrayerCard(),
              ],
            ),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ]),
    );
  }
}
