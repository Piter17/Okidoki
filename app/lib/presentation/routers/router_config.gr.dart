// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:collection/collection.dart' as _i11;
import 'package:riv/presentation/dialogs/add_guild_page.dart' as _i1;
import 'package:riv/presentation/pages/common/empty_page.dart' as _i2;
import 'package:riv/presentation/pages/common/loading_page.dart' as _i4;
import 'package:riv/presentation/pages/guild_settings/guild_settings_page.dart'
    as _i3;
import 'package:riv/presentation/pages/login/login_page.dart' as _i5;
import 'package:riv/presentation/pages/login/register_page.dart' as _i7;
import 'package:riv/presentation/pages/main_page.dart' as _i6;
import 'package:riv/presentation/pages/settings/settings_page.dart' as _i8;
import 'package:riv/presentation/presentation.dart' as _i10;

/// generated route for
/// [_i1.AddGuildPage]
class AddGuildRoute extends _i9.PageRouteInfo<void> {
  const AddGuildRoute({List<_i9.PageRouteInfo>? children})
    : super(AddGuildRoute.name, initialChildren: children);

  static const String name = 'AddGuildRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddGuildPage();
    },
  );
}

/// generated route for
/// [_i2.EmptyPage]
class EmptyRoute extends _i9.PageRouteInfo<void> {
  const EmptyRoute({List<_i9.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.EmptyPage();
    },
  );
}

/// generated route for
/// [_i3.GuildSettingsPage]
class GuildSettingsRoute extends _i9.PageRouteInfo<GuildSettingsRouteArgs> {
  GuildSettingsRoute({
    _i10.Key? key,
    required List<_i10.SettingsTab> settings,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         GuildSettingsRoute.name,
         args: GuildSettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'GuildSettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GuildSettingsRouteArgs>();
      return _i3.GuildSettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class GuildSettingsRouteArgs {
  const GuildSettingsRouteArgs({this.key, required this.settings});

  final _i10.Key? key;

  final List<_i10.SettingsTab> settings;

  @override
  String toString() {
    return 'GuildSettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildSettingsRouteArgs) return false;
    return key == other.key &&
        const _i11.ListEquality<_i10.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i11.ListEquality<_i10.SettingsTab>().hash(settings);
}

/// generated route for
/// [_i4.LoadingPage]
class LoadingRoute extends _i9.PageRouteInfo<void> {
  const LoadingRoute({List<_i9.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoadingPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainPage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterPage();
    },
  );
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i10.Key? key,
    required List<_i8.SettingsTab> settings,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         SettingsRoute.name,
         args: SettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>();
      return _i8.SettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key, required this.settings});

  final _i10.Key? key;

  final List<_i8.SettingsTab> settings;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsRouteArgs) return false;
    return key == other.key &&
        const _i11.ListEquality<_i8.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i11.ListEquality<_i8.SettingsTab>().hash(settings);
}
