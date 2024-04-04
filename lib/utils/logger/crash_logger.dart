import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

class CrashLogger {
  static initialize() {
    applyCrashlyticsCollectionEnabled();
    overrideFlutterOnErrorFunction();
    addIsolateErrorHandlingFunction();
  }

  static applyCrashlyticsCollectionEnabled() {
    const enabled = bool.fromEnvironment('dart.vm.product');
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
  }

  static addHelpfulLog(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  static overrideFlutterOnErrorFunction() {
    FlutterError.onError = (flutterErrorDetails) {
      FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails);
    };
  }

  static addIsolateErrorHandlingFunction() {
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await recordCrashLog(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        "isolate-error",
        true,
      );
    }).sendPort);
  }

  static Future recordCrashLog(
    dynamic exception,
    StackTrace? stack,
    String reason,
    bool fatal,
  ) {
    return FirebaseCrashlytics.instance.recordError(
      exception,
      stack,
      reason: reason,
      fatal: fatal,
    );
  }
}
