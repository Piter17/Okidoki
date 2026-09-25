import 'package:flutter/widgets.dart';

extension ValueNotifierExtensions<T> on ValueNotifier<T> {
  void set(T value) => this.value = value;
}

extension ValueNotifierBoolExtensions on ValueNotifier<bool> {
  void toggle() => value ^= true;
}
