import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// No description provided for @generic_search.
  ///
  /// In pl, this message translates to:
  /// **'Szukaj'**
  String get generic_search;

  /// No description provided for @app_title.
  ///
  /// In pl, this message translates to:
  /// **'Okidoki'**
  String get app_title;

  /// No description provided for @generic_back.
  ///
  /// In pl, this message translates to:
  /// **'Wstecz'**
  String get generic_back;

  /// No description provided for @generic_close.
  ///
  /// In pl, this message translates to:
  /// **'Zamknij'**
  String get generic_close;

  /// No description provided for @generic_error.
  ///
  /// In pl, this message translates to:
  /// **'Błąd'**
  String get generic_error;

  /// No description provided for @generic_copy_id.
  ///
  /// In pl, this message translates to:
  /// **'Kopiuj ID'**
  String get generic_copy_id;

  /// No description provided for @generic_edit.
  ///
  /// In pl, this message translates to:
  /// **'Edytuj'**
  String get generic_edit;

  /// No description provided for @generic_delete.
  ///
  /// In pl, this message translates to:
  /// **'Usuń'**
  String get generic_delete;

  /// No description provided for @generic_email.
  ///
  /// In pl, this message translates to:
  /// **'E-mail'**
  String get generic_email;

  /// No description provided for @generic_password.
  ///
  /// In pl, this message translates to:
  /// **'Hasło'**
  String get generic_password;

  /// No description provided for @generic_login.
  ///
  /// In pl, this message translates to:
  /// **'Zaloguj się'**
  String get generic_login;

  /// No description provided for @generic_register.
  ///
  /// In pl, this message translates to:
  /// **'Zarejestruj się'**
  String get generic_register;

  /// No description provided for @generic_save.
  ///
  /// In pl, this message translates to:
  /// **'Zapisz'**
  String get generic_save;

  /// No description provided for @generic_discard.
  ///
  /// In pl, this message translates to:
  /// **'Odrzuć'**
  String get generic_discard;

  /// No description provided for @generic_color.
  ///
  /// In pl, this message translates to:
  /// **'Kolor'**
  String get generic_color;

  /// No description provided for @generic_logoff.
  ///
  /// In pl, this message translates to:
  /// **'Wyloguj się'**
  String get generic_logoff;

  /// No description provided for @settings_account.
  ///
  /// In pl, this message translates to:
  /// **'Konto'**
  String get settings_account;

  /// No description provided for @settings_theme.
  ///
  /// In pl, this message translates to:
  /// **'Wygląd'**
  String get settings_theme;

  /// No description provided for @settings_devices.
  ///
  /// In pl, this message translates to:
  /// **'Urządzenia'**
  String get settings_devices;

  /// No description provided for @settings_notifications.
  ///
  /// In pl, this message translates to:
  /// **'Powiadomienia'**
  String get settings_notifications;

  /// No description provided for @settings_language_and_time.
  ///
  /// In pl, this message translates to:
  /// **'Język i czas'**
  String get settings_language_and_time;

  /// No description provided for @settings_language.
  ///
  /// In pl, this message translates to:
  /// **'Język'**
  String get settings_language;

  /// No description provided for @settings_user.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia użytkownika'**
  String get settings_user;

  /// No description provided for @settings_back.
  ///
  /// In pl, this message translates to:
  /// **'Wstecz'**
  String get settings_back;

  /// No description provided for @settings_profile.
  ///
  /// In pl, this message translates to:
  /// **'Profil'**
  String get settings_profile;

  /// No description provided for @settings_light_theme.
  ///
  /// In pl, this message translates to:
  /// **'Motyw jasny'**
  String get settings_light_theme;

  /// No description provided for @settings_primary_color.
  ///
  /// In pl, this message translates to:
  /// **'Kolor dominujący'**
  String get settings_primary_color;

  /// No description provided for @settings_color_red.
  ///
  /// In pl, this message translates to:
  /// **'Czerwony'**
  String get settings_color_red;

  /// No description provided for @settings_color_green.
  ///
  /// In pl, this message translates to:
  /// **'Zielony'**
  String get settings_color_green;

  /// No description provided for @settings_color_blue.
  ///
  /// In pl, this message translates to:
  /// **'Niebieski'**
  String get settings_color_blue;

  /// No description provided for @settings_theme_title.
  ///
  /// In pl, this message translates to:
  /// **'Motyw'**
  String get settings_theme_title;

  /// No description provided for @profile_display_name.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa wyświetlana'**
  String get profile_display_name;

  /// No description provided for @profile_account_name.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa konta'**
  String get profile_account_name;

  /// No description provided for @profile_placeholder.
  ///
  /// In pl, this message translates to:
  /// **'Opcja profilu'**
  String get profile_placeholder;

  /// No description provided for @guild_add_channel.
  ///
  /// In pl, this message translates to:
  /// **'Dodaj kanał'**
  String get guild_add_channel;

  /// No description provided for @guild_remove_channel.
  ///
  /// In pl, this message translates to:
  /// **'Usuń kanał'**
  String get guild_remove_channel;

  /// No description provided for @guild_invite_friends.
  ///
  /// In pl, this message translates to:
  /// **'Zaproś znajomych na: {guildName}'**
  String guild_invite_friends(String guildName);

  /// No description provided for @guild_settings.
  ///
  /// In pl, this message translates to:
  /// **'Ustawienia gildii'**
  String get guild_settings;

  /// No description provided for @guild_profile.
  ///
  /// In pl, this message translates to:
  /// **'Profil'**
  String get guild_profile;

  /// No description provided for @guild_private_message.
  ///
  /// In pl, this message translates to:
  /// **'Wiadomość prywatna'**
  String get guild_private_message;

  /// No description provided for @guild_invite_server.
  ///
  /// In pl, this message translates to:
  /// **'Zaproś na serwer'**
  String get guild_invite_server;

  /// No description provided for @guild_invite_friend.
  ///
  /// In pl, this message translates to:
  /// **'Zaproś do znajomych'**
  String get guild_invite_friend;

  /// No description provided for @guild_create_title.
  ///
  /// In pl, this message translates to:
  /// **'Stwórz nową gildię'**
  String get guild_create_title;

  /// No description provided for @guild_create_button.
  ///
  /// In pl, this message translates to:
  /// **'Stwórz gildię'**
  String get guild_create_button;

  /// No description provided for @guild_join_prompt.
  ///
  /// In pl, this message translates to:
  /// **'Masz zaproszenie?'**
  String get guild_join_prompt;

  /// No description provided for @guild_join_title.
  ///
  /// In pl, this message translates to:
  /// **'Dołącz do gildii'**
  String get guild_join_title;

  /// No description provided for @guild_join_button.
  ///
  /// In pl, this message translates to:
  /// **'Dołącz do gildii'**
  String get guild_join_button;

  /// No description provided for @guild_title.
  ///
  /// In pl, this message translates to:
  /// **'Gildia'**
  String get guild_title;

  /// No description provided for @guild_name.
  ///
  /// In pl, this message translates to:
  /// **'Nazwa gildii'**
  String get guild_name;

  /// No description provided for @guild_roles.
  ///
  /// In pl, this message translates to:
  /// **'Role'**
  String get guild_roles;

  /// No description provided for @auth_connection_error.
  ///
  /// In pl, this message translates to:
  /// **'Nie można się połączyć z serwerem\n{error}'**
  String auth_connection_error(String error);

  /// No description provided for @generic_retry.
  ///
  /// In pl, this message translates to:
  /// **'Spróbuj ponownie'**
  String get generic_retry;

  /// No description provided for @auth_go_to_login.
  ///
  /// In pl, this message translates to:
  /// **'Przejdź na stronę logowania'**
  String get auth_go_to_login;

  /// No description provided for @chat_message_hint.
  ///
  /// In pl, this message translates to:
  /// **'Napisz na @{channelName}'**
  String chat_message_hint(String channelName);

  /// No description provided for @chat_invitation_idle.
  ///
  /// In pl, this message translates to:
  /// **'Oczekiwanie'**
  String get chat_invitation_idle;

  /// No description provided for @chat_invitation_pending.
  ///
  /// In pl, this message translates to:
  /// **'Ładowanie'**
  String get chat_invitation_pending;

  /// No description provided for @chat_invitation_error.
  ///
  /// In pl, this message translates to:
  /// **'Wystąpił błąd'**
  String get chat_invitation_error;

  /// No description provided for @friends_received.
  ///
  /// In pl, this message translates to:
  /// **'Otrzymano: {count}'**
  String friends_received(int count);

  /// No description provided for @friends_sent.
  ///
  /// In pl, this message translates to:
  /// **'Wysłano: {count}'**
  String friends_sent(int count);

  /// No description provided for @friends_title.
  ///
  /// In pl, this message translates to:
  /// **'Znajomi'**
  String get friends_title;

  /// No description provided for @friends_empty.
  ///
  /// In pl, this message translates to:
  /// **'Brak znajomych'**
  String get friends_empty;

  /// No description provided for @dirty_changes.
  ///
  /// In pl, this message translates to:
  /// **'Masz niezapisane zmiany'**
  String get dirty_changes;

  /// No description provided for @dm_empty.
  ///
  /// In pl, this message translates to:
  /// **'Brak wiadomości'**
  String get dm_empty;

  /// No description provided for @main_placeholder.
  ///
  /// In pl, this message translates to:
  /// **'Wkrótce dostępne'**
  String get main_placeholder;

  /// No description provided for @user_status_placeholder.
  ///
  /// In pl, this message translates to:
  /// **'Brak statusu'**
  String get user_status_placeholder;

  /// No description provided for @profile_option_placeholder.
  ///
  /// In pl, this message translates to:
  /// **'Opcja profilu'**
  String get profile_option_placeholder;

  /// No description provided for @guild_role_placeholder.
  ///
  /// In pl, this message translates to:
  /// **'Opcja roli'**
  String get guild_role_placeholder;

  /// No description provided for @guild_members.
  ///
  /// In pl, this message translates to:
  /// **'Członkowie'**
  String get guild_members;

  /// No description provided for @guild_channels.
  ///
  /// In pl, this message translates to:
  /// **'Kanały'**
  String get guild_channels;

  /// No description provided for @language_pl.
  ///
  /// In pl, this message translates to:
  /// **'Polski'**
  String get language_pl;

  /// No description provided for @language_en.
  ///
  /// In pl, this message translates to:
  /// **'Angielski'**
  String get language_en;

  /// No description provided for @chat_messageModified.
  ///
  /// In pl, this message translates to:
  /// **'Zmodyfikowano {date}'**
  String chat_messageModified(String date);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'pl':
      return SPl();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
