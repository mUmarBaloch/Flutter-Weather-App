import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/data/constants.dart';
import 'package:weather_app/core/data/weather_data.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/Widgets/top_weather_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Widgets/prayer_card.dart';
import 'Widgets/prediction_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

StreamController weatherStreamController = StreamController();
cityStream() {
  if (WeatherData.city != null) {
    weatherStreamController.sink.add(WeatherData.city);
  } else {
    weatherStreamController.sink.addError(WeatherData.city);
  }
}

class _MainScreenState extends State<MainScreen> {
  DeviceConfig _device = DeviceConfig();
  //fixed #3

  @override
  void dispose() {
    weatherStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: weatherStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              decoration: mainScreenDecoration,
              child: Column(children: <Widget>[
                TopWeatherWidget(),
                SizedBox(height: _device.height * 0.05),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: _device.height * 0.25,
                    decoration: cardDecoration,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpinKitDualRing(
                            color: Colors.deepPurpleAccent,
                            size: 20,
                          ),
                          Text(
                              'Please add city by click on search icon at top'),
                        ],
                      ),
                    )),
                SizedBox(height: _device.height * 0.03),
                PrayerCardContainer(),
              ]),
            );
          }
          if (snapshot.hasError) {
            return Container(
              decoration: mainScreenDecoration,
              child: Column(children: <Widget>[
                TopWeatherWidget(),
                SizedBox(height: _device.height * 0.05),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: _device.height * 0.25,
                    decoration: cardDecoration,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SpinKitDualRing(
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          Text(
                              'Oops! There was an error, please create an issue on github'),
                        ],
                      ),
                    )),
                SizedBox(height: _device.height * 0.03),
                PrayerCardContainer(),
              ]),
            );
          } else
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
        });
  }
}

class PredictionCardContainer extends StatefulWidget {
  @override
  _PredictionCardContainerState createState() =>
      _PredictionCardContainerState();
}

class _PredictionCardContainerState extends State<PredictionCardContainer> {
  DeviceConfig _device;
  @override
  void initState() {
    _device = DeviceConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String>(
      valueListenable: WeatherData.city,
      builder: (context, value, child) {
        print(value);
        if (value.isNotEmpty) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PredictionCard(
                day: days[index],
                temprature: ForecastData.forecast[index]['day']['mintemp_c'],
                status: ForecastData.forecast[index]['day']['condition']
                    ['text'],
                maxWind: ForecastData.forecast[index]['day']['maxwind_mph'],
                humidity: ForecastData.forecast[index]['day']['avghumidity'],
              ),
              itemCount: days.length,
            ),
            height: _device.height * 0.25,
            decoration: cardDecoration,
          );
        } else {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: _device.height * 0.25,
            decoration: cardDecoration,
            child: SpinKitRotatingCircle(
              color: Colors.deepPurpleAccent,
            ),
          );
        }
      });
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
