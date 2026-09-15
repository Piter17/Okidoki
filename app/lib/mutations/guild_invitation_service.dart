class GuildInvitationService {
  static final invitationFormat = RegExp(r'^[0-9A-Za-z]{10}$');

  /// add domain check
  static String? toInvitationCode(String? invitation) {
    if (invitation == null) return null;
    final uri = Uri.tryParse(invitation);
    final code = uri != null ? uri.path : invitation;
    return invitationFormat.hasMatch(code) ? code : null;
  }
}
