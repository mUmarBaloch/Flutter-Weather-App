import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/data/constants.dart';
import 'package:weather_app/core/data/weather_data.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/prediction_weather_model.dart';
import 'package:weather_app/views/Widgets/top_weather_widget.dart';

import 'Widgets/prayer_card.dart';
import 'Widgets/prediction_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DeviceConfig _device = DeviceConfig();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: mainScreenDecoration,
      child: Column(children: <Widget>[
        TopWeatherWidget(),
        SizedBox(height: _device.height * 0.05),
        PredictionCardContainer(),
        SizedBox(height: _device.height * 0.03),
        PrayerCardContainer(),
      ]),
    );
  }
}

class PredictionCardContainer extends StatefulWidget {
  @override
  _PredictionCardContainerState createState() =>
      _PredictionCardContainerState();
}

class _PredictionCardContainerState extends State<PredictionCardContainer> {
  final DeviceConfig _device = DeviceConfig();

  @override
  Widget build(BuildContext context) {
    return ForecastData.forecast != null
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PredictionCard(
                temprature: ForecastData.forecast[index]['day']['mintemp_c'],
                status: ForecastData.forecast[index]['day']['condition']
                    ['text'],
                rainChances: ForecastData.forecast[index]['day']['maxwind_mph'],
                humidity: ForecastData.forecast[index]['day']['abghumidity'],
              ),
              itemCount: ForecastData.forecast.length,
            ),
            height: _device.height * 0.25,
            decoration: cardDecoration,
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
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
            height: _device.height * 0.25,
            decoration: cardDecoration,
          );
  }
}

class PrayerCardContainer extends StatelessWidget {
  final DeviceConfig _device = DeviceConfig();
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            sunStatus(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => PrayerCard(
                  prayerName: prayerName[index],
                  prayerBg: prayerBg[index],
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
        height: _device.height * 0.30,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      );

  Row sunStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        Container(
            width: 220,
            height: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Line.png',
                    ),
                    fit: BoxFit.fitWidth))),
        Column(
          children: [
            Text('5:30 PM'),
            Image.asset('assets/sunsetIco.png'),
          ],
        ),
      ],
    );
  }
}
