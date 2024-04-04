class ApiEndpoint {
  factory ApiEndpoint() => _instance;
  ApiEndpoint._internal();

  static final ApiEndpoint _instance = ApiEndpoint._internal();

  String baseURL() {
    if (const String.fromEnvironment('APP_ENV') == 'prod') {
      return 'https://newsapi.org/v2/everything';
    } else if (const String.fromEnvironment('APP_ENV') == 'stg') {
      return 'https://newsapi.org/v2/everything';
    } else {
      return 'https://newsapi.org/v2/everything';
    }
  }

  String welcomePage() {
    return '${baseURL()}/welcomePage';
  }
}
