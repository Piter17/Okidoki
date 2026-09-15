import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:riv/presentation/presentation.dart';

// class ColorScheme {
//   new({
//     required this.primary,
//     required this.background,
//     required this.text,
//     required this.border,
//   });

//   final Color primary;
//   final Color background;
//   final Color text;
//   final Color border;

//   Color get primaryDisabled => primary.desaturate();
//   Color get primaryHovered => primary.mixMain(15, 15);
//   // Color get borderSelected => ;
// }

ThemeData getTheme(
  BuildContext context,
  ThemeFonts fonts,
  ThemeColors colors,
  Values values,
) {
  // final colors = <String, String>{
  //   "text": "",
  //   "backgroundColor": "",
  //   "primaryColor": "",
  //   "disabledPrimary": "",
  //   "primaryHovered": "",
  //   "primaryPressed": "",
  //   "border": "",
  //   "borderSelected": "",
  //   "activeBorder": "",
  // };
  // final data =
  //     ThemeData.from(
  //       colorScheme: ColorScheme.fromSeed(
  //         seedColor: colors.primary.color,
  //         brightness: colors.brightness,
  //       ),
  //       // textTheme: Typography.black,
  //       useMaterial3: true,
  //     ).copyWith(
  final data = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: colors.primary.color,
      brightness: colors.brightness,
    ),
    // textTheme: Typography.black,
    useMaterial3: true,

    // fontFamily: FontFamily.redHatDisplay,
    scaffoldBackgroundColor: colors.body.background,
    brightness: colors.brightness,
    switchTheme: getSwitchTheme(context),

    // switchTheme: switchStyle(context),
    // sliderTheme: sliderStyle(context),
    // dividerTheme: divider(context),
    // toggleButtonsTheme: ToggleButtonsThemeData(
    //   borderColor: colors.transparent,
    // ),
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: context.colors.primary.color,
    //   brightness: context.colors.brightness,
    // ),
    inputDecorationTheme: getInputDecoration(colors, values),
    textTheme: TextTheme(
      // textEdit
      bodyLarge: fonts.bodyStronger,
    ),
    filledButtonTheme: ThemeButtons.getFilledButtonTheme(colors, values),

    // outlinedButtonTheme: ThemeButtons.getOutlinedButtonTheme(colors),
    textButtonTheme: ThemeButtons.getTextButtonTheme(colors, values, fonts),
    // dialogBackgroundColor: colors.neutral600,
    // bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.neutral600),
    extensions: [
      
    ]
  );
  return data;
}

extension ContextThemeX on BuildContext {
  ThemeValues get _t => ThemeValues.of(this);
  ThemeColors get colors => _t.colors;
  ThemeFonts get fonts => _t.fonts;
  Values get values => _t.values;

  Axis get flexDirection {
    final direction = findAncestorRenderObjectOfType<RenderFlex>()?.direction;

    if (direction == null) {
      throw "Missing RenderFlex parrent.";
    }

    return direction;
  }
}
