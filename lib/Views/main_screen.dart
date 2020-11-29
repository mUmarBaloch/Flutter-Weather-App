import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/prediction_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/Widgets/top_weather_widget.dart';

import 'Widgets/prayer_card.dart';
import 'Widgets/prediction_card.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PredictionCard(
                temprature: prediction[index].temprature,
                status: prediction[index].status,
                rainChances: prediction[index].rainChances,
                humidity: prediction[index].humidity,
              ),
              itemCount: prediction.length,
            ),
            height: _device.height * 0.22,
            decoration: cardDecoration,
          ),
        ),
        SizedBox(height: _device.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => PrayerCard(),
                    itemCount: 5,
                  ),
                )
              ],
            ),
            height: _device.height * 0.30,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ]),
    );
  }
}
