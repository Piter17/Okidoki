import 'package:riv/presentation/presentation.dart';

extension NullIterableX on Iterable {
  bool get anyNull => any((x) => x == null);
  bool get noNull => !anyNull;
}

extension NullableX<T> on T? {
  R? mapOr<R>(R Function(T value) f, [R? def]) =>
      this == null ? def : f(this as T);
  T orDefault(T def) => this ?? def;
  R mapOrElse<R>(R Function(T value) f, R Function() or) {
    return this == null ? or() : f(this as T);
  }

  T valueOrThrow(String error) => this == null ? throw Exception(error) : this!;
}

T pass<T>(T value) => value;

extension BoolX on bool {
  R? thenValue<R>(R r) => this ? r : null;
  R? then<R>(R Function() r) => this ? r() : null;
  R? elseCall<R>(R Function() r) => this == false ? r() : null;
  R? elseValue<R>(R r) => (!this).thenValue(r);
}

extension WidgetNullX<T extends Widget> on T {
  Widget wrapWith(
    WrapperBuilder<T> builder,
  ) => builder(this);

  Widget wrapIf(bool cond, WrapperBuilder<T> builder, [T? orElse]) =>
      cond ? builder(this) : orElse ?? this;

  Widget wrapOrElse(
    bool cond,
    WrapperBuilder<T> builder, [
    OrElseBuilder? orElse,
  ]) => cond
      ? builder(this)
      : orElse == null
      ? this
      : orElse();
}

typedef WrapperBuilder<T> = Widget Function(T child);
typedef OrElseBuilder = Widget Function();
