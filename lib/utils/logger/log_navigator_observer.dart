import 'package:eminel_app/utils/logger/logger.dart';
import 'package:flutter/material.dart';

class LogNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final screenName = route.settings.name;

    /// 未ログイン時はユーザー情報が取れないので除外
    if ((screenName != null) && !screenName.startsWith('/welcome')) {
      Logger.logScreen(screenName: route.settings.name);
    }
  }
}
