import 'package:dio/dio.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:okidoki/core/core.dart';

Duration? riverpodRetryPolicy(int retryCount, Object error) {
  return null;
  if (retryCount >= 5) return null;
  if (error is ProviderException) return null;
  if (error is ApiException) {
    if (error.error is DioException) {
      if (error.error.type == DioExceptionType.badResponse) {
        if (error.error.response?.statusCode != 500) return null;
      }
    }
  }
  if (error is DioException) {
    if (error.type == .badResponse) {
      if (error.response?.statusCode != 500) return null;
    }
  }

  return Duration(milliseconds: 200 * (1 << retryCount));
}
