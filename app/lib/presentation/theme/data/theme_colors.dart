import 'package:riv/presentation/presentation.dart';
import 'package:tinycolor2/tinycolor2.dart';

class ThemeColors {
  final Brightness brightness;

  final ColorSet body;
  final ColorSet secondary;
  final ColorSet tertiary;
  final Color emphasis;
  final Color border;
  final Color borderTranslucent;
  final ColorSet primary;
  final ColorSet success;
  final ColorSet info;
  final ColorSet warrning;
  final ColorSet danger;
  final ColorSet light;
  final ColorSet dark;

  final List<BoxShadow> shadow;

  Color get hoverColor => borderTranslucent;

  final Color transparent;

  const ThemeColors._internal({
    required this.brightness,
    required this.body,
    required this.secondary,
    required this.tertiary,
    required this.emphasis,
    required this.primary,
    required this.border,
    required this.borderTranslucent,
    required this.success,
    required this.info,
    required this.warrning,
    required this.danger,
    required this.light,
    required this.dark,
    required this.shadow,
  }) : transparent = const Color(0x00000000);

  factory ThemeColors.light([Color primaryColor = const Color(0xff0d6efd)]) =>
      ThemeColors._internal(
        brightness: Brightness.light,
        body: ColorSet(
          Color(0xff212529),
          Color(0xffffffff),
          Color(0xffdee2e6),
        ),
        secondary: ColorSet(
          Color(0xbf212529),
          Color(0xffe9ecef),
          Color(0xffdee2e6),
        ),
        tertiary: ColorSet(
          Color(0x80212529),
          Color(0xfff8f9fa),
          Color(0xffdee2e6),
        ),
        emphasis: Color(0xff000000),
        border: Color(0xffdee2e6),
        borderTranslucent: Color(0x2d000000),
        primary: ColorSet(
          primaryColor,
          Color(0xffcfe2ff),
          Color(0xff9ec5fe),
          Color(0xff052c65),
        ),
        // primary: ColorSet(
        //   Color(0xff0d6efd),
        //   Color(0xffcfe2ff),
        //   Color(0xff9ec5fe),
        //   Color(0xff052c65),
        // ),
        success: ColorSet(
          Color(0xff198754),
          Color(0xffd1e7dd),
          Color(0xffa3cfbb),
          Color(0xff2b2f32),
        ),
        info: ColorSet(
          Color(0xff0dcaf0),
          Color(0xffcff4fc),
          Color(0xff9eeaf9),
          Color(0xff055160),
        ),
        warrning: ColorSet(
          Color(0xffffc107),
          Color(0xfffff3cd),
          Color(0xffffe69c),
          Color(0xff664d03),
        ),
        danger: ColorSet(
          Color(0xffdc3545),
          Color(0xfff8d7da),
          Color(0xfff8d7da),
          Color(0xff58151c),
        ),
        light: ColorSet(
          Color(0xfff8f9fa),
          Color(0xfffcfcfd),
          Color(0xffe9ecef),
          Color(0xff495057),
        ),
        dark: ColorSet(
          Color(0xff212529),
          Color(0xffced4da),
          Color(0xffadb5bd),
          Color(0xff495057),
        ),
        shadow: [
          BoxShadow(
            color: Color(0x20000000),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      );

  factory ThemeColors.dark([Color primaryColor = const Color(0xff0d6efd)]) =>
      ThemeColors._internal(
        brightness: Brightness.dark,
        body: ColorSet(Color(0xffdee2e6), Color(0xff212529), Color(0xff495057)),
        secondary: ColorSet(
          Color(0xbfdee2e6),
          Color(0xff343a40),
          Color(0xff495057),
        ),
        tertiary: ColorSet(
          Color(0x80dee2e6),
          Color(0xff2b3035),
          Color(0xff495057),
        ),
        emphasis: Color(0xff000000),
        border: Color(0xff495057),
        borderTranslucent: Color(0x26ffffff),
        // primary: ColorSet(
        //   Color(0xff0d6efd),
        //   Color(0xff031633),
        //   Color(0xff084298),
        //   Color(0xff6ea8fe),
        // ),
        primary: ColorSet(
          primaryColor,
          Color(0xff031633),
          Color(0xff084298),
          Color(0xff6ea8fe),
        ),
        success: ColorSet(
          Color(0xff198754),
          Color(0xff051b11),
          Color(0xff0f5132),
          Color(0xff75b798),
        ),
        info: ColorSet(
          Color(0xff0dcaf0),
          Color(0xff032830),
          Color(0xff087990),
          Color(0xff6edff6),
        ),
        warrning: ColorSet(
          Color(0xffffc107),
          Color(0xff332701),
          Color(0xff997404),
          Color(0xffffda6a),
        ),
        danger: ColorSet(
          Color(0xffdc3545),
          Color(0xff2c0b0e),
          Color(0xff842029),
          Color(0xffea868f),
        ),
        light: ColorSet(
          Color(0xfff8f9fa),
          Color(0xff343a40),
          Color(0xff495057),
          Color(0xfff8f9fa),
        ),
        dark: ColorSet(
          Color(0xff212529),
          Color(0xff1a1d20),
          Color(0xff343a40),
          Color(0xffdee2e6),
        ),
        shadow: [
          BoxShadow(
            color: Color(0x20FFFFFF),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      );
}

extension ColorX on Color {
  Color mixMain([int down = 10, int? up]) =>
      isDark ? tint(up ?? down) : shade(down);
}
