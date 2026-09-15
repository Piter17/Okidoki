import 'package:riv/presentation/presentation.dart';

typedef TranslationCallback = String Function(S context);

class Language({
  required final Locale locale,
  required final TranslationCallback name,
  final String? flag,
}) {
  static List<Language> list = [
    Language(
      locale: Locale("en"),
      name: (s) => s.language_en,
    ),
    Language(
      locale: Locale("pl"),
      name: (s) => s.language_pl,
    ),
  ];

  static List<Locale> get supportedLocales =>
      list.map((x) => x.locale).toList();

  String forStorage() => locale.toLanguageTag();

  static Language fromStorage(String code) =>
      list.firstWhere((x) => x.locale == Locale(code));
}
