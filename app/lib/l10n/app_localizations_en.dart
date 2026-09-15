// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get generic_search => 'Search';

  @override
  String get app_title => 'Okidoki';

  @override
  String get generic_back => 'Back';

  @override
  String get generic_close => 'Close';

  @override
  String get generic_error => 'Error';

  @override
  String get generic_copy_id => 'Copy ID';

  @override
  String get generic_edit => 'Edit';

  @override
  String get generic_delete => 'Delete';

  @override
  String get generic_email => 'Email';

  @override
  String get generic_password => 'Password';

  @override
  String get generic_login => 'Log in';

  @override
  String get generic_register => 'Register';

  @override
  String get generic_save => 'Save';

  @override
  String get generic_discard => 'Discard';

  @override
  String get generic_color => 'Color';

  @override
  String get generic_logoff => 'Log out';

  @override
  String get settings_account => 'Account';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_devices => 'Devices';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_language_and_time => 'Language & Time';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_user => 'User settings';

  @override
  String get settings_back => 'Back';

  @override
  String get settings_profile => 'Profile';

  @override
  String get settings_light_theme => 'Light theme';

  @override
  String get settings_primary_color => 'Primary color';

  @override
  String get settings_color_red => 'Red';

  @override
  String get settings_color_green => 'Green';

  @override
  String get settings_color_blue => 'Blue';

  @override
  String get settings_theme_title => 'Theme';

  @override
  String get profile_display_name => 'Display name';

  @override
  String get profile_account_name => 'Account name';

  @override
  String get profile_placeholder => 'Profile option';

  @override
  String get guild_add_channel => 'Add channel';

  @override
  String get guild_remove_channel => 'Remove channel';

  @override
  String guild_invite_friends(String guildName) {
    return 'Invite friends to: $guildName';
  }

  @override
  String get guild_settings => 'Guild settings';

  @override
  String get guild_profile => 'Profile';

  @override
  String get guild_private_message => 'Private message';

  @override
  String get guild_invite_server => 'Invite to server';

  @override
  String get guild_invite_friend => 'Invite to friends';

  @override
  String get guild_create_title => 'Create a new guild';

  @override
  String get guild_create_button => 'Create guild';

  @override
  String get guild_join_prompt => 'Have an invitation?';

  @override
  String get guild_join_title => 'Join guild';

  @override
  String get guild_join_button => 'Join guild';

  @override
  String get guild_title => 'Guild';

  @override
  String get guild_name => 'Guild name';

  @override
  String get guild_roles => 'Roles';

  @override
  String auth_connection_error(String error) {
    return 'Unable to connect to the server\n$error';
  }

  @override
  String get generic_retry => 'Try again';

  @override
  String get auth_go_to_login => 'Go to login';

  @override
  String chat_message_hint(String channelName) {
    return 'Write to @$channelName';
  }

  @override
  String get chat_invitation_idle => 'Waiting';

  @override
  String get chat_invitation_pending => 'Loading';

  @override
  String get chat_invitation_error => 'An error occurred';

  @override
  String friends_received(int count) {
    return 'Received: $count';
  }

  @override
  String friends_sent(int count) {
    return 'Sent: $count';
  }

  @override
  String get friends_title => 'Friends';

  @override
  String get friends_empty => 'No friends';

  @override
  String get dirty_changes => 'You have unsaved changes';

  @override
  String get dm_empty => 'No messages';

  @override
  String get main_placeholder => 'Coming soon';

  @override
  String get user_status_placeholder => 'No status';

  @override
  String get profile_option_placeholder => 'Profile option';

  @override
  String get guild_role_placeholder => 'Role option';

  @override
  String get guild_members => 'Members';

  @override
  String get guild_channels => 'Channels';

  @override
  String get language_pl => 'Polish';

  @override
  String get language_en => 'English';

  @override
  String chat_messageModified(String date) {
    return 'Modified $date';
  }
}
