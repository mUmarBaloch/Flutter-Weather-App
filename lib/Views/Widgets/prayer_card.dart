import 'package:flutter/material.dart';
import 'package:weather_app/core/device_config.dart';

class PrayerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 120,
          width: DeviceConfig().width * 0.15,
          decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/fajr.jpg'),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                offset: Offset(1, 1.2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '6:20',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'AM',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Color.fromRGBO(138, 104, 236, 1),
                ),
                child: Center(
                  child: Text(
                    'FAJR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
