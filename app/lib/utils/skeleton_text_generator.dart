import 'dart:math';

class TextGen {
  static const _placeholderWords = [
    'lorem',
    'ipsum',
    'dolor',
    'sit',
    'amet',
    'consectetur',
    'adipiscing',
    'elit',
    'integer',
    'nunc',
    'posuere',
    'semper',
    'faucibus',
    'vivamus',
    'fringilla',
    'bibendum',
  ];

  static final _minDate = DateTime(2022).millisecondsSinceEpoch;
  static final _maxDate = DateTime(2030).millisecondsSinceEpoch;

  static const _placeholderAlphabet = 'abcdefghijklmnopqrstuvwxyz';

  static String sentence(
    int minWords,
    int maxWords, {
    Random? random,
  }) {
    _validateRange(minWords, maxWords, 'word count', allowZero: true);

    final generator = random ?? Random();
    final wordCount = _randomInRange(minWords, maxWords, generator);
    return List.generate(
      wordCount,
      (_) => _placeholderWords[generator.nextInt(_placeholderWords.length)],
    ).join(' ');
  }

  static String word(
    int minLength,
    int maxLength, {
    Random? random,
  }) {
    _validateRange(minLength, maxLength, 'word length');

    final generator = random ?? Random();
    final length = _randomInRange(minLength, maxLength, generator);
    return List.generate(
      length,
      (_) =>
          _placeholderAlphabet[generator.nextInt(_placeholderAlphabet.length)],
    ).join();
  }

  static int _randomInRange(int min, int max, Random random) {
    return min + random.nextInt(max - min + 1);
  }

  static void _validateRange(
    int min,
    int max,
    String name, {
    bool allowZero = false,
  }) {
    final lowestValue = allowZero ? 0 : 1;
    if (min < lowestValue || max < lowestValue || min > max) {
      throw ArgumentError('Invalid $name range: $min..$max');
    }
  }

  static DateTime randomDateTime({
    DateTime? minimal,
    DateTime? maximal,
    Random? random,
  }) {
    final min = minimal?.millisecondsSinceEpoch ?? _minDate;
    final max = maximal?.millisecondsSinceEpoch ?? _maxDate;
    final generator = random ?? Random();
    final rand = generator.nextInt(1 << 31) << 31 + generator.nextInt(1 << 31);
    final timeStamp = rand % (max - min) + min;
    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  static String nick() => word(5, 15);
  static String guildName() => word(5, 15);
  static String channelName() => sentence(1, 3);
  static String message() => word(8, 20);
  static DateTime date() => randomDateTime();
}
