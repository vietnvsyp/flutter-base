import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:eminel_app/server/log_api_endpoint.dart';
import 'package:eminel_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class LogAPIService {
  factory LogAPIService() => _instance;

  LogAPIService._internal();

  static final LogAPIService _instance = LogAPIService._internal();

  Future<void> logging({
    required String action,
    required String target,
    String? roomID,
    String? targetID,
    String? sub,
    required String os,
    required String osversion,
    required bool wifi,
    required String appversion,
  }) async {
    final url = Uri.parse(LogApiEndpoint().log());
    final body = {
      "action": action,
      "target": target,
      "os": os,
      "osversion": osversion,
      "wifi": true,
      "appversion": appversion
    };
    if (roomID != null) {
      body['roomID'] = roomID;
    }
    if (targetID != null) {
      body['targetID'] = targetID;
    }
    if (sub != null) {
      body['sub'] = sub;
    }

    developer.log("ACTION: ${action.toUpperCase()}, body: $body",
        name: 'APPLOG');

    await http.post(url,
        headers: await Util.createHeader(), body: jsonEncode(body));
  }
}
