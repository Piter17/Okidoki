// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:collection/collection.dart' as _i13;
import 'package:riv/presentation/dialogs/add_guild_page.dart' as _i1;
import 'package:riv/presentation/pages/authenticated_page.dart' as _i2;
import 'package:riv/presentation/pages/chat/chat_host_page.dart' as _i3;
import 'package:riv/presentation/pages/common/empty_page.dart' as _i4;
import 'package:riv/presentation/pages/common/loading_page.dart' as _i6;
import 'package:riv/presentation/pages/guild_settings/guild_settings_page.dart'
    as _i5;
import 'package:riv/presentation/pages/login/login_page.dart' as _i7;
import 'package:riv/presentation/pages/login/register_page.dart' as _i9;
import 'package:riv/presentation/pages/main_page.dart' as _i8;
import 'package:riv/presentation/pages/settings/settings_page.dart' as _i10;
import 'package:riv/presentation/presentation.dart' as _i12;

/// generated route for
/// [_i1.AddGuildPage]
class AddGuildRoute extends _i11.PageRouteInfo<void> {
  const AddGuildRoute({List<_i11.PageRouteInfo>? children})
    : super(AddGuildRoute.name, initialChildren: children);

  static const String name = 'AddGuildRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddGuildPage();
    },
  );
}

/// generated route for
/// [_i2.AuthenticatedPage]
class AuthenticatedRoute extends _i11.PageRouteInfo<void> {
  const AuthenticatedRoute({List<_i11.PageRouteInfo>? children})
    : super(AuthenticatedRoute.name, initialChildren: children);

  static const String name = 'AuthenticatedRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthenticatedPage();
    },
  );
}

/// generated route for
/// [_i3.ChatHostPage]
class ChatHostRoute extends _i11.PageRouteInfo<void> {
  const ChatHostRoute({List<_i11.PageRouteInfo>? children})
    : super(ChatHostRoute.name, initialChildren: children);

  static const String name = 'ChatHostRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChatHostPage();
    },
  );
}

/// generated route for
/// [_i4.EmptyPage]
class EmptyRoute extends _i11.PageRouteInfo<void> {
  const EmptyRoute({List<_i11.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.EmptyPage();
    },
  );
}

/// generated route for
/// [_i5.GuildSettingsPage]
class GuildSettingsRoute extends _i11.PageRouteInfo<GuildSettingsRouteArgs> {
  GuildSettingsRoute({
    _i12.Key? key,
    required List<_i12.SettingsTab> settings,
    required String guildId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         GuildSettingsRoute.name,
         args: GuildSettingsRouteArgs(
           key: key,
           settings: settings,
           guildId: guildId,
         ),
         initialChildren: children,
       );

  static const String name = 'GuildSettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GuildSettingsRouteArgs>();
      return _i5.GuildSettingsPage(
        key: args.key,
        settings: args.settings,
        guildId: args.guildId,
      );
    },
  );
}

class GuildSettingsRouteArgs {
  const GuildSettingsRouteArgs({
    this.key,
    required this.settings,
    required this.guildId,
  });

  final _i12.Key? key;

  final List<_i12.SettingsTab> settings;

  final String guildId;

  @override
  String toString() {
    return 'GuildSettingsRouteArgs{key: $key, settings: $settings, guildId: $guildId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildSettingsRouteArgs) return false;
    return key == other.key &&
        const _i13.ListEquality<_i12.SettingsTab>().equals(
          settings,
          other.settings,
        ) &&
        guildId == other.guildId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i13.ListEquality<_i12.SettingsTab>().hash(settings) ^
      guildId.hashCode;
}

/// generated route for
/// [_i6.LoadingPage]
class LoadingRoute extends _i11.PageRouteInfo<void> {
  const LoadingRoute({List<_i11.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoadingPage();
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.MainPage();
    },
  );
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterPage();
    },
  );
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i12.Key? key,
    required List<_i10.SettingsTab> settings,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         SettingsRoute.name,
         args: SettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>();
      return _i10.SettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key, required this.settings});

  final _i12.Key? key;

  final List<_i10.SettingsTab> settings;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsRouteArgs) return false;
    return key == other.key &&
        const _i13.ListEquality<_i10.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i13.ListEquality<_i10.SettingsTab>().hash(settings);
}
