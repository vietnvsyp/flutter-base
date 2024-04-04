import 'dart:async';

import 'package:eminel_app/presentation/pages/main/main_view.dart';
import 'package:eminel_app/utils/logger/crash_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  runZonedGuarded<Future<void>>(() async {
    tz.initializeTimeZones();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    CrashLogger.initialize();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    runApp(
      ProviderScope(
        child: MainView(),
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }, (error, stack) {
    CrashLogger.recordCrashLog(error, stack, "run-zoned-error", false);
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
