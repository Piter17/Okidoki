import 'package:api_bindings/api_bindings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riv/core/dio_logger.dart';
import 'package:riv/main.dart' show kServerBaseUrl;
import 'package:riv/providers/core/token_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client.g.dart';

@riverpod
class HttpClient extends _$HttpClient {
  @override
  FutureOr<ApiBindings> build({bool authenticated = true}) {
    debugPrint("httpClient.state.hasValue: ${state.hasValue}");
    final api =
        state.hasValue
              ? state.requireValue
              : ApiBindings(
                  dio: Dio(
                    BaseOptions(
                      baseUrl: kServerBaseUrl,
                      connectTimeout: const Duration(seconds: 10),
                      receiveTimeout: const Duration(seconds: 120),
                    ),
                  ),
                )
          ..dio.interceptors.add(
            DioLogger(
              requestHeader: true,
              responseHeader: true,
              requestBody: true,
              // enabled: false,
            ),
          );

    if (authenticated) {
      final token = ref.watch(tokenStorageProvider);
      if (token.hasValue && token.requireValue?.accessToken != null) {
        final aToken = token.requireValue!.accessToken;
        api.setBearerAuth("Bearer", aToken);
      }
    }

    return api;
  }
}
