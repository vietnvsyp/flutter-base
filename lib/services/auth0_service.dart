import 'dart:developer' as developer;

import 'package:auth0_flutter/auth0_flutter.dart';

class Auth0Service {
  static Auth0Service? _instance;

  final String _audience;
  final Set<String> _scopes;
  final Auth0 _auth0;

  Auth0Service._internal(this._auth0, this._audience, this._scopes);

  static void configure(
    String domain,
    String clientId,
    String audience,
    Set<String> scopes,
  ) {
    if (_instance != null) {
      throw StateError('Already configured!');
    }
    final auth0 = Auth0(domain, clientId);
    _instance = Auth0Service._internal(auth0, audience, scopes);
  }

  static Auth0Service get instance {
    if (_instance == null) {
      throw StateError('Not configured yet!');
    }
    return _instance!;
  }

  // Future<String> get accessToken async {
  //   try {
  //     final credentials = await _auth0.credentialsManager.credentials();
  //     return credentials.accessToken;
  //   } catch (e) {
  //     developer.log("Auth0Service.accessToken: $e", name: 'ERROR');
  //     throw e;
  //   }
  // }
  //
  // Future<String> get idToken async {
  //   try {
  //     final credentials = await _auth0.credentialsManager.credentials();
  //     return credentials.idToken;
  //   } catch (e) {
  //     developer.log("Auth0Service.idToken: $e", name: 'ERROR');
  //     throw e;
  //   }
  // }
  //
  // get isLoggedIn async => await _auth0.credentialsManager.hasValidCredentials();
  //
  // Future<bool> signin() async {
  //   try {
  //     const scheme = String.fromEnvironment('APP_URL_SCHEME');
  //     await _auth0
  //         .webAuthentication(scheme: scheme)
  //         .login(audience: _audience, scopes: _scopes);
  //     return true;
  //   } catch (e) {
  //     developer.log("Auth0Service.signin: $e", name: 'ERROR');
  //     return false;
  //   }
  // }
  //
  // Future<bool> signout() async {
  //   try {
  //     const scheme = String.fromEnvironment('APP_URL_SCHEME');
  //     await _auth0.webAuthentication(scheme: scheme).logout();
  //     return true;
  //   } catch (e) {
  //     developer.log("Auth0Service.signout: $e", name: 'ERROR');
  //     return false;
  //   }
  // }
}
