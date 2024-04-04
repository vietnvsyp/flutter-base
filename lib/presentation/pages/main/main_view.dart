import 'package:eminel_app/l10n/l10n.dart';
import 'package:eminel_app/presentation/pages/splash/splash_view.dart';
import 'package:eminel_app/presentation/pages/welcome/welcome_view.dart';
import 'package:eminel_app/utils/logger/log_navigator_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MainView extends HookConsumerWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  final LogNavigatorObserver logObserver = LogNavigatorObserver();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[observer, logObserver],
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        builder: FlutterI18n.rootAppBuilder(),
        locale: const Locale('ja'),
        initialRoute: '/',
        navigatorKey: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case WelcomeView.routeName:
              return MaterialPageRoute(
                  builder: (context) => WelcomeView(),
                  settings: const RouteSettings(name: WelcomeView.routeName));

            default:
              return MaterialPageRoute(builder: (context) => SplashView());
          }
        });
  }
}
