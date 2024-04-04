class LogApiEndpoint {
  factory LogApiEndpoint() => _instance;
  LogApiEndpoint._internal();

  static final LogApiEndpoint _instance = LogApiEndpoint._internal();

  String baseURL() {
    if (const String.fromEnvironment('APP_ENV') == 'prod') {
      return 'https://api.mui-kurashi.net/client-log/v1';
    } else if (const String.fromEnvironment('APP_ENV') == 'stg') {
      return 'https://api.mui-kurashi.net/client-log/dev';
    } else {
      return 'https://api.dev.mui-kurashi.net/client-log-dev';
    }
  }

  String log() {
    return '${baseURL()}/applogs';
  }
}
