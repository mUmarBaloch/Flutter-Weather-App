import 'package:flutter/material.dart';
import 'package:weather_app/Views/Widgets/prayer_card.dart';
import 'package:weather_app/core/data/constants.dart';
import 'package:weather_app/core/device_config.dart';

class PrayerCardContainerWidget extends StatelessWidget {
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
            prayersList()
          ],
        ),
        height: _device.height * 0.30,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      );

// prayer list widget
  Expanded prayersList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => PrayerCard(
          prayerName: prayerName[index],
          prayerBg: prayerBg[index],
        ),
        itemCount: 5,
      ),
    );
  }

// sun status widget

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
