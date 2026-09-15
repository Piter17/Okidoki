import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:riv/presentation/presentation.dart';

class ThemeFonts {
  static const uiFontFamily = FontFamily.redHatDisplay;
  static const contentFontFamily = FontFamily.redHatText;
  static const codeFontFamily = FontFamily.redHatMono;

  final TextStyle chatSubNormal;
  final TextStyle chatNormal;
  final TextStyle chatHeading1;
  final TextStyle chatHeading2;
  final TextStyle chatHeading3;
  final TextStyle chatUser;
  final TextStyle chatDate;

  final TextStyle display;
  final TextStyle largeTitle;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle subtitle2Stronger;
  final TextStyle body;
  final TextStyle bodyStrong;
  final TextStyle bodyStronger;
  final TextStyle caption1;
  final TextStyle caption1Strong;
  final TextStyle caption1Stronger;
  final TextStyle caption2;
  final TextStyle caption2Strong;

  const ThemeFonts._internal({
    required this.chatSubNormal,
    required this.chatNormal,
    required this.chatHeading1,
    required this.chatHeading2,
    required this.chatHeading3,
    required this.chatUser,
    required this.chatDate,
    required this.display,
    required this.largeTitle,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle2Stronger,
    required this.body,
    required this.bodyStrong,
    required this.bodyStronger,
    required this.caption1,
    required this.caption1Strong,
    required this.caption1Stronger,
    required this.caption2,
    required this.caption2Strong,
  });

  factory ThemeFonts(ThemeColors colors) => ThemeFonts._internal(
    chatSubNormal: _chat(fontSize: 14, fontWeight: FontWeight.w400),
    chatNormal: _chat(fontWeight: FontWeight.w400),
    chatHeading1: _chatHeader(16, 22),
    chatHeading2: _chatHeader(20, 27.5),
    chatHeading3: _chatHeader(24, 33),
    chatUser: _chat(fontWeight: FontWeight.w500),
    chatDate: _chat(fontWeight: FontWeight.w500, fontSize: 12),
    display: _makeStyle(68, 92, FontWeight.w600),
    largeTitle: _makeStyle(40, 52, FontWeight.w600),
    title1: _makeStyle(32, 40, FontWeight.w600),
    title2: _makeStyle(28, 36, FontWeight.w600),
    title3: _makeStyle(24, 32, FontWeight.w600),
    subtitle1: _makeStyle(20, 26, FontWeight.w600),
    subtitle2: _makeStyle(16, 22, FontWeight.w600),
    subtitle2Stronger: _makeStyle(16, 22, FontWeight.w700),
    body: _makeStyle(14, 20, FontWeight.w400),
    bodyStrong: _makeStyle(14, 20, FontWeight.w600),
    bodyStronger: _makeStyle(14, 20, FontWeight.w700),
    caption1: _makeStyle(12, 16, FontWeight.w400),
    caption1Strong: _makeStyle(12, 16, FontWeight.w600),
    caption1Stronger: _makeStyle(12, 16, FontWeight.w700),
    caption2: _makeStyle(10, 14, FontWeight.w400),
    caption2Strong: _makeStyle(10, 14, FontWeight.w600),
  );

  static TextStyle _makeStyle(
    double fontSize,
    double lineHeight,
    FontWeight weight,
  ) => TextStyle(
    fontFamily: uiFontFamily,
    fontSize: fontSize,
    height: lineHeight / fontSize,
    fontWeight: weight,
  );

  static TextStyle _chatHeader(double fontSize, double height) => TextStyle(
    fontFamily: contentFontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    height: fontSize / height,
  );

  static TextStyle _chat({
    required FontWeight fontWeight,
    double fontSize = 16,
  }) => TextStyle(
    fontFamily: contentFontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 22.0 / fontSize,
  );

  ThemeFonts copyWith({
    TextStyle? chatSubNormal,
    TextStyle? chatNormal,
    TextStyle? chatHeading1,
    TextStyle? chatHeading2,
    TextStyle? chatHeading3,
    TextStyle? chatUser,
    TextStyle? chatDate,
    TextStyle? display,
    TextStyle? largeTitle,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle2Stronger,
    TextStyle? body,
    TextStyle? bodyStrong,
    TextStyle? bodyStronger,
    TextStyle? caption1,
    TextStyle? caption1Strong,
    TextStyle? caption1Stronger,
    TextStyle? caption2,
    TextStyle? caption2Strong,
  }) {
    return ThemeFonts._internal(
      chatSubNormal: chatSubNormal ?? this.chatSubNormal,
      chatNormal: chatNormal ?? this.chatNormal,
      chatHeading1: chatHeading1 ?? this.chatHeading1,
      chatHeading2: chatHeading2 ?? this.chatHeading2,
      chatHeading3: chatHeading3 ?? this.chatHeading3,
      chatUser: chatUser ?? this.chatUser,
      chatDate: chatDate ?? this.chatDate,
      display: display ?? this.display,
      largeTitle: largeTitle ?? this.largeTitle,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      subtitle2Stronger: subtitle2Stronger ?? this.subtitle2Stronger,
      body: body ?? this.body,
      bodyStrong: bodyStrong ?? this.bodyStrong,
      bodyStronger: bodyStronger ?? this.bodyStronger,
      caption1: caption1 ?? this.caption1,
      caption1Strong: caption1Strong ?? this.caption1Strong,
      caption1Stronger: caption1Stronger ?? this.caption1Stronger,
      caption2: caption2 ?? this.caption2,
      caption2Strong: caption2Strong ?? this.caption2Strong,
    );
  }

  MarkdownStyleSheet getMarkdownStyle() {
    return MarkdownStyleSheet();
  }
}

extension TextStyleExtensions on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle asUrl() =>
      copyWith(decoration: TextDecoration.underline, decorationColor: color);

  // TextStyle withBold() =>
  //     copyWith(decoration: TextDecoration.underline);
}
