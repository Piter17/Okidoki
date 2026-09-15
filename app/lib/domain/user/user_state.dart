import 'package:riv/l10n/app_localizations.dart';

enum UserState {
  offline,
  doNotDisturb,
  away,
  online;

  String toLocalizedString(S s) => switch (this) {
    UserState.offline => s.generic_search,
    UserState.doNotDisturb => s.generic_search,
    UserState.away => s.generic_search,
    UserState.online => s.generic_search,
  };
}
