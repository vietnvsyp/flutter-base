import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

const String spCurrentBillingBaseNo = 'currentBillingBaseNo';

get packageName => const String.fromEnvironment('APP_ID');
get bundleID => const String.fromEnvironment('APP_ID');

class Util {
  /// TODO: create header http request
  static Future<Map<String, String>> createHeader() async {
    try {
      const token = 'unknown';
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
    } on AuthException catch (_) {
      /// TODO: token生成できない場合ログアウト処理をしたい
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer unknown'
      };
    }
  }

  static const assetPath = 'asset/';
}
