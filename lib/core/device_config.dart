import 'package:flutter/material.dart';

// widget binging method
class DeviceConfig {
  final height = WidgetsBinding.instance.window.physicalSize.height /
      WidgetsBinding.instance.window.devicePixelRatio;
  final width = WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;
}

// using media query {uses context to set value of device configuration}
class DeviceConfigQuery {
  var height;
  var width;
  deviceConfigInit(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
