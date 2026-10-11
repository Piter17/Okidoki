import 'package:intl/intl.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/utils/utils.dart';

extension LanguageExtension on S {
  Formatter get formatter =>
      FormatterPL(); //(localeName == 'en') ? FormatterUS() : FormatterPL();
}

extension ContextSX on BuildContext {
  S get s => S.of(this)!;

  FlexTranslations get flexTranslations => FlexTranslations(s: s);
  Formatter get formatter => s.formatter;
}

abstract class Formatter {
  String formatMessageTime(DateTime dateTime);
  String formatTime(DateTime dateTime);
}

class FormatterPL extends Formatter {
  final _timeFormatter = DateFormat('HH:mm', 'pl_PL');
  final _dateTimeFormatter = DateFormat('dd-MM-yyyy HH:mm', 'pl_PL');
  @override
  String formatMessageTime(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.isSameDay(now)
        ? _timeFormatter.format(dateTime)
        : _dateTimeFormatter.format(dateTime);
  }

  @override
  String formatTime(DateTime dateTime) => _timeFormatter.format(dateTime);
}

class FlexTranslations({required final S s}) {
  // ignore: non_constant_identifier_names
  String Default(GenForm form) => switch (form) {
    GenForm.male => s.generic_default_singularMasculine,
    GenForm.female => s.generic_default_singularFeminine,
    GenForm.neuter => s.generic_default_singularNeuter,
    GenForm.males => s.generic_default_pluralMasculine,
    GenForm.nonMales => s.generic_default_pluralNonMasculine,
  };
}

enum GenForm {
  male,
  female,
  neuter,
  males,
  nonMales,
}
