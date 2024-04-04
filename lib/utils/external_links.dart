abstract class ExternalLinks {
  String get dynamicLinkPrefix;
  String get help;

  factory ExternalLinks() {
    switch (const String.fromEnvironment('APP_PRODUCT_NAME')) {
      default:
        return _ExternalLinksShizgas();
    }
  }
}

class _ExternalLinksShizgas implements ExternalLinks {
  String help = 'https://url.mui-cloud.net/v1/s/shizgas-ss';

  get dynamicLinkPrefix {
    switch (const String.fromEnvironment('APP_ENV')) {
      case 'prod':
        return 'https://shizugas-kurashi.page.link';
      default:
        return 'https://shizugas-kurashi-beta.page.link';
    }
  }

  get callbackDynamicLinkUrl => '$dynamicLinkPrefix/app';
}
