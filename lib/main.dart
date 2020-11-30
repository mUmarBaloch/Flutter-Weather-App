import 'package:flutter/material.dart';
import 'package:weather_app/Views/main_screen.dart';
import 'package:weather_app/views/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.deepPurple),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: MainScreen(),
      ),
    );
  }
}
