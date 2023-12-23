import 'package:flutter/material.dart';
import 'Views/main_screen.dart';

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
      theme: ThemeData(colorScheme:ColorScheme.fromSwatch().copyWith(
    secondary: Colors.deepPurpleAccent, // Your accent color
  ),),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MainScreen(),
      ),
    );
  }
}
