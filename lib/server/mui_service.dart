import 'dart:async';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:eminel_app/data/entities/news_entity.dart';
import 'package:eminel_app/data/models/error.dart';
import 'package:eminel_app/server/rest_client/rest_client.dart';

class MuiService {
  factory MuiService() => _instance;

  MuiService._internal();

  static final MuiService _instance = MuiService._internal();

  _showApiLog(Response res) {
    developer.log(
        "API: (${res.statusCode}) [${res.requestOptions.method}] ${res.requestOptions.uri}",
        name: 'APPLOG');
  }

  Future<List<NewsEntity>> getAllNews(
      String content, String from, String apiKey) async {
    try {
      final res = await client.getAllNews(content, from, apiKey);
      _showApiLog(res.response);
      return res.data;
    } catch (e) {
      throw _catchError(e);
    }
  }

  _catchError(Object err) {
    try {
      if (err is DioError) {
        final res = err.response;
        if (res == null) {
          throw const Error.networkException();
        } else {
          final error = Error.getApiError(res);
          _showApiErrorLog(res);
          throw error;
        }
      } else {
        _showOtherErrorLog(err);
        throw const Error.unexpectedError();
      }
    } on Error catch (e) {
      throw e;
    }
  }

  _showApiErrorLog(Response res) {
    developer.log(
        "API_ERROR: (${res.statusCode}) [${res.requestOptions.method}] ${res.requestOptions.uri}",
        name: 'APPLOG');
    developer.log("API_ERROR: (${res.statusCode}) ${res.data}", name: 'APPLOG');
  }

  _showOtherErrorLog(Object err) {
    developer.log("ERROR: $err", name: 'APPLOG');
  }
}
