import 'package:flutter/material.dart';
import 'package:weather_app/core/device_config.dart';
import 'package:weather_app/models/wether_model.dart';

class TopWeatherWidget extends StatelessWidget {
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
    );
  }
}
