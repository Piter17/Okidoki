import 'dart:ui';

import 'package:tinycolor2/tinycolor2.dart';

class ColorSet {
  new(
    this.color,
    this.background,
    this.border, [
    Color? text,
  ]) : text =
           text ?? (background.isDark ? Color(0xffffffff) : Color(0xff000000));

  new n({
    required this.color,
    required this.background,
    required this.border,
    required this.text,
  });

  final Color color;
  final Color background;
  final Color border;
  final Color text;

  // TinyColor get a => TinyColorExtension;

  Color get hoveredColor => color.isDark ? color.lighten() : color.brighten();
  // Color get activeColor =>

  Color get disColor => color.isDark ? color.lighten(20) : color.brighten(20);
  Color get disabledColor =>
      color.isDark ? color.desaturate() : color.desaturate();
}

// @mixin button-variant(
//   $background,
//   $border,
//   $color: color-contrast($background),
//   $hover-background: if($color == $color-contrast-light, shade-color($background, $btn-hover-bg-shade-amount), tint-color($background, $btn-hover-bg-tint-amount)),
//   $hover-border: if($color == $color-contrast-light, shade-color($border, $btn-hover-border-shade-amount), tint-color($border, $btn-hover-border-tint-amount)),
//   $hover-color: color-contrast($hover-background),
//   $active-background: if($color == $color-contrast-light, shade-color($background, $btn-active-bg-shade-amount), tint-color($background, $btn-active-bg-tint-amount)),
//   $active-border: if($color == $color-contrast-light, shade-color($border, $btn-active-border-shade-amount), tint-color($border, $btn-active-border-tint-amount)),
//   $active-color: color-contrast($active-background),
//   $disabled-background: $background,
//   $disabled-border: $border,
//   $disabled-color: color-contrast($disabled-background)
// ) {
//   --#{$prefix}btn-color: #{$color};
//   --#{$prefix}btn-bg: #{$background};
//   --#{$prefix}btn-border-color: #{$border};
//   --#{$prefix}btn-hover-color: #{$hover-color};
//   --#{$prefix}btn-hover-bg: #{$hover-background};
//   --#{$prefix}btn-hover-border-color: #{$hover-border};
//   --#{$prefix}btn-focus-shadow-rgb: #{to-rgb(mix($color, $border, 15%))};
//   --#{$prefix}btn-active-color: #{$active-color};
//   --#{$prefix}btn-active-bg: #{$active-background};
//   --#{$prefix}btn-active-border-color: #{$active-border};
//   --#{$prefix}btn-active-shadow: #{$btn-active-box-shadow};
//   --#{$prefix}btn-disabled-color: #{$disabled-color};
//   --#{$prefix}btn-disabled-bg: #{$disabled-background};
//   --#{$prefix}btn-disabled-border-color: #{$disabled-border};
// }

// $btn-hover-bg-shade-amount:       15%;
// $btn-hover-bg-tint-amount:        15%;
// $btn-hover-border-shade-amount:   20%;
// $btn-hover-border-tint-amount:    10%;
// $btn-active-bg-shade-amount:      20%;
// $btn-active-bg-tint-amount:       20%;
// $btn-active-border-shade-amount:  25%;
// $btn-active-border-tint-amount:   10%;
