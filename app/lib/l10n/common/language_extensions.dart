import 'package:intl/intl.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/datatime_extensions.dart';

extension LanguageExtension on S {
  Formatter get formatter =>
      FormatterPL(); //(localeName == 'en') ? FormatterUS() : FormatterPL();
}

extension ContextSX on BuildContext {
  S get s => S.of(this)!;

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
