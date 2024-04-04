import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

@freezed
abstract class Error with _$Error {
  const factory Error.networkException() = _NetworkException;

  const Error._();

  const factory Error.unauthorizedException() = _UnauthorizedException;

  const factory Error.serverException() = _ServerException;

  const factory Error.needToUpdateAppException() = _NeedToUpdateAppException;

  const factory Error.unexpectedError() = _UnexpectedError;

  static Error getApiError(Response res) {
    try {
      Error _error;
      final message = res.data;
      if (res.statusCode == 401) {
        // 未認証
        _error = const Error.unauthorizedException();
      } else if (res.statusCode == 500) {
        // サーバーエラー
        _error = const Error.serverException();
      } else if (res.statusCode == 503) {
        // TODO: メンテナンス or 強制アップデート
        _error = const Error.needToUpdateAppException();
      } else {
        _error = const Error.unexpectedError();
      }
      return _error;
    } catch (_) {
      return const Error.unexpectedError();
    }
  }
}
