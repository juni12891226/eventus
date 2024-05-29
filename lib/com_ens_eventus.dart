library com_ens_eventus;

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

class EventusUtil {
  static void postEvent() async {
    _getDeviceId();
    _getDeviceMake();
  }

  static Future<String> _getDeviceId() async {
    String udid = await FlutterUdid.udid;
    debugPrint("eventusX:::DeviceId:::$udid");
    return udid;
  }

  static Future<String> _getDeviceMake() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      debugPrint("eventusX:::iOSBrand:::${iosDeviceInfo.name}");
      return iosDeviceInfo.name;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      debugPrint("eventusX:::AndroidBrand:::${androidDeviceInfo.brand}");
      return androidDeviceInfo.brand; // unique ID on Android
    } else {
      return "Unknown Platform Exception!";
    }
  }
}
