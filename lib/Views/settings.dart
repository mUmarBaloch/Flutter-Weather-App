import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
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
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.settings,
                      size: 45,
                      color: Color.fromRGBO(138, 104, 236, 1),
                    )),
                SizedBox(height: 10),
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
                ListTile(
                  title: Text(
                    'Remind me when its Rainy Tommorrow',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing:
                      Radio(value: true, groupValue: null, onChanged: null),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.nightlight_round,
                      size: 45,
                      color: Color.fromRGBO(138, 104, 236, 1),
                    )),
                SizedBox(height: 10),
                ListTile(
                  title: Text(
                    'Show me Prayer times',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing:
                      Radio(value: true, groupValue: null, onChanged: null),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text(
                    'remind me when its prayer time',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing:
                      Radio(value: true, groupValue: null, onChanged: null),
                ),
              ],
            ),
          ),
        ),
      );
}
