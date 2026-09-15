// ignore: implementation_imports
import 'package:api_bindings/src/deserialize.dart' as api;
import 'package:riv/core/exceptions/deserialize_exception.dart';

T deserialize<T>(dynamic value, [String? targetType]) =>
    api.deserialize<T, T>(value, targetType ?? T.toString());

T tryDeserialize<T>(dynamic value) {
  try {
    return api.deserialize(value, T.toString());
  } catch (e, st) {
    throw DeserializeException(e, st);
  }
}
