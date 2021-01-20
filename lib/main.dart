import 'package:flutter/material.dart';
import 'package:weather_app/views/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
