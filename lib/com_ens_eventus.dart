library com_ens_eventus;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

class EventusUtil {
  void postEvent() async {
    await _getDeviceId();
  }

  Future<String> _getDeviceId() async {
    String udid = await FlutterUdid.udid;
    debugPrint("eventusX:::DeviceId:::$udid");
    return udid;
  }
}