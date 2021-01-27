import 'package:flutter/material.dart';
import 'package:weather_app/core/data/weather_data.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/views/settings.dart';

class TopWeatherWidget extends StatefulWidget {
  @override
  _TopWeatherWidgetState createState() => _TopWeatherWidgetState();
}

class _TopWeatherWidgetState extends State<TopWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig _device = DeviceConfig();
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: _device.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/asar.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _device.width * .14,
                ),
                Text(
                  '${WeatherData.city.value}',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.deepPurpleAccent,
                    icon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => Settings()),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              '${WeatherData.celcius.floor()}',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: -5,
                  fontSize: 80,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ForecastData.forecast != null
                  ? ForecastData.forecast[0]['day']['condition']['text']
                  : 'default',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.2,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
