// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class SPl extends S {
  SPl([String locale = 'pl']) : super(locale);

  @override
  String get generic_search => 'Szukaj';

  @override
  String get app_title => 'Okidoki';

  @override
  String get generic_back => 'Wstecz';

  @override
  String get generic_close => 'Zamknij';

  @override
  String get generic_error => 'Błąd';

  @override
  String get generic_copy_id => 'Kopiuj ID';

  @override
  String get generic_edit => 'Edytuj';

  @override
  String get generic_delete => 'Usuń';

  @override
  String get generic_email => 'E-mail';

  @override
  String get generic_password => 'Hasło';

  @override
  String get generic_login => 'Zaloguj się';

  @override
  String get generic_register => 'Zarejestruj się';

  @override
  String get generic_save => 'Zapisz';

  @override
  String get generic_discard => 'Odrzuć';

  @override
  String get generic_color => 'Kolor';

  @override
  String get generic_logoff => 'Wyloguj się';

  @override
  String get settings_account => 'Konto';

  @override
  String get settings_theme => 'Wygląd';

  @override
  String get settings_devices => 'Urządzenia';

  @override
  String get settings_notifications => 'Powiadomienia';

  @override
  String get settings_language_and_time => 'Język i czas';

  @override
  String get settings_language => 'Język';

  @override
  String get settings_user => 'Ustawienia użytkownika';

  @override
  String get settings_back => 'Wstecz';

  @override
  String get settings_profile => 'Profil';

  @override
  String get settings_light_theme => 'Motyw jasny';

  @override
  String get settings_primary_color => 'Kolor dominujący';

  @override
  String get settings_color_red => 'Czerwony';

  @override
  String get settings_color_green => 'Zielony';

  @override
  String get settings_color_blue => 'Niebieski';

  @override
  String get settings_theme_title => 'Motyw';

  @override
  String get profile_display_name => 'Nazwa wyświetlana';

  @override
  String get profile_account_name => 'Nazwa konta';

  @override
  String get profile_placeholder => 'Opcja profilu';

  @override
  String get guild_add_channel => 'Dodaj kanał';

  @override
  String get guild_remove_channel => 'Usuń kanał';

  @override
  String guild_invite_friends(String guildName) {
    return 'Zaproś znajomych na: $guildName';
  }

  @override
  String get guild_settings => 'Ustawienia gildii';

  @override
  String get guild_profile => 'Profil';

  @override
  String get guild_private_message => 'Wiadomość prywatna';

  @override
  String get guild_invite_server => 'Zaproś na serwer';

  @override
  String get guild_invite_friend => 'Zaproś do znajomych';

  @override
  String get guild_create_title => 'Stwórz nową gildię';

  @override
  String get guild_create_button => 'Stwórz gildię';

  @override
  String get guild_join_prompt => 'Masz zaproszenie?';

  @override
  String get guild_join_title => 'Dołącz do gildii';

  @override
  String get guild_join_button => 'Dołącz do gildii';

  @override
  String get guild_title => 'Gildia';

  @override
  String get guild_name => 'Nazwa gildii';

  @override
  String get guild_roles => 'Role';

  @override
  String auth_connection_error(String error) {
    return 'Nie można się połączyć z serwerem\n$error';
  }

  @override
  String get generic_retry => 'Spróbuj ponownie';

  @override
  String get auth_go_to_login => 'Przejdź na stronę logowania';

  @override
  String chat_message_hint(String channelName) {
    return 'Napisz na @$channelName';
  }

  @override
  String get chat_invitation_idle => 'Oczekiwanie';

  @override
  String get chat_invitation_pending => 'Ładowanie';

  @override
  String get chat_invitation_error => 'Wystąpił błąd';

  @override
  String friends_received(int count) {
    return 'Otrzymano: $count';
  }

  @override
  String friends_sent(int count) {
    return 'Wysłano: $count';
  }

  @override
  String get friends_title => 'Znajomi';

  @override
  String get friends_empty => 'Brak znajomych';

  @override
  String get dirty_changes => 'Masz niezapisane zmiany';

  @override
  String get dm_empty => 'Brak wiadomości';

  @override
  String get main_placeholder => 'Wkrótce dostępne';

  @override
  String get user_status_placeholder => 'Brak statusu';

  @override
  String get profile_option_placeholder => 'Opcja profilu';

  @override
  String get guild_role_placeholder => 'Opcja roli';

  @override
  String get guild_members => 'Członkowie';

  @override
  String get guild_channels => 'Kanały';

  @override
  String get language_pl => 'Polski';

  @override
  String get language_en => 'Angielski';

  @override
  String chat_messageModified(String date) {
    return 'Zmodyfikowano $date';
  }
}
