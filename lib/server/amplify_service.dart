import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyService {
  factory AmplifyService() => _instance;

  AmplifyService._internal();

  static final AmplifyService _instance = AmplifyService._internal();

  Future<bool> get isSignedIn async {
    final session = await Amplify.Auth.fetchAuthSession();
    return session.isSignedIn;
  }

  /// configure Amplify
  Future<void> configureAmplify(String amplifyconfig) async {
    if (!Amplify.isConfigured) {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
    }
  }

  /// open Cognito Hosted UI
  Future<bool> signInWithWebUI({provider}) async {
    try {
      SignInResult res = await Amplify.Auth.signInWithWebUI(provider: provider);
      return res.isSignedIn;
    } on AuthException catch (e) {
      print('Error: ' + e.message);
      throw e;
    }
  }

  /// Sign in Cognito
  Future<bool> signIn(String email, String password) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: email, password: password);
      return res.isSignedIn;
    } on AuthException catch (e) {
      print('ServiceAmplify.signIn: ${e.message}');
      throw e;
    }
  }

  /// Sign out Cognito
  Future<bool> signOut() async {
    try {
      await Amplify.Auth.signOut();
      return true;
    } on AuthException catch (e) {
      print('ServiceAmplify.signOut: ${e.message}');
      throw e;
    }
  }

  /// Sign Up Cognito
  Future<bool> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String firstNameKana,
      required String lastNameKana}) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.familyName: lastName,
        CognitoUserAttributeKey.givenName: firstName,
        CognitoUserAttributeKey.custom('family_name_kana'): lastNameKana,
        CognitoUserAttributeKey.custom('given_name_kana'): firstNameKana,
        CognitoUserAttributeKey.email: email,
      };
      await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: SignUpOptions(userAttributes: userAttributes));
      return true;
    } on AuthException catch (e) {
      print('ServiceAmplify.signUp: ${e.message}');
      throw e;
    }
  }

  ///Confirm Sign Up Cognito
  Future<bool> confirmSignUp(String email, String confirmationCode) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: confirmationCode);
      return res.isSignUpComplete;
    } on AuthException catch (e) {
      print('ServiceAmplify.confirmSignUp: ${e.message}');
      throw e;
    }
  }

  ///Resend Sign Up Code Cognito
  Future<bool> resendSignUpCode(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
      return true;
    } on AuthException catch (e) {
      print('ServiceAmplify.resendSignUpCode: ${e.message}');
      throw e;
    }
  }

  /// Reset password cognito
  Future<bool> resetPassword(String email) async {
    try {
      await Amplify.Auth.resetPassword(username: email);
      return true;
    } on AuthException catch (e) {
      print('ServiceAmplify.resetPassword: ${e.message}');
      throw e;
    }
  }

  /// Confirm reset password cognito
  Future<bool> confirmResetPassword(
      String email, String newPassword, String code) async {
    try {
      await Amplify.Auth.confirmResetPassword(
          username: email, newPassword: newPassword, confirmationCode: code);
      return true;
    } on AuthException catch (e) {
      print('ServiceAmplify.confirmResetPassword: ${e.message}');
      throw e;
    }
  }

  /// Return string empty if not sign in else return string token
  Future<String> getAccessToken() async {
    try {
      final resp = await Amplify.Auth.fetchAuthSession(
        options: FetchAuthSessionOptions(forceRefresh: false),
      ) as CognitoAuthSession;
      return resp.userPoolTokensResult.value.accessToken.raw;
    } on AuthException catch (e) {
      print('ServiceAmplify.getAccessToken: ${e.message}');
      throw e;
    }
  }

  /// Return string empty if not sign in else return string token
  Future<String> getIDToken() async {
    try {
      final resp = await Amplify.Auth.fetchAuthSession(
        options: FetchAuthSessionOptions(forceRefresh: false),
      ) as CognitoAuthSession;
      return resp.userPoolTokensResult.value.idToken.raw;
    } on AuthException catch (e) {
      print('ServiceAmplify.getIDToken: ${e.message}');
      throw e;
    }
  }
}
