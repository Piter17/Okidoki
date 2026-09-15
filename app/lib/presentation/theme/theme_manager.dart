import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

export 'package:riv/presentation/theme/data/typography.dart'
    show TextStyleExtensions;

class ThemeManager extends ConsumerStatefulWidget {
  const ThemeManager({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ThemeManager> createState() => ThemeManagerState();
}

class ThemeManagerState extends ConsumerState<ThemeManager> {
  late ThemeFonts fonts;
  late ThemeColors colors;
  late MarkdownStyleSheet markdownStyleSheet;
  late Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(appSettingsProvider);

    colors = settings.darkMode
        ? ThemeColors.light(Color(settings.color))
        : ThemeColors.dark(Color(settings.color));

    final fonts = ThemeFonts(colors);
    final values = Values(DeviceUtils.isPhone);
    return ThemeValues(
      colors: colors,
      fonts: fonts,
      values: values,
      markdownStyleSheet: fonts.getMarkdownStyle(),
      // child: widget.child,
      child: Builder(
        builder: (context) {
          return Theme(
            data: getTheme(context, fonts, colors, values),
            child: widget.child,
          );
        },
      ),
    );
  }
}

class ThemeValues extends InheritedWidget {
  const ThemeValues({
    super.key,
    required this.fonts,
    required this.colors,
    required this.values,
    required this.markdownStyleSheet,
    required super.child,
  });

  final ThemeFonts fonts;
  final ThemeColors colors;
  final Values values;

  ThemeFonts get f => fonts;
  ThemeColors get c => colors;
  Values get v => values;

  final MarkdownStyleSheet markdownStyleSheet;
  static ThemeValues of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeValues>()!;

  @override
  bool updateShouldNotify(covariant ThemeValues oldWidget) {
    return oldWidget.fonts != fonts ||
        oldWidget.colors != colors ||
        oldWidget.values != values ||
        oldWidget.markdownStyleSheet != markdownStyleSheet;
  }
}

enum ContextColors {
  body,
  primary,
  secondary,
  tertiary,
  success,
  info,
  warning,
  danger,
  light,
  dark;

  ColorSet getColorSet(BuildContext context) {
    final colors = context.colors;
    return switch (this) {
      ContextColors.body => colors.body,
      ContextColors.secondary => colors.secondary,
      ContextColors.tertiary => colors.tertiary,
      ContextColors.primary => colors.primary,
      ContextColors.success => colors.success,
      ContextColors.info => colors.info,
      ContextColors.warning => colors.warrning,
      ContextColors.danger => colors.danger,
      ContextColors.light => colors.light,
      ContextColors.dark => colors.dark,
    };
  }
}

// class ContextStyle extends StatelessWidget {
//   const new({
//     super.key,
//     required this.color,
//     required this.child,
//   });

//   final ContextColors color;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(data: getTheme(context, color), child: child);
//   }
// }
