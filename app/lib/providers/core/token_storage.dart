import 'dart:async';

import 'package:api_bindings/api_bindings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riv/core/core.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage.g.dart';

class AccessToken {
  static const csvDelim = ';';

  final String accessToken;
  final String refreshToken;
  final DateTime validUntil;

  AccessToken({
    required this.accessToken,
    required this.refreshToken,
    required this.validUntil,
  });

  Duration get expiresIn => validUntil.difference(DateTime.now().toUtc());

  factory AccessToken.fromCsv(String csv) {
    final values = csv.split(csvDelim);
    if (values.length == 3) {
      return AccessToken(
        accessToken: values[0],
        refreshToken: values[1],
        validUntil: DateTime.parse(values[2]),
      );
    } else {
      throw Exception("Incorrect stored accesstoken");
    }
  }

  factory AccessToken.fromResult(AccessTokenResponse data) => AccessToken(
    accessToken: data.accessToken,
    refreshToken: data.refreshToken,
    validUntil: DateTime.now()
        .add(
          Duration(seconds: int.parse(data.expiresIn) - 60),
        )
        .toUtc(),
  );

  String toCsv() =>
      [accessToken, refreshToken, validUntil.toIso8601String()].join(csvDelim);
}

String _accessTokenKey() => "AccessToken";

@Riverpod(keepAlive: true)
class TokenStorage extends _$TokenStorage {
  Timer? _refreshTimer;

  @override
  FutureOr<AccessToken?> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    final token = await readToken();
    return token == null ? null : _initRefresh(token);
  }

  Future<AccessToken?> readToken() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: _accessTokenKey());

    return token.mapOr(AccessToken.fromCsv);
  }

  Future saveToken(AccessToken token) async {
    final refreshed = await _initRefresh(token);
    state = AsyncData(refreshed);
    final storage = ref.read(secureStorageProvider);
    await storage.write(key: _accessTokenKey(), value: refreshed.toCsv());
  }

  Future logOff() async {
    if (state.hasValue && state.value == null) {
      return;
    }
    ref.read(userSettingsProvider.notifier).setLastGuild(null);
    final storage = ref.read(secureStorageProvider);
    await storage.delete(key: _accessTokenKey());
    ref.invalidateSelf();
  }

  Future<AccessToken> _initRefresh(AccessToken token) async {
    debugPrint(
      "token remaining lifespan ${token.expiresIn}",
    );
    var refreshed = token;
    if (token.expiresIn < Duration(minutes: 3)) {
      refreshed = await _refreshToken(token.refreshToken);
    }
    _scheduleRefresh(refreshed.expiresIn);
    return refreshed;
  }

  void _scheduleRefresh(Duration expiresIn) {
    final delay = (expiresIn - Duration(minutes: 1)).clamp(
      Duration.zero,
      Duration(days: 1),
    );

    debugPrint("token refresh scheduled in $delay");

    _refreshTimer?.cancel();
    _refreshTimer = Timer(delay, refreshToken);
  }

  Future<AccessToken> _refreshToken(String refreshToken) {
    debugPrint("Refreshing access token");
    return ref
        .callUnauthApi(
          (x, ct) => x.getAuthApi().postRefresh(
            refreshRequest: RefreshRequest(refreshToken: refreshToken),
            cancelToken: ct,
          ),
          "Failed to refresh authenticaion token",
        )
        .then(AccessToken.fromResult)
        .onError((e, s) async {
          debugPrint("_refreshToken.onError");
          if (e is DioException) {
            if (e.response?.statusCode == 401) {
              // Refresh token is invalid. Logoff and remove from device.
              debugPrint("_refreshToken.onError 401");
              await logOff();
              ref.invalidateSelf();
              throw InvalidRefreshTokenException(error: e, stackTrace: s);
            }
          }
          throw ("Error while refreshing token", e, s);
        });
  }

  Future refreshToken() async {
    return state.requireValue?.refreshToken.mapOrElse(
      (refresh) => _refreshToken(refresh).then(saveToken),
      () => throw "Failed to read refresh token",
    );
  }
}

extension on Duration {
  Duration clamp(Duration min, Duration max) {
    if (min > max) {
      throw ArgumentError('Duration.clamp ($min) is greater than ($max).');
    }

    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}
