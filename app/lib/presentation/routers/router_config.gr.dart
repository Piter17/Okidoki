// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:collection/collection.dart' as _i15;
import 'package:riv/mutations/mutations.dart' as _i16;
import 'package:riv/presentation/dialogs/add_guild_page.dart' as _i1;
import 'package:riv/presentation/pages/common/empty_page.dart' as _i3;
import 'package:riv/presentation/pages/common/loading_page.dart' as _i8;
import 'package:riv/presentation/pages/guild/chat_page.dart' as _i5;
import 'package:riv/presentation/pages/guild/guild_chat_page.dart' as _i6;
import 'package:riv/presentation/pages/guild_settings/guild_settings_page.dart'
    as _i7;
import 'package:riv/presentation/pages/login/initial_page.dart' as _i2;
import 'package:riv/presentation/pages/login/login_page.dart' as _i9;
import 'package:riv/presentation/pages/login/register_page.dart' as _i11;
import 'package:riv/presentation/pages/main_page/main_page.dart' as _i10;
import 'package:riv/presentation/pages/settings/settings_page.dart' as _i12;
import 'package:riv/presentation/presentation.dart' as _i14;
import 'package:riv/presentation/widgets/friends/friends_page.dart' as _i4;

/// generated route for
/// [_i1.AddGuildPage]
class AddGuildRoute extends _i13.PageRouteInfo<void> {
  const AddGuildRoute({List<_i13.PageRouteInfo>? children})
    : super(AddGuildRoute.name, initialChildren: children);

  static const String name = 'AddGuildRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddGuildPage();
    },
  );
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute({List<_i13.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthPage();
    },
  );
}

/// generated route for
/// [_i3.EmptyPage]
class EmptyRoute extends _i13.PageRouteInfo<void> {
  const EmptyRoute({List<_i13.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.EmptyPage();
    },
  );
}

/// generated route for
/// [_i4.FriendsPage]
class FriendsRoute extends _i13.PageRouteInfo<void> {
  const FriendsRoute({List<_i13.PageRouteInfo>? children})
    : super(FriendsRoute.name, initialChildren: children);

  static const String name = 'FriendsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.FriendsPage();
    },
  );
}

/// generated route for
/// [_i5.GuildChatPage]
class GuildChatRoute extends _i13.PageRouteInfo<GuildChatRouteArgs> {
  GuildChatRoute({
    _i14.Key? key,
    required String? channelId,
    required String guildId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         GuildChatRoute.name,
         args: GuildChatRouteArgs(
           key: key,
           channelId: channelId,
           guildId: guildId,
         ),
         rawPathParams: {'channelId': channelId, 'guildId': guildId},
         initialChildren: children,
       );

  static const String name = 'GuildChatRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GuildChatRouteArgs>(
        orElse: () => GuildChatRouteArgs(
          channelId: pathParams.optString('channelId'),
          guildId: pathParams.getString('guildId'),
        ),
      );
      return _i5.GuildChatPage(
        key: args.key,
        channelId: args.channelId,
        guildId: args.guildId,
      );
    },
  );
}

class GuildChatRouteArgs {
  const GuildChatRouteArgs({
    this.key,
    required this.channelId,
    required this.guildId,
  });

  final _i14.Key? key;

  final String? channelId;

  final String guildId;

  @override
  String toString() {
    return 'GuildChatRouteArgs{key: $key, channelId: $channelId, guildId: $guildId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildChatRouteArgs) return false;
    return key == other.key &&
        channelId == other.channelId &&
        guildId == other.guildId;
  }

  @override
  int get hashCode => key.hashCode ^ channelId.hashCode ^ guildId.hashCode;
}

/// generated route for
/// [_i6.GuildPage]
class GuildRoute extends _i13.PageRouteInfo<GuildRouteArgs> {
  GuildRoute({
    _i14.Key? key,
    required String guildId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         GuildRoute.name,
         args: GuildRouteArgs(key: key, guildId: guildId),
         rawPathParams: {'guildId': guildId},
         initialChildren: children,
       );

  static const String name = 'GuildRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GuildRouteArgs>(
        orElse: () => GuildRouteArgs(guildId: pathParams.getString('guildId')),
      );
      return _i6.GuildPage(key: args.key, guildId: args.guildId);
    },
  );
}

class GuildRouteArgs {
  const GuildRouteArgs({this.key, required this.guildId});

  final _i14.Key? key;

  final String guildId;

  @override
  String toString() {
    return 'GuildRouteArgs{key: $key, guildId: $guildId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildRouteArgs) return false;
    return key == other.key && guildId == other.guildId;
  }

  @override
  int get hashCode => key.hashCode ^ guildId.hashCode;
}

/// generated route for
/// [_i7.GuildSettingsPage]
class GuildSettingsRoute extends _i13.PageRouteInfo<GuildSettingsRouteArgs> {
  GuildSettingsRoute({
    _i14.Key? key,
    required List<_i14.SettingsTab> settings,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         GuildSettingsRoute.name,
         args: GuildSettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'GuildSettingsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GuildSettingsRouteArgs>();
      return _i7.GuildSettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class GuildSettingsRouteArgs {
  const GuildSettingsRouteArgs({this.key, required this.settings});

  final _i14.Key? key;

  final List<_i14.SettingsTab> settings;

  @override
  String toString() {
    return 'GuildSettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildSettingsRouteArgs) return false;
    return key == other.key &&
        const _i15.ListEquality<_i14.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i15.ListEquality<_i14.SettingsTab>().hash(settings);
}

/// generated route for
/// [_i8.LoadingPage]
class LoadingRoute extends _i13.PageRouteInfo<void> {
  const LoadingRoute({List<_i13.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoadingPage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i14.Key? key,
    required _i9.LoginForm form,
    required _i16.Mutation<dynamic> mutation,
    required bool isBusy,
    required _i14.VoidCallback goToRegister,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(
           key: key,
           form: form,
           mutation: mutation,
           isBusy: isBusy,
           goToRegister: goToRegister,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i9.LoginPage(
        key: args.key,
        form: args.form,
        mutation: args.mutation,
        isBusy: args.isBusy,
        goToRegister: args.goToRegister,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.form,
    required this.mutation,
    required this.isBusy,
    required this.goToRegister,
  });

  final _i14.Key? key;

  final _i9.LoginForm form;

  final _i16.Mutation<dynamic> mutation;

  final bool isBusy;

  final _i14.VoidCallback goToRegister;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, form: $form, mutation: $mutation, isBusy: $isBusy, goToRegister: $goToRegister}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key &&
        form == other.form &&
        mutation == other.mutation &&
        isBusy == other.isBusy &&
        goToRegister == other.goToRegister;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      form.hashCode ^
      mutation.hashCode ^
      isBusy.hashCode ^
      goToRegister.hashCode;
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.MainPage();
    },
  );
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i14.Key? key,
    required _i11.RegisterForm form,
    required _i16.Mutation<dynamic> mutation,
    required bool isBusy,
    required _i14.VoidCallback goToLogin,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(
           key: key,
           form: form,
           mutation: mutation,
           isBusy: isBusy,
           goToLogin: goToLogin,
         ),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i11.RegisterPage(
        key: args.key,
        form: args.form,
        mutation: args.mutation,
        isBusy: args.isBusy,
        goToLogin: args.goToLogin,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.form,
    required this.mutation,
    required this.isBusy,
    required this.goToLogin,
  });

  final _i14.Key? key;

  final _i11.RegisterForm form;

  final _i16.Mutation<dynamic> mutation;

  final bool isBusy;

  final _i14.VoidCallback goToLogin;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, form: $form, mutation: $mutation, isBusy: $isBusy, goToLogin: $goToLogin}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterRouteArgs) return false;
    return key == other.key &&
        form == other.form &&
        mutation == other.mutation &&
        isBusy == other.isBusy &&
        goToLogin == other.goToLogin;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      form.hashCode ^
      mutation.hashCode ^
      isBusy.hashCode ^
      goToLogin.hashCode;
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i14.Key? key,
    required List<_i12.SettingsTab> settings,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SettingsRoute.name,
         args: SettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'SettingsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>();
      return _i12.SettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key, required this.settings});

  final _i14.Key? key;

  final List<_i12.SettingsTab> settings;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsRouteArgs) return false;
    return key == other.key &&
        const _i15.ListEquality<_i12.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i15.ListEquality<_i12.SettingsTab>().hash(settings);
}
