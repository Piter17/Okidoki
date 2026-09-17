// GENERATED CODE - DO NOT MODIFY BY HAND
typedef Decoder = Object Function(Map<String, dynamic>);

class JsonConverter {
  static T fromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    if (factory == null) throw StateError('No JSON factory registered for type T.');
    return factory(json) as T;
  }

  static T? tryFromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    return factory == null ? null : factory(json) as T;
  }

  static final Map<Type, Decoder> _factories = {
  };
}
