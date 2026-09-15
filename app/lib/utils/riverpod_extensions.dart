import 'dart:async';

import 'package:api_bindings/api_bindings.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension RiverpodX on Ref {
  Ref cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
    return this;
  }

  Future<R> callUnauthApi<R>(
    Future<Response<R>> Function(ApiBindings api, CancelToken ct) f, [
    String? throwError,
  ]) => _callApi(f: f, throwError: throwError, authenticated: false);

  Future<R> callApi<R>(
    Future<Response<R>> Function(ApiBindings api, CancelToken ct) f, [
    String? throwError,
  ]) => _callApi(f: f, throwError: throwError, authenticated: true);

  Future<R> _callApi<R>({
    required Future<Response<R>> Function(ApiBindings api, CancelToken ct) f,
    required bool authenticated,
    String? throwError,
  }) {
    final api = read(httpClientProvider(authenticated: authenticated))
        .requireValue;
    final ct = CancelToken();
    onDispose(ct.cancel);
    return f(api, ct).resultOrThrow(throwError ?? "unkown error");
  }
}

extension TransactionMutationX on MutationTransaction {
  Future<R> callApiE<R, E>(
    Future<Response<R>> Function(ApiBindings api) f, {
    required String errorTitle,
    required dynamic Function(E ex) getError,
    bool authenticated = true,
  }) async {
    final api = get(httpClientProvider(authenticated: authenticated))
        .requireValue;
    try {
      final result = await f(api);
      if (result.isSuccess && result.data is R) {
        return result.data as R;
      }
      throw ApiException(
        errorTitle,
        "Request status code indicates success, but result could not be matched to response type (${R.toString()})",
        StackTrace.current,
      );
    } catch (e, st) {
      if (e is DioException) {
        final error = tryDeserialize<E>(e.response?.data);
        throw ApiException(errorTitle, getError(error), st);
      }
    }
    throw ApiException(
      errorTitle,
      "Request could not be handled. Unknown error <${R.toString()}, ${E.toString()}>.",
      StackTrace.current,
    );
  }

  Future<R> callApi<R>(
    Future<Response<R>> Function(ApiBindings api) f, {
    String? errorText,
    bool authenticated = true,
  }) {
    final api = get(httpClientProvider(authenticated: authenticated))
        .requireValue;
    return f(api).resultOrThrow(errorText ?? "unkown error");
  }
}

extension ResponseX<T> on Future<Response<T?>> {
  Future<T> resultOrThrow(String error) async {
    try {
      final result = await this;
      if (result.isSuccess && result.data is T) {
        return result.data as T;
      }
      throw Exception(error);
    } catch (e, st) {
      if (e is DioException) {
        debugPrint("resultOrThrow: ${e.response}");
        throw ApiException("Dio $error", e, st);
      }
      throw ApiException(error, e, st);
    }
  }
}
