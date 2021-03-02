// all constants related to styling

import 'package:flutter/material.dart';

final LinearGradient primaryGradient = LinearGradient(colors: [
  Color.fromRGBO(53, 122, 224, 1),
  Color.fromRGBO(104, 188, 236, 1),
]);

final BoxDecoration mainScreenDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(53, 122, 224, 1),
      Color.fromRGBO(104, 188, 236, 1),
    ],
  ),
);
final BoxDecoration predictionCardDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(53, 122, 224, 1),
        Color.fromRGBO(104, 188, 236, 1),
      ],
    ),
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.25),
        blurRadius: 4,
        offset: Offset(1, 1.2),
        spreadRadius: 0,
      )
    ]);

final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15)));
