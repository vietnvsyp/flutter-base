import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:eminel_app/utils/constants.dart';
import 'package:eminel_app/utils/logger/crash_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logger {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static logScreen({required String? screenName}) async {
    if (screenName != null) {
      analytics.logScreenView(screenName: screenName);
      CrashLogger.addHelpfulLog(screenName);

      final prefs = await SharedPreferences.getInstance();
      final billingBaseNo = prefs.getString(spCurrentBillingBaseNo);

      await _logging(
          action: 'access', target: screenName, billingBaseNo: billingBaseNo);
    }
  }

  static _logging(
      {required String action,
      required String target,
      String? billingBaseNo,
      String? targetID,
      String? sub}) async {
    final osName = _osName();
    final osVersion = await _osVersion();
    final isWifi = await _isWifi();
    final appVersion = await _appVersion();

    //   TODO: LOGGING
  }

  static String _osName() {
    if (Platform.isIOS) {
      return 'iOS';
    } else {
      return 'android';
    }
  }

  static Future<String> _osVersion() async {
    try {
      if (Platform.isAndroid) {
        final info = await deviceInfoPlugin.androidInfo;
        return info.version.release;
      } else if (Platform.isIOS) {
        final info = await deviceInfoPlugin.iosInfo;
        return info.systemVersion;
      } else {
        return '';
      }
    } on PlatformException {
      return '';
    }
  }

  static Future<bool> _isWifi() async {
    var res = await Connectivity().checkConnectivity();
    return res == ConnectivityResult.wifi;
  }

  static Future<String> _appVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
