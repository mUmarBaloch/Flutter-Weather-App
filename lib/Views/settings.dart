import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 05,
                    offset: Offset(1, 4),
                  ),
                ],
              ),
              height: 400,
              width: 350,
              child: Column(
                children: [
                  spacer(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: buildIcon(Icons.arrow_back_ios_outlined),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      buildIcon(Icons.settings),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  spacer(10),
                  ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      size: 30,
                      color: Color.fromRGBO(138, 104, 236, 1),
                    ),
                    title: Card(
                      elevation: 05,
                      child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Location',
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  buildOption("Remind me when its Rainy Tommorrow", null),
                  spacer(10),
                  buildIcon(
                    Icons.nightlight_round,
                  ),
                  spacer(10),
                  buildOption("Show me Prayer times", null),
                  SizedBox(height: 10),
                  buildOption("remind me when its prayer time", null)
                ],
              ),
            ),
          ),
        ),
      );

  SizedBox spacer(double height) => SizedBox(height: height);

  Align buildIcon(IconData icon, {int size = 45}) {
    return Align(
        alignment: Alignment.topCenter,
        child: Icon(
          icon,
          size: 45,
          color: Color.fromRGBO(138, 104, 236, 1),
        ));
  }

  ListTile buildOption(text, function) {
    return ListTile(
      title: Text(
        '$text',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Radio(value: true, groupValue: null, onChanged: function),
    );
  }
}
