// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:collection/collection.dart' as _i17;
import 'package:okidoki/presentation/dialogs/add_guild_page.dart' as _i1;
import 'package:okidoki/presentation/pages/common/empty_page.dart' as _i3;
import 'package:okidoki/presentation/pages/common/loading_page.dart' as _i9;
import 'package:okidoki/presentation/pages/guild/chat_page.dart' as _i5;
import 'package:okidoki/presentation/pages/guild/guild_chat_page.dart' as _i6;
import 'package:okidoki/presentation/pages/guild_settings/guild_settings_page.dart'
    as _i7;
import 'package:okidoki/presentation/pages/login/initial_page.dart' as _i2;
import 'package:okidoki/presentation/pages/login/login_page.dart' as _i10;
import 'package:okidoki/presentation/pages/login/register_page.dart' as _i12;
import 'package:okidoki/presentation/pages/login/welcome_page.dart' as _i8;
import 'package:okidoki/presentation/pages/main_page/main_page.dart' as _i11;
import 'package:okidoki/presentation/pages/reset_page.dart' as _i13;
import 'package:okidoki/presentation/pages/settings/settings_page.dart' as _i14;
import 'package:okidoki/presentation/presentation.dart' as _i16;
import 'package:okidoki/presentation/widgets/friends/friends_page.dart' as _i4;

/// generated route for
/// [_i1.AddGuildPage]
class AddGuildRoute extends _i15.PageRouteInfo<void> {
  const AddGuildRoute({List<_i15.PageRouteInfo>? children})
    : super(AddGuildRoute.name, initialChildren: children);

  static const String name = 'AddGuildRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddGuildPage();
    },
  );
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i15.PageRouteInfo<void> {
  const AuthRoute({List<_i15.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthPage();
    },
  );
}

/// generated route for
/// [_i3.EmptyPage]
class EmptyRoute extends _i15.PageRouteInfo<void> {
  const EmptyRoute({List<_i15.PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.EmptyPage();
    },
  );
}

/// generated route for
/// [_i4.FriendsPage]
class FriendsRoute extends _i15.PageRouteInfo<void> {
  const FriendsRoute({List<_i15.PageRouteInfo>? children})
    : super(FriendsRoute.name, initialChildren: children);

  static const String name = 'FriendsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.FriendsPage();
    },
  );
}

/// generated route for
/// [_i5.GuildChatPage]
class GuildChatRoute extends _i15.PageRouteInfo<GuildChatRouteArgs> {
  GuildChatRoute({
    _i16.Key? key,
    required int? channelId,
    required int guildId,
    List<_i15.PageRouteInfo>? children,
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

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GuildChatRouteArgs>(
        orElse: () => GuildChatRouteArgs(
          channelId: pathParams.optInt('channelId'),
          guildId: pathParams.getInt('guildId'),
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

  final _i16.Key? key;

  final int? channelId;

  final int guildId;

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
class GuildRoute extends _i15.PageRouteInfo<GuildRouteArgs> {
  GuildRoute({
    _i16.Key? key,
    required int guildId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         GuildRoute.name,
         args: GuildRouteArgs(key: key, guildId: guildId),
         rawPathParams: {'guildId': guildId},
         initialChildren: children,
       );

  static const String name = 'GuildRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<GuildRouteArgs>(
        orElse: () => GuildRouteArgs(guildId: pathParams.getInt('guildId')),
      );
      return _i6.GuildPage(key: args.key, guildId: args.guildId);
    },
  );
}

class GuildRouteArgs {
  const GuildRouteArgs({this.key, required this.guildId});

  final _i16.Key? key;

  final int guildId;

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
class GuildSettingsRoute extends _i15.PageRouteInfo<GuildSettingsRouteArgs> {
  GuildSettingsRoute({
    _i16.Key? key,
    required List<_i16.SettingsTab> settings,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         GuildSettingsRoute.name,
         args: GuildSettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'GuildSettingsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GuildSettingsRouteArgs>();
      return _i7.GuildSettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class GuildSettingsRouteArgs {
  const GuildSettingsRouteArgs({this.key, required this.settings});

  final _i16.Key? key;

  final List<_i16.SettingsTab> settings;

  @override
  String toString() {
    return 'GuildSettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GuildSettingsRouteArgs) return false;
    return key == other.key &&
        const _i17.ListEquality<_i16.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i17.ListEquality<_i16.SettingsTab>().hash(settings);
}

/// generated route for
/// [_i8.InvitePage]
class InviteRoute extends _i15.PageRouteInfo<InviteRouteArgs> {
  InviteRoute({
    _i16.Key? key,
    required String guildInvitationCode,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         InviteRoute.name,
         args: InviteRouteArgs(
           key: key,
           guildInvitationCode: guildInvitationCode,
         ),
         rawPathParams: {'guildInvitationCode': guildInvitationCode},
         initialChildren: children,
       );

  static const String name = 'InviteRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<InviteRouteArgs>(
        orElse: () => InviteRouteArgs(
          guildInvitationCode: pathParams.getString('guildInvitationCode'),
        ),
      );
      return _i8.InvitePage(
        key: args.key,
        guildInvitationCode: args.guildInvitationCode,
      );
    },
  );
}

class InviteRouteArgs {
  const InviteRouteArgs({this.key, required this.guildInvitationCode});

  final _i16.Key? key;

  final String guildInvitationCode;

  @override
  String toString() {
    return 'InviteRouteArgs{key: $key, guildInvitationCode: $guildInvitationCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InviteRouteArgs) return false;
    return key == other.key && guildInvitationCode == other.guildInvitationCode;
  }

  @override
  int get hashCode => key.hashCode ^ guildInvitationCode.hashCode;
}

/// generated route for
/// [_i9.LoadingPage]
class LoadingRoute extends _i15.PageRouteInfo<void> {
  const LoadingRoute({List<_i15.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoadingPage();
    },
  );
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginPage();
    },
  );
}

/// generated route for
/// [_i11.MainPage]
class MainRoute extends _i15.PageRouteInfo<void> {
  const MainRoute({List<_i15.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.MainPage();
    },
  );
}

/// generated route for
/// [_i12.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i16.Key? key,
    String? guildInvitationCode,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(
           key: key,
           guildInvitationCode: guildInvitationCode,
         ),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
        orElse: () => const RegisterRouteArgs(),
      );
      return _i12.RegisterPage(
        key: args.key,
        guildInvitationCode: args.guildInvitationCode,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, this.guildInvitationCode});

  final _i16.Key? key;

  final String? guildInvitationCode;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, guildInvitationCode: $guildInvitationCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterRouteArgs) return false;
    return key == other.key && guildInvitationCode == other.guildInvitationCode;
  }

  @override
  int get hashCode => key.hashCode ^ guildInvitationCode.hashCode;
}

/// generated route for
/// [_i13.ResetPage]
class ResetRoute extends _i15.PageRouteInfo<void> {
  const ResetRoute({List<_i15.PageRouteInfo>? children})
    : super(ResetRoute.name, initialChildren: children);

  static const String name = 'ResetRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i13.ResetPage();
    },
  );
}

/// generated route for
/// [_i14.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i16.Key? key,
    required List<_i14.SettingsTab> settings,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SettingsRoute.name,
         args: SettingsRouteArgs(key: key, settings: settings),
         initialChildren: children,
       );

  static const String name = 'SettingsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>();
      return _i14.SettingsPage(key: args.key, settings: args.settings);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key, required this.settings});

  final _i16.Key? key;

  final List<_i14.SettingsTab> settings;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, settings: $settings}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsRouteArgs) return false;
    return key == other.key &&
        const _i17.ListEquality<_i14.SettingsTab>().equals(
          settings,
          other.settings,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i17.ListEquality<_i14.SettingsTab>().hash(settings);
}

/// generated route for
/// [_i8.WelcomePage]
class WelcomeRoute extends _i15.PageRouteInfo<void> {
  const WelcomeRoute({List<_i15.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.WelcomePage();
    },
  );
}
