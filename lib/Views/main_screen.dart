import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/prediction_card.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/wether_model.dart';
import 'package:weather_app/views/Widgets/prediction_card.dart' as card;
import 'package:weather_app/views/Widgets/top_weather_widget.dart';

import 'Widgets/prayer_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Weather _data = Weather();
  DeviceConfig _device = DeviceConfig();
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
        TopWeatherWidget(),
        SizedBox(height: _device.height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: sample
                  .map((obj) => card.PredictionCard(
                      temprature: obj.temprature, status: obj.status))
                  .toList(),
            ),
            height: _device.height * 0.22,
            decoration: cardDecoration,
          ),
        ),
        SizedBox(height: _device.height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text('6:00 AM'),
                        Image.asset(
                          'assets/sunsriseIcon.png',
                        ),
                      ],
                    ),
                    Image.asset('assets/Line.png'),
                    Column(
                      children: [
                        Text('5:30 PM'),
                        Image.asset('assets/sunsetIco.png'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PrayerCard(),
                      PrayerCard(),
                      PrayerCard(),
                      PrayerCard(),
                    ],
                  ),
                ),
              ],
            ),
            height: _device.height * 0.32,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ]),
    );
  }
}
