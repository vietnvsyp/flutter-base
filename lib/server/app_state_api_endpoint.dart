import 'dart:io';

class AppStateApiEndpoint {
  factory AppStateApiEndpoint() => _instance;
  AppStateApiEndpoint._internal();

  static final AppStateApiEndpoint _instance = AppStateApiEndpoint._internal();

  String baseURL() {
    if (const String.fromEnvironment('APP_ENV') == 'prod' ||
        const String.fromEnvironment('APP_ENV') == 'stg') {
      return 'https://api.mui-kurashi.net/app-state/v1';
    } else {
      return 'https://api.dev.mui-kurashi.net/app-state/';
    }
  }

  String appState() {
    final app = Platform.isIOS ? 'ios' : 'android';
    return '${baseURL()}/mobileapps/$app';
  }
}
