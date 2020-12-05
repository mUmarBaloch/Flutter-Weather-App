import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/prayer_models.dart';
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
      decoration: mainScreenDecoration,
      child: Column(children: <Widget>[
        TopWeatherWidget(),
        SizedBox(height: _device.height * 0.05),
        PredictionCardContainer(),
        SizedBox(height: _device.height * 0.03),
        prayerCardContainer(
          sunStatus: sunStatus,
        ),
      ]),
    );
  }

  Row sunStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}

class PredictionCardContainer extends StatelessWidget {
  DeviceConfig _device = DeviceConfig();
  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: _device.height * 0.22,
      decoration: cardDecoration,
    );
  }
}

class prayerCardContainer extends StatelessWidget {
  @override
  DeviceConfig _device = DeviceConfig();
  final sunStatus;

  prayerCardContainer({this.sunStatus});

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
}
